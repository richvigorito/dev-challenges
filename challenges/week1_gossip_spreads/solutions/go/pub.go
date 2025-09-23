package main

import (
  "fmt"
  "net"
  "os"
  "sync"
)

type PubSubServer struct {
  subscribers map[net.Conn]bool
  mu         sync.Mutex
}

func NewPubSubServer() *PubSubServer {
  return &PubSubServer{
    subscribers: make(map[net.Conn]bool),
  }
}

func (server *PubSubServer) handleClient(conn net.Conn) {
  defer conn.Close()

 	// Register new subscriber
	server.mu.Lock()
	server.subscribers[conn] = true
	server.mu.Unlock()

  fmt.Printf("New subscriber connected: %s\n", conn.RemoteAddr())

	// Keep the connection open and listen for incoming data from the client
	for {
		buffer := make([]byte, 1024)
		_, err := conn.Read(buffer)
		if err != nil {
			fmt.Printf("Subscriber disconnected: %s\n", conn.RemoteAddr())
			break
		}
	}

  server.mu.Lock()
  delete(server.subscribers, conn)
  server.mu.Unlock()
}

func (server *PubSubServer) broadcastMessage(message string) {
  server.mu.Lock()
  defer server.mu.Unlock()

  for conn := range server.subscribers {
    _, err := conn.Write([]byte(message))
    if err != nil {
      fmt.Println("Err sending message:", err)
      conn.Close()
      delete(server.subscribers, conn)

    }
  }
}

func (server *PubSubServer) run(host string, port int) {
	// incoming connections
	listenAddress := fmt.Sprintf("%s:%d", host, port)
	ln, err := net.Listen("tcp", listenAddress)
	if err != nil {
		fmt.Println("Error starting server:", err)
		os.Exit(1)
	}
	defer ln.Close()

	fmt.Printf("Server listening on %s\n", listenAddress)

	for {
		conn, err := ln.Accept()
		if err != nil {
			fmt.Println("Error accepting connection:", err)
			continue
		}

		go server.handleClient(conn)
	}
}

func main() {
	pubsubServer := NewPubSubServer()

	// Run the server in a goroutine
	go pubsubServer.run("127.0.0.1", 8888)

	for {
		var message string
		fmt.Print("Enter message to broadcast: ")
		fmt.Scanln(&message)
		pubsubServer.broadcastMessage(message)
	}
}
  
