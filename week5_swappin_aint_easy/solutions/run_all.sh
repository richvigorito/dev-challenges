#!/bin/bash
set -e

run() {
  echo -e "\n==============================="
  echo -e "Language: $1"
  echo -e "Swap Type: $2"
  echo -e "==============================="
  eval "$3"
}

cd swap

# C (temp var, pointer)
run "C" "Temp Var, Arith Swap, Xor Swap; Pass-by-Pointer" "gcc swap.c -o swap_c && ./swap_c"

# C++ (temp var, pass-by-reference)
run "C++" "Temp Var, Pass-by-Reference" "g++ swap.cpp -o swap_cpp && ./swap_cpp"

# Java (temp var, primitive assignment)
run "Java" "Temp Var, No Reference (primitives)" "javac Swap.java && java Swap"

# Python (tuple unpacking)
run "Python" "Tuple Unpacking" "python3 swap.py"

# Bash (temp var)
run "Bash" "Temp Var Assignment" "bash swap.sh"

# PHP (array return)
run "PHP" "Return Tuple as Array; xor swap by ref" "php swap.php"

# Ruby (multiple assignment)
run "Ruby" "Multiple Assignment" "ruby swap.rb"

# Go (return tuple)
run "Go" "Return Tuple" "go run swap.go"

# Rust (return tuple)
run "Rust" "Return Tuple" "rustc swap.rs -o swap_rust && ./swap_rust"

# Haskell (return tuple)
run "Haskell" "Pure Functional Tuple Return" "runhaskell swap.hs"

# Erlang (binding new vars)
run "Erlang" "Pattern Matching Bind" "erlc swap.erl && erl -noshell -s swap main -s init stop"

# Fortran (temp var)
run "Fortran" "Temp Var Assignment" "gfortran swap.f90 -o swap_f90 && ./swap_f90"

# Lisp (multiple values)
run "Common Lisp" "Multiple Return Values + Setf" "sbcl --script swap.lisp"

# Scala (tuple swap, both OOP and functional)
run "Scala" "OOP and Functional Tuple Return" "scalac swap.scala && scala Main"

# Clojure (vector return, functional)
run "Clojure" "Functional Vector Return" "clojure swap.clj"

# 🧹 Cleanup compiled artifacts
echo -e "\nCleaning up build artifacts..."
rm -f swap_c swap_cpp Swap.class swap_rust swap_f90 Main.class Main\$*.class swap.beam *.hi *.o *.out

