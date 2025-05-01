package main

import (
	"fmt"
	"net"
	"os"
)

func subscribeToChannel(host string, port int) {
	conn, err := net.Dial("tcp", fmt.Sprintf("%s:%d", host, port))
	if err != nil {
		fmt.Println("Error connecting to server:", err)
		os.Exit(1)
	}
	defer conn.Close()

	fmt.Printf("Connected to %s:%d\n", host, port)

	// open and always listening for incoming messages
	buffer := make([]byte, 1024)
	for {
		n, err := conn.Read(buffer)
		if err != nil {
			fmt.Println("Error reading from server:", err)
			break
		}
		fmt.Printf("Received message: %s\n", string(buffer[:n]))
	}
}

func main() {
	subscribeToChannel("127.0.0.1", 8888)
}

