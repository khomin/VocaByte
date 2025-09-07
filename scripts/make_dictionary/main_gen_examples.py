import os
import ollama
from create_db import CreateDb
from source_storage import SourceStorage

from tqdm import tqdm
from db import Db
import json
import eng_to_ipa as ipa

project_dir = os.getcwd() + "/../../"

dict_root = project_dir + "cpp/ThirdParty/refined_dictionary"
db_path = project_dir + "/scripts/make_dictionary/database.db"
out_dict_path = project_dir + "cpp/ThirdParty/llama_dictionary"
dict_files = [
    'a.json',
    'b.json',
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

def handle_llama_batch(word_str):
    # llamam input
    request = "i have a list of words and i want you to give a json object for each word." \
        "Return a single json array containing an object for each word, using single line for single object" \
        "here's json object example:\n" \
        "{\"word\": \"example\",\"freq\": \"a number, the word's rank\", \"examples\":[ <PUT EXAMPLES HERE> ]}\n" \
        "Here are the rules for each JSON object:" \
        "- \"word\": - the word itself." \
        "- \"freq\": The word's rank (a number), using -1 if unknown" \
        "- \"examples\": - you need to generate 15 examples of a sentence with the given word\n" \
        "do not include any extra text, comments, or explanations inside the JSON\n" \
        "surround the main json with two ```, to separate it from comments\n" \
        "here is the list of the words for the task: \"%s\"\n" % (word_str)

    # Send a single request
    response = ollama.chat(
        model='llama3',
        messages=[
            {
                'role': 'user',
                'content': request,
            },
        ],
    )
    message = response['message']['content']
    print(message)
    start_index = message.find('```')
    end_index = message.find('```', start_index+3)
    sub_message = message[start_index + 3:end_index]
    # remove commens that llama may place
    sub_message = sub_message.replace("\\", "'")
    # parse every json object
    sub_message = sub_message.replace("json", "", 1)
    sub_message = sub_message.replace("...", "")
    sub_message = sub_message.replace("\n", "")
    last_symbols = sub_message[len(sub_message)-4:-1]
    # when llm adds extra command in the end
    index = last_symbols.find(",")
    if index != -1:
        sub_message[index] = " "
    # when llm doesn't add ']' in the end
    if sub_message[-1] != ']':
        sub_message += "]"
    try:
        json_obj = json.loads(sub_message)
        return json_obj
    except Exception as e:
        print(f"Invalid json: {e}")
    return None

def write_json(json_obj, path, file_name):
    try:
        os.mkdir(path)
    except Exception as e:
        print(f"Error mkdir: {e}")
    try:
        # out_file = open(os.path.join(path, file_name), 'w')
        # json.dump(json_obj, out_file, indent=4)
        # data = {
        #     "name": "Alice",
        #     "age": 30,
        #     "isStudent": False,
        #     "courses": ["Math", "Science"]
        # }
        # Dump the data to a JSON file with indentation for readability
        with open(os.path.join(path, file_name), 'w') as f:
            json.dump(json_obj, f, indent=4) 
    except Exception as e:
        print(f"Error saving json: {e}")

def queue_format_to_string(queue):
    str = ''
    for i in queue:
        str += i['word']
        if queue.index(i) != len(queue)-1:
            str += ", "
    return str 

for dict_file in dict_files:
    file = open(os.path.join(dict_root, dict_file))
    json_str = file.read()
    json_dict = json.loads(json_str)
    json_to_process = {}
    json_out = []
    
    # search for words without 'examples' field
    for obj_key in json_dict:
        obj = json_dict[obj_key]
        should_add_examples = False
        try:
            if len(obj["examples"] < 5):
                should_add_examples = True
            None
        except:
            should_add_examples = True
            None
        None

        if should_add_examples:
            json_to_process[obj["word"]] = obj
        else:
            json_out.append(obj)

    # process items with batch for efficiency
    queue = []
    force_end = False
    for obj_key in json_to_process:
        if force_end:
            break
        obj = json_to_process[obj_key]
        queue.append(obj)
        if len(queue) >= 20:
            words_str = queue_format_to_string(queue)
            queue = []
            res_json = handle_llama_batch(words_str)
            if res_json is None:
                # failed, can generate for these batch later
                queue = []
                break
            for res_obj in res_json:
                key = res_obj["word"]
                obj_modified = {}
                obj_modified[key] = json_dict[key]
                obj_modified[key]["examples"] = res_obj["examples"]
                obj_modified[key]["freq"] = res_obj["freq"]
                json_out.append(obj_modified)
                # force_end = True
            write_json(json_out, out_dict_path, dict_file)
        None
        
    print(json.dumps(json_out, indent=4))
    
    write_json(json_out, out_dict_path, dict_file)

    print('done, total len: {}', len(json_out))