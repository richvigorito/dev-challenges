#  Week 18 Challenge — Blaise Pascal Tribute
```
        1
       1 1
      1 2 1
     1 3 3 1
    1 4 6 4 1
   1 5 10 10 5 1
  1 6 15 20 15 6 1
 1 7 21 35 35 21 7 1
```
---

Honoring of the anniversay of [Blaise Pascal’s](https://en.wikipedia.org/wiki/Blaise_Pascal) death (August 19th, 1662) for week 18 we will once again revisit ["Algorithms + Data Structures = Programs"](https://www.amazon.com/Algorithms-Structures-Prentice-Hall-Automatic-Computation/dp/0130224189) and write some Pascal, more specifically Pascal's Trainage ... in Pascal


> "I would have written a shorter letter, but I did not have the time." - Blaise Pascal "Lettres Provinciales,” - 1657. 

---

## 📝 Challenge Overview  

1. **Understand Pascal’s Triangle**  
   Read about the algorithm and its structure here:  
   [Pascal’s Triangle — Fundamental Data Structures](https://github.com/richvigorito/the-best-programming-book-ever-written/tree/main/src/chapters/1_fundamental_data_structures/pascals_triangle)

2. **Write Pascal code**  
   Open the exercise file in the repo:  
   [pascals_triangle.pas](https://github.com/richvigorito/the-best-programming-book-ever-written/blob/main/src/exercises/pascals_triangle.pas)  
   This is where you will implement the algorithm.

3. **Run it inside the provided container**  
   The repo comes with a ready-to-go development environment including a Pascal compiler and Makefile.  
   To compile and run your code inside the container:


## 🏁 Challenge Format  
**Head-to-Head Speed Round** ⚡🌐  
- Go into dev container, see: [build instructions](https://github.com/richvigorito/the-best-programming-book-ever-written?tab=readme-ov-file#-how-to-run)
- Your job is to make the file at ``exercises/pascals_triangle.pas`` work (the printer works, you just have to solve the triangle generation)
- Set a time on the clock, 15 - 20 mins should be appropriate
- Start. 
- First

- To Run: 
```bash
make run-pascal FILE=exercises/pascals_triangle.pas
```


## 🧠 Tips
Start with a 2D array where each row represents one level of the triangle.

Outer edges (col = 0 and col = row) are always 1.

Each inner value is the sum of the two numbers above it.

