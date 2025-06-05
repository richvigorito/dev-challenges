# Inception
The solutions here do a few things. We compile an assembly program. Linking that assembly programing we compile c code into a shared object. This file can be directly used in go, python, (and lots of other languages). What we're doing here (for literally no practile reason except i needed a catchy name for this shared libray/FFI challenge) is we have python use the shared library we compiled which in turn is ran directly from Go (code within a code, dream within a dream, get it?). Anyways below is how to run these files. As 🎯 bonus, with your team make friendly wagers much faster the native c code is ran against either the native go or python nqueens solutions VS the go/python code that uses the shared objects VS the inception solution.

## 🇨 solutions
1) nqueens.h header file 
1) nq.c is the c file that can be compiled into shared object file
1) main.c is command line program that calls nq.c with nq input

#### to run nq.c directly, use main.c which uses nq.c
```bash
gcc -o main main.c nq.c
# 8 queens 
./main 8  

# 11 queens 
./main 11 

# 14 queens 
./main 14 
```

#### create shared library (libnqueens.so) from nq.c
```bash
gcc -fPIC -shared -o libnqueens.so nq.c
mv libnqueens.so ..
```


## 🐹 Go Solutions
#### run native go nqueens solution
```bash
go run nq.native.go 8
```

#### run go code using shared object
```bash
cd go
LD_LIBRARY_PATH=./:.. go run main.go 8
```

## 🐍 Python Solutions
#### run native python nqueens solution
```bash
cd python 
python3 nq.native.py 8
```

#### run python code using shared object
```bash
cd python 
python3 nq.py 8
```

## Inception:  🐹 -> 🐍 ->  🇨 -> [ASM]
```bash

cd c
## compile assembly code
nasm -f elf64 hello.asm -o hello.o 
## compile c code while linking assembly file, creating shared object
gcc -shared -fPIC nq.c hello.o -Wl,-z,noexecstack -o libnqueens.so
## mv to common dir
mv libnqueens.so ..
cd ../go/
go run pythonlib.nq.go 4
```
