import os

class SourceStorage:
    def __init__(self):
        list_of_all = os.listdir("./data_sources")
        self.list_of_files = []

        for i in list_of_all:
            if (len(i) > 5) and (not i.__contains__('.DS_Store')):
                self.list_of_files.append(i)

    def getSize(self):
        return len(self.list_of_files)

    def getItems(self):
        return self.list_of_files
