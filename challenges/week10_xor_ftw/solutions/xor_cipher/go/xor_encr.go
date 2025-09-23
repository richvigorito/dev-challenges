package main

import (
    "bufio"
    "fmt"
    "io"
    "os"
	  "crypto/rand"
)

func checkErr(err error, msg string) {
    if err != nil {
        fmt.Fprintf(os.Stderr, "%s: %v\n", msg, err)
        os.Exit(1)
    }
}

func mustWriteFile(path string, data []byte) {
    err := os.WriteFile(path, data, 0644)
    checkErr(err, "writing file")
}

func main () {
  file, err := os.Open("../../README.md");  
  checkErr(err, "Opening file")
  defer file.Close()

  stat, err := file.Stat()
  checkErr(err, "get file stat")

  bytes := make([]byte, stat.Size())
  _, err = bufio.NewReader(file).Read(bytes)
  if err != nil  && err != io.EOF {
    fmt.Println(err)
    return
  }


  uniqRandKey := make([]byte, stat.Size())
  _, err = rand.Read(uniqRandKey)
  checkErr(err, "createKey")
  
  encrBytes := make([]byte, stat.Size())

  for i:=0; i < len(bytes) ; i++ {
    encrBytes[i] = bytes[i] ^ uniqRandKey[i]
  }

  mustWriteFile("encr_key", uniqRandKey)
  mustWriteFile("encr.txt", encrBytes)
  

  decryptBytes := make([]byte, stat.Size())
  for i:=0; i < len(bytes) ; i++ {
    decryptBytes[i] = encrBytes[i] ^ uniqRandKey[i]
  }
  
  mustWriteFile("decrypted.md", decryptBytes)
}
