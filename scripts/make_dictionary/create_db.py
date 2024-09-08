import os
import re

from tqdm import tqdm
from db import Db

class CreateDb:
    def __init__(self):
        self.db = Db()
        self.db.create_connection(os.getcwd() + '/sqlite.db')

    def start(self, source_storage):
        entire = []
        items = source_storage.getItems()

        for it in items:
            f = open(os.getcwd() + '/data_sources/' + it, "r", errors='replace')
            raw_entire = f.read().splitlines()

            formatted = self.__formatNewLines(raw_entire)

            entire.append(self.__splitByPunctuation(formatted))

        with open(os.getcwd() + '/summary_out.txt', "w") as txt_file:
            txt_file.truncate(0)

            for line in entire:
                for s_line in line:
                    if len(s_line) > 0:
                        if s_line[0] == ' ':
                            s_line = s_line[1:]
                        txt_file.write(s_line + '\n')

        if self.db.open_connection(os.getcwd() + '/sqlite.db'):
            try:
                for it_line in tqdm(entire):
                    for it_line_one in it_line:
                        self.db.insert_record(it_line_one)
                print('\n')
            finally:
                self.db.close_connection()

        return len(entire)

    def __formatNewLines(self, input):
        last_line_char = None
        entire = []

        for line in input:
            if len(line) != 0:
                if last_line_char is None:
                    entire.append(line)
                    last_line_char = line[-1]
                else:
                    it = line[0]
                    if line[0].islower():
                        entire[-1] = entire[-1] + ' ' + it
                        last_line_char = it[-1]
                    else:
                        entire.append(line)
                        last_line_char = it[-1]
        return entire

    def __splitByPunctuation(self, input):
        entire = []

        for line in input:
            line = re.split('[;:_!?.]', line)
            for line_one in line:
                entire.append(line_one)
        return entire