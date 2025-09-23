import ctypes
import os
import argparse

# Set up command-line argument parsing
parser = argparse.ArgumentParser(description='Run N-Queens problem with a C shared library.')
parser.add_argument('n', type=int, help='Number of queens')
args = parser.parse_args()

# Load the shared library
lib = ctypes.CDLL('../libnqueens.so')

# Define the function prototype (assuming run_nqueens takes an integer argument)
lib.run_nqueens.argtypes = [ctypes.c_int]
lib.run_nqueens.restype = None

# Call the function with the number of queens provided by the user
def run_nqueens_python(n):
    lib.run_nqueens(n)

run_nqueens_python(args.n)

