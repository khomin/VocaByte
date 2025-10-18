import os
from create_db import CreateDb
from source_storage import SourceStorage

from tqdm import tqdm
from db import Db
import json
import eng_to_ipa as ipa

# HOW TO AVOID THIS?

project_dir = os.getcwd() + "/../../"
dict_folder = os.path.join(project_dir, "cpp/ThirdParty/llama_dictionary")
freq_file_path = os.path.join(project_dir, "cpp/ThirdParty/100k_words/wiki-100k.txt")
# db_path = os.path.join(project_dir, "scripts/make_dictionary/database.db")
db_path = "/home/khomin/Desktop/vocabyte/migrating/new_db/database.db"
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

freq_list = []

# get 100k words
with open(freq_file_path, "r", errors='replace') as file:
    raw_freq_entire = file.read().splitlines()
    # filter comments
    for word in raw_freq_entire:
        if word[0] != '#':
            freq_list.append(word)
        else:
            print("skip word: " + word)

db = Db()
db.open_connection(db_path)
        
# copy dictionary in db and add frequency index
for file in dict_files:  
    file = open(os.path.join(dict_folder, file), "r", errors='replace')
    json_str = file.read()
    dict = json.loads(json_str)
    
    # find this for in frequency list
    for word in dict:
        freq = 0
        transcript = ""
        try:
            transcript = ipa.convert(word)
            freq = freq_list.index(word)
        except:
            freq = -1
        db.insert_record(word, freq, json.dumps(dict[word]), transcript)

print("Completed!")