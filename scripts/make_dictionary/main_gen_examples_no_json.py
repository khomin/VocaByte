import os
import ollama
import re
from create_db import CreateDb
from source_storage import SourceStorage

from tqdm import tqdm
from db import Db
import json
import eng_to_ipa as ipa

project_dir = os.getcwd() + "/../../"

# dict_root = project_dir + "cpp/ThirdParty/refined_dictionary"
db_path = project_dir + "/scripts/make_dictionary/database.db"
# out_dict_path = project_dir + "cpp/ThirdParty/llama_dictionary"
dict_root = project_dir + "cpp/ThirdParty/llama_dictionary"
out_dict_path = project_dir + "cpp/ThirdParty/llama_dictionary"
dict_files = [
    # 'a.json',
    # 'b.json',
    'c.json',
    'd.json',
    'e.json',
    'f.json',
    'g.json',
    'h.json',
    'i.json',
    'j.json',
    'k.json',
    'l.json',
    'm.json',
    'n.json',
    'o.json',
    'p.json',
    'q.json',
    'r.json',
    's.json',
    't.json',
    'u.json',
    'v.json',
    'w.json',
    'x.json',
    'y.json',
    'z.json'
]

def handle_llama(word):
    # llamam input
    request = "give me the rank (a float number enclosed in **, like **value**) of the word \"%s\" and 15 sentences with this word\nIf you can't provide any rank value use -1" % (word)

    # Send a single request
    response = ollama.chat(
        model='llama3',
        # options={
            # 'temperature': 0.0,  # A higher value for more creativity
            # 'top_p': 0.9,        # A higher value for more diverse word choices
            # 'mirostat_mode': 0,  # Or set a different mirostat mode
            # 'max_tokens': 100,
        # },
        messages=[
            {'role': 'system', 'content': 'You are a helpful assistant.'},
            {
                'role': 'user',
                'content': request,
            }
        ],
    )
    message = response['message']['content']
    # print(message)
    sub_message = {}
    rank_pattern = re.compile(r"\*\*([+-]?([0-9]*[.])?[0-9]+)\*\*")
    sentence_pattern = re.compile(r"\n(\d+)\.\s*(.+)")
    rank_match = rank_pattern.search(message)
    sentence_match = sentence_pattern.findall(message)
    sub_message["freq"] = 0
    sub_message["word"] = word
    if rank_match:
        try:
            rank = float(rank_match.group(1))
            sub_message["freq"] = rank
        except (ValueError, IndexError):
            pass
    if sentence_match:
        examples = []
        for match in sentence_match:
            number = match[0]
            sentence = match[1]
            examples.append(sentence)
        sub_message["examples"] = examples
        return sub_message

def write_json(json_obj, path, file_name):
    try:
        os.mkdir(path)
    except Exception as e:
        None
    try:
        with open(os.path.join(path, file_name), 'w') as f:
            json.dump(json_obj, f, indent=4) 
    except Exception as e:
        print(f"Error saving json: {e}")

for dict_file in dict_files:
    file = open(os.path.join(dict_root, dict_file))
    json_str = file.read()
    json_dict = json.loads(json_str)
    
    # search for words without 'examples' field
    for obj_key in json_dict:
        obj = json_dict[obj_key]
        should_add_examples = False
        try:
            if len(obj["examples"]) < 5:
                should_add_examples = True
        except:
            should_add_examples = True

        if should_add_examples:
            print(f"Process word: {obj_key}")
            res_json = handle_llama(obj["word"])
            if res_json is not None:
                json_dict[obj_key]["freq"] = res_json["freq"]
                json_dict[obj_key]["examples"] = res_json["examples"]
                write_json(json_dict, out_dict_path, dict_file)
                print(f"Process word: -success: {obj_key}")
            else:
                print(f"Process word: -failed: {obj_key}")
        else:
            print(f"Skip word: {obj_key}")
            json_dict[obj_key] = obj
        
    print(json.dumps(json_dict, indent=4))
    
    write_json(json_dict, out_dict_path, dict_file)

    print('done, total len: {}', len(json_dict))