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
cd solutions/c

## run the broker
gcc broker.c -o broker
./broker

## run the consumers (as many as you'd like)
gcc sub.c -o sub
./sub

## run the publisher and type messages
gcc sub.c -o pub
./pub
$> hello,
$> world!
## those will appear in each of the consumers

## optionally: open a new shell (as many as you want)
telnet localhost 9000
```
