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
        "Here are the rules for each JSON object:" \
        "- \"word\": - the word itself." \
        "- \"freq\": - the rank of the given word in WikiText corpus, if can't be found use -1" \
        "- \"examples\": - you have to generate 15 examples for the given word, in an array" \
        "here's json object example:\n" \
        "{\"word\": \"example\",\"freq\": \"a number, the word's rank\", \"examples\":[]}\n" \
        "don't place comments inside json (like // Not found in WikiText corpus)\n" \
        "Here is the list of the words for the task: \"%s\"\n" % (word_str)

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
    sub_message = sub_message.replace("...", "", 1)
    sub_message = sub_message.replace(",\n  \n]\n", "]")
    sub_message = sub_message.replace("},\n...\n", "}")
    json_obj = json.loads(sub_message)
    return json_obj

def write_json(json_obj, path, file_name):
    try:
        os.mkdir(path)
    except Exception as e:
        print(f"Error mkdir: {e}")
    try:
        # out_file = open(os.path.join(path, file_name), 'w')
        # json.dump(json_obj, out_file, indent=4)
        data = {
            "name": "Alice",
            "age": 30,
            "isStudent": False,
            "courses": ["Math", "Science"]
        }
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
        if len(queue) >= 50:
            words_str = queue_format_to_string(queue)
            queue = []
            res_json = handle_llama_batch(words_str)
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

    # while len(json_dict) > 0:
    #     keys = list(json_dict.keys())
    #     min_len = 0
    #     if len(json_dict) < BATCH_SIZE:
    #         min_len = len(json_dict)
    #     else:
    #         min_len = BATCH_SIZE
    #     batch_keys = keys[:min_len]
    #     words_str = ", ".join(batch_keys)
        
    #     print("Processing batch:", batch_keys)

    #     # Remove the processed items from the original dictionary
    #     for key in batch_keys:
    #         del json_dict[key]


#     jsonStr = f.read()
#     jsonV = json.loads(jsonStr)

# frequency = []

# # get 100k words
# f = open(frequencyFile, "r", errors='replace')
# raw_entire = f.read().splitlines()

# # filter comments
# for word in raw_entire:
#     if word[0] != '#':
#         frequency.append(word)
#     else:
#         print("skip word: " + word)


# # open db
# db = Db()
# db.open_connection(dbPath)
        
# # copy dictionary in db and add frequency index
# for file in dictFiles:  
#     f = open(dictFolder + file, "r", errors='replace')
#     jsonStr = f.read()
#     jsonV = json.loads(jsonStr)
    
#     # find this for in the frequency list
#     for word in jsonV:
#         freq = 0
#         transcript = ""
#         try:
#             transcript = ipa.convert(word)
#             freq = frequency.index(word)
#         except:
#             freq = -1
#         db.insert_record(word, freq, json.dumps(jsonV[word]), transcript)

# print("done")



# top_words = wordfreq.top_n_list('en', 1000000)
# word_the_rank = top_words.index('the') + 1 
# word_roll_up_rank = top_words.index('roll') + 1  # Adding 1 because list indices start at 0
# word_roll_up_rank = top_words.index('consecrate') + 1  # Adding 1 because list indices start at 0
# kowtow = top_words.index('kowtow') + 1  # Adding 1 because list indices start at 0

# def zipf_to_rank(zipf_freq, language='en'):
#     # Total number of tokens in the corpus (this value might need to be adjusted based on corpus specifics)
#     N = 30_000_000_000
    
#     # Calculate the frequency from the Zipf frequency
#     f = 10 ** (zipf_freq - 9) * N
    
#     # Estimate the rank
#     rank = N / f
    
#     return rank

# freq = wordfreq.zipf_frequency('roll up', 'en')
# freq = wordfreq.zipf_frequency('lpsds', 'en')
# freq = wordfreq.zipf_frequency('the', 'en')
# freq = wordfreq.zipf_frequency('consecrate', 'en')
# freq = wordfreq.zipf_frequency('prowl', 'en')


# rank_the = zipf_to_rank(wordfreq.zipf_frequency('the', 'en'))
# rank_roll_up = zipf_to_rank(wordfreq.zipf_frequency('roll up', 'en'))
# roll = zipf_to_rank(wordfreq.zipf_frequency('roll', 'en'))
# prowl = zipf_to_rank(wordfreq.zipf_frequency('prowl', 'en'))
# consecrate = zipf_to_rank(wordfreq.zipf_frequency('consecrate', 'en'))


# Download the NLTK data
# nltk.download('words')
# nltk.download('genesis')

# word_list2 = []

# Load the NLTK word list
# word_list = set(nltk.corpus.words.words())

# word_list_gen = nltk.corpus.genesis.words()

# Create a Counter object to store the frequency of each word
# word_freq = Counter()

# Iterate over the word list and count the frequency of each word
# for word in word_list:
#     # word_freq[word] += 1
#     word_list2.append(word)

# Print the top 10 most frequent words
# print(word_freq.most_common(10))

# v = word_list2[0]
# word_list2.reverse()
# count = 0
# for i in word_list2:
#     if i == 'thunder':
#         print(i)
#     count += 1

# print(v)



# db = Db()
# # db.create_connection(os.getcwd() + '/database.db')

# db.open_connection(os.getcwd() + '/database.db')
# db.insert_record()

# f = open(os.getcwd() + '/data_sources/' + it, "r", errors='replace')
# raw_entire = f.read().splitlines()

# formatted = self.__formatNewLines(raw_entire)

# entire.append(self.__splitByPunctuation(formatted))

# # fill_db = CreateDb()
# # number_of_lines = fill_db.start(source_storage)

# print("fill database done, number of lines: " + str(number_of_lines))

# source_storage = SourceStorage()
# sources_len = source_storage.getSize()

# if sources_len == 0:
#     print("sources list is empty\nPlease check the book directory")
# else:
#     print("sources_len size: " + str(sources_len))

#     fill_db = FillDb()
#     number_of_lines = fill_db.start(source_storage)

#     print("fill database done, number of lines: " + str(number_of_lines))
