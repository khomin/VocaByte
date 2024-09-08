import os
from create_db import CreateDb
from source_storage import SourceStorage

from tqdm import tqdm
from db import Db
import json
import eng_to_ipa as ipa
import wordfreq
# import nltk
# from collections import Counter

project_dir = os.getcwd() + "/../../"

top_words = wordfreq.top_n_list('en', 1000000)

word_the_rank = top_words.index('the') + 1 

word_roll_up_rank = top_words.index('roll') + 1  # Adding 1 because list indices start at 0

word_roll_up_rank = top_words.index('consecrate') + 1  # Adding 1 because list indices start at 0

kowtow = top_words.index('kowtow') + 1  # Adding 1 because list indices start at 0

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


dictFolder = project_dir + "/cpp/ThirdParty/dictionary/data/"
frequencyFile = project_dir + "/cpp/ThirdParty/100k_words/wiki-100k.txt"
dbPath = project_dir + "/scripts/make_dictionary/database.db"
dictFiles = [
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

frequency = []

# get 100k words
f = open(frequencyFile, "r", errors='replace')
raw_entire = f.read().splitlines()
# filter comments
for word in raw_entire:
    if word[0] != '#':
        frequency.append(word)
    else:
        print("skip word: " + word)

# open db
db = Db()
db.open_connection(dbPath)
        
# copy dictionary in db and add frequency index
for file in dictFiles:  
    f = open(dictFolder + file, "r", errors='replace')
    jsonStr = f.read()
    jsonV = json.loads(jsonStr)
    
    # find this for in the frequency list
    for word in jsonV:
        freq = 0
        transcript = ""
        try:
            # freq = wordfreq.word_frequency(word, 'en')
            # freq = wordfreq.zipf_frequency(word, 'en')
            # freq = wordfreq.word_frequency('popular', 'en')
            transcript = ipa.convert(word)
            freq = frequency.index(word)
        except:
            freq = -1
        db.insert_record(word, freq, json.dumps(jsonV[word]), transcript)

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

print("done")