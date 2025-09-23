package main

/*
#cgo CFLAGS: -I/usr/include/python3.12
#cgo LDFLAGS: -L/usr/lib/python3.12/config-3.12-x86_64-linux-gnu -L/usr/lib/x86_64-linux-gnu -lpython3.12 -ldl -lm
#include <Python.h>
*/
import "C"
import (
	"fmt"
	"os"
	"unsafe"
)

func main() {
	if len(os.Args) != 2 {
		fmt.Println("Usage: go run main.go <n>")
		os.Exit(1)
	}
	n := os.Args[1]

	// Initialize the Python interpreter
	C.Py_Initialize()

	// Python code as a Go string
	pyCode := fmt.Sprintf(`
import ctypes
nqueens = ctypes.CDLL('../libnqueens.so')
nqueens.run_nqueens.argtypes = [ctypes.c_int]
nqueens.run_nqueens(int("%s"))
`, n)

	// Convert Go string to C string
	cPyCode := C.CString(pyCode)
	defer C.free(unsafe.Pointer(cPyCode))

	// Execute the Python code
	C.PyRun_SimpleString(cPyCode)

	// Finalize the Python interpreter
	C.Py_Finalize()
}

