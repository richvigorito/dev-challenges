// XOR encryption in C++ (with key same length as file)
#include <iostream>
#include <fstream>
#include <stdexcept>
#include <vector>
#include <random>

std::vector<char> readFile(const std::string& filepath){
  std::ifstream file(filepath, std::ios::binary);
  if (!file) throw std::runtime_error("Failed to open file "+ filepath);
  return std::vector<char>((std::istreambuf_iterator<char>(file)), std::istreambuf_iterator<char>());

}

void writeFile(const std::string& filename, const std::vector<char>& data) {
    std::ofstream file(filename, std::ios::binary);
    if (!file) throw std::runtime_error("Failed to write file " + filename);
    file.write(data.data(), data.size());
}


void xorEncryptDecrypt (const std::vector<char>& key, 
                        const std::vector<char>& in, 
                        std::vector<char>& out){
  out.resize(in.size());
  for(size_t i = 0; i < in.size(); i++){
    out[i] = in[i] ^ key[i % key.size()];
  }
}

int main(int argc, char *argv[]){
  if (argc != 4){
    std::cerr << "invalid program args" << std::endl;
    std::cerr << "to run : ./xor_enc key_file_path file outputfile_path" << std::endl;
    return 1;
  }

  try {
    std::vector<char> keyfileData = readFile(argv[1]);
    std::vector<char> infileData = readFile(argv[2]);
    std::string outfileName = argv[3];
    std::vector<char> outfileData;

    xorEncryptDecrypt(keyfileData, infileData, outfileData);
    writeFile(outfileName, outfileData);


  } catch ( const std::exception& e) {
    std::cerr << "error: " << e.what() << std::endl;
    return 1;
  }
  return 0;
}
