# 🐹 Pub/Sub System – Go (TCP)



This is a sample solution to Dev Challenge 003: a lightweight Publish/Subscribe messaging system implemented in Go using TCP sockets.

It features:

- A simple in-memory pub/sub broker.
- TCP-based communication for publishing and subscribing.
- A multi-subscriber system, where multiple clients can subscribe to the same topic and receive messages broadcasted by the publisher.
- Publisher can send messages manually via the command line.

---

## 🚀 How to Run

```bash
cd solutions/go

## run the publisher
go run pub.go

## open a new shell (as many as you want)
go run sub.go
   
## optionally: open a new shell (as many as you want)
telnet localhost 8888

## go back to pub.go and type messages
```
