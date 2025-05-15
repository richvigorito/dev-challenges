## broken solid principle hint (in hex): SRP, OCP
## if you want a hint for what principles are broken
## decode the following hex strings
#
# 53 52 50
# 4F 43 50

class Report:
    def __init__(self, data):
        self.data = data

    def generate(self):
        return f"Report: {self.data}"

    def save_to_file(self, filename):
        with open(filename, "w") as f:
            f.write(self.generate())

