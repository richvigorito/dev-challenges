## broken solid principle hint (in hex): SRP, OCP

## Original code:
##
##class Report:
##    def __init__(self, data):
##        self.data = data
##
##    def generate(self):
##        return f"Report: {self.data}"
##
##    def save_to_file(self, filename):
##        with open(filename, "w") as f:
##            f.write(self.generate())


###########################################################
###########################################################
###########################################################
##
## refactored code addresses the following:
##
## SRP: Report now long responsible for generating report
##      and write the file somewhere
## OCP: We now can add a DatabaseWriter, CloudWriter, etc
##      and we wouldnt have to modify report 
##
###########################################################
###########################################################

class Report:
    def __init__(self, data):
        self.data = data

    def generate(self):
        return f"Report: {self.data}"


class FileWriter:
    def save_to_file(self, filename: str, content: str):
        with open(filename, "w") as f:
            f.write(content)
