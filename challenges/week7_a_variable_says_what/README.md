# 🧠 Week [7] - Variable Variables Brain Meltdown Challenge

## 📝 Challenge Overview
This week’s challenge: try not to lose your mind with PHP’s variable variables feature.

A variable variable means that the name of a variable is dynamic, decided at runtime.
This lets you create variables whose names are stored inside other variables.

📋 Very Simple Example

```php
<?php
$foo = 'bar';    // $foo contains the string 'bar'
$bar = 'baz';    // $bar contains the string 'baz'

echo $$foo;      // prints:  baz
```

In other words, $$foo means "the variable whose name is the value of $foo."

This challenge will push you through multi-level puzzles involving variable variables, misleading names, and mind games. Good luck!

---
## 🏁 Challenge Format: 
**Head-to-Head** 🏁🔥 Given 10 or so minute time limit on a pen and paper you will work through tricky PHP puzzles inside a file called var_vars.php. Each puzzle asks you "what is the value of X?" — write your answers down (**Careful for undefined vars ;) **) . When time is expired, compare your answers and run var_var.php.


🚀 How to Run
Make sure you have PHP installed locally.

Run the challenge file from your terminal: 
```bash
php var_vars.php
```

🎯 Bonus Ideas
- Try building your own "variable variable" puzzles to trick others.
- Discuss how would you accomplish this in other languages?
- Discuss use cases for variable variables
