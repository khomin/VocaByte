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

db_path = project_dir + "/scripts/make_dictionary/database.db"
dict_root = project_dir + "cpp/ThirdParty/llama_dictionary"
out_dict_path = project_dir + "cpp/ThirdParty/llama_dictionary"
fails_path = project_dir + "cpp/ThirdParty/llama_dictionary/fails.json"
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
            json.dump(json_obj, f, indent=4, ensure_ascii=False) 
    except Exception as e:
        print(f"Error saving json: {e}")

def write_json_fails(json_obj, path, file_name):
    try:
        os.mkdir(path)
    except Exception as e:
        None
    try:
        with open(os.path.join(path, file_name), 'w') as f:
            json.dump(json_obj, f, indent=4, ensure_ascii=False)
    except Exception as e:
        print(f"Error saving json: {e}")

def fix_unicode_escapes(s):
    # This process decodes the literal escape sequences (e.g., '\u00e9')
    # into the actual character (e.g., 'é').
    return s.encode('latin-1', 'backslashreplace').decode('unicode-escape')

# dictionary is different
# some words are removed

# need to add meanings id in current_words, use 0 as default

# sentences put in sentences.db with key or id from dictionary

# (**0.4**) - \*\*([,]?[+-]?\d+\.?\d*)\*\* 
# (**demand**), (**0.4**) - \(\*\*\S+\*\*\)
# remove **
# example_1 = "The entrepreneur dreamed of **exporting** her unique fashion designs to major retailers worldwide."
# # don't remove anything
# example_2 = "The cosecant is often represented by the symbol csc(x)."
# # remove (**xx**) + trim space
# example_3 = "The manager demanded that the sales team meet their monthly targets. (**demand**)"

# patter = re.compile(r"\(\*\*\S+\*\*\)")
# matches = patter.search(example_1)
# if matches:
#     value = matches.group(0)
#     print(value)
# matches = patter.search(example_2)
# if matches:
#     value = matches.group(0)
#     print(value)
# matches = patter.search(example_3)
# if matches:
#     value = matches.group(0)
#     print(value)

# # remove all (**0.0001%**) frequency indexes that llama mistakenly placed the examples
# pattern_1 = re.compile(r"\(\*\*\S+\*\*\)")
# pattern_2 = re.compile(r"\(\*\*\S+\%\)")
# pattern_3 = re.compile(r"\(\*\*.+\*\*\)")
# pattern_4 = re.compile(r"\(\*\*([\ ]|[\S]|[\d])+\)")
# pattern_5 = re.compile(r"\(\*\*\)")
# pattern_6 = re.compile(r"\*\*[0].+")
# pattern_7 = re.compile(r"\*\*\(\S+\)\*\*")
# pattern_8 = re.compile(r"\*\*\(.+\)\*\*")

# for dict_file in dict_files:
#     file = open(os.path.join(dict_root, dict_file))
#     json_str = file.read()
#     json_dict = json.loads(json_str)
#     # keys_to_delete = {}
#     for obj_key in json_dict:
#         examples = json_dict[obj_key]['examples']
#         # for example in examples:
#         for index, example in enumerate(examples):
#             # 1
#             match = pattern_1.search(example)
#             if match:
#                 start_part = example[:match.start()]
#                 end_part = example[match.end():]
#                 example = start_part + end_part
#                 example = example.rstrip(' .')
#                 examples[index] = example
#             # 2
#             match = pattern_2.search(example)
#             if match:
#                 start_part = example[:match.start()]
#                 end_part = example[match.end():]
#                 example = start_part + end_part
#                 example = example.rstrip(' .')
#                 examples[index] = example
#             # 3
#             match = pattern_3.search(example)
#             if match:
#                 start_part = example[:match.start()]
#                 end_part = example[match.end():]
#                 example = start_part + end_part
#                 example = example.rstrip(' .')
#                 examples[index] = example
#             # 4
#             match = pattern_4.search(example)
#             if match:
#                 start_part = example[:match.start()]
#                 end_part = example[match.end():]
#                 example = start_part + end_part
#                 example = example.rstrip(' .')
#                 examples[index] = example
#             # 5
#             match = pattern_5.search(example)
#             if match:
#                 start_part = example[:match.start()]
#                 end_part = example[match.end():]
#                 example = start_part + end_part
#                 example = example.rstrip(' .')
#             # 6
#             match = pattern_6.search(example)
#             if match:
#                 start_part = example[:match.start()]
#                 end_part = example[match.end():]
#                 example = start_part + end_part
#                 example = example.rstrip(' .')
#             # 7
#             match = pattern_7.search(example)
#             if match:
#                 start_part = example[:match.start()]
#                 end_part = example[match.end():]
#                 example = start_part + end_part
#                 example = example.rstrip(' .')
#             # 8
#             match = pattern_8.search(example)
#             if match:
#                 start_part = example[:match.start()]
#                 end_part = example[match.end():]
#                 example = start_part + end_part
#                 example = example.rstrip(' .')
#                 example = example.lstrip()
#             # **key**
#             example = example.replace("**", "")
#             # \u2013 for '–'
#             example = fix_unicode_escapes(example)
#             # replace
#             json_dict[obj_key]['examples'] = examples

#     write_json(json_dict, out_dict_path, dict_file)
#     print(f"done {dict_file}")

print('done, total len: {}', len(json_dict))

# # delete all keys from fails.json
# file = open(fails_path)
# json_fails = json.loads(file.read())
# for dict_file in dict_files:
#     file = open(os.path.join(dict_root, dict_file))
#     json_str = file.read()
#     json_dict = json.loads(json_str)
#     keys_to_delete = {}
#     for obj_key in json_dict:
#         if obj_key in json_fails:
#             keys_to_delete[obj_key] = obj_key
#     for key in keys_to_delete:
#         del json_dict[key]
#     write_json(json_dict, out_dict_path, dict_file)


# # generate 15 examples for each key
# for dict_file in dict_files:
#     file = open(os.path.join(dict_root, dict_file))
#     json_str = file.read()
#     json_dict = json.loads(json_str)
    
#     # search for words without 'examples' field
#     for obj_key in json_dict:
#         obj = json_dict[obj_key]
#         should_add_examples = False
#         try:
#             if len(obj["examples"]) < 5:
#                 should_add_examples = True
#         except:
#             should_add_examples = True

#         if should_add_examples:
#             if obj_key not in json_fails:
#                 print(f"Process word: {obj_key}")
#                 res_json = handle_llama(obj["word"])
#                 if res_json is not None:
#                     json_dict[obj_key]["freq"] = res_json["freq"]
#                     json_dict[obj_key]["examples"] = res_json["examples"]
#                     write_json(json_dict, out_dict_path, dict_file)
#                     print(f"Process word: -success: {obj_key}")
#                 else:
#                     json_fails[obj_key] = {}
#                     write_json_fails(json_fails, out_dict_path, 'fails.json')
#                     print(f"Process word: -failed: {obj_key}")
#             else:
#                 print(f"Word in fail list -skip: {obj_key}")
#         else:
#             print(f"Skip word: {obj_key}")
#             json_dict[obj_key] = obj
#     write_json(json_dict, out_dict_path, dict_file)
#     print('done, total len: {}', len(json_dict))