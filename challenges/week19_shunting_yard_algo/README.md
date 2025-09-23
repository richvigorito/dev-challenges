# Week 19: The Shunting Yard Algorithm 🏁

This week’s challenge is a race-style programming exercise: first to finish wins.

We’re diving into the [Shunting Yard algorithm](https://www.youtube.com/watch?v=1VjJe1PeExQ), a method for parsing mathematical expressions and converting them into Reverse Polish Notation (RPN).

## 📝 Challenge Overview  

I originally wanted to do a straight RPN challenge, but there’s already a [LeetCode problem](https://leetcode.com/problems/evaluate-reverse-polish-notation/description/) for that. So instead, I thought parsing with Shunting Yard would be a fun alternative — it tests your understanding of stacks, operator precedence, and expression evaluation.

## 🏁 Challenge Format  
**Head-to-Head Speed Round** ⚡🌐  

Goal: Convert infix expressions into postfix (RPN).

Style: First to finish correctly wins — think speed + accuracy.

### Examples:

Input:  3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3
Output: 3 4 2 * 1 5 - 2 3 ^ ^ / +

## 🎯 Bonus Ideas

- Focus on operator precedence and associativity.
- Use a stack to temporarily hold operators.
- Remember parentheses handling!

💡 Optional bonus: implement the evaluation of the resulting RPN expression once you’ve parsed it.
