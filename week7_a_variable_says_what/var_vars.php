<?php

##################################################
// Question 1
##################################################
$a = 'b';
$b = 'c';
$c = 'd';
$d = 'e';
$$$a = 'z';

// what does the following output:
echo "1.1: ". $b;        echo "\n";
echo "1.2: ". $$a;       echo "\n";
echo "1.3: ". $$$a;      echo "\n";
echo "1.4: ".${${$a}};  echo "\n";

// answer the following questions: 
//   Q1.5: What variable did we just set to 'z'?

##################################################
// Question 2
##################################################
$one = 'two';
$two = 'three';
$three = 'four';
$four = 'five';
$$$two = 'banana';


// answer the following questions: 
echo '2.1:'. $three;       echo "\n";
echo '2.2:'. $$two;        echo "\n";
echo '2.3:'. ${${$two}};   echo "\n";
echo '2.4:'. $$$one;       echo "\n";

// answer the following questions: 
//   Q2.5: What variable name now contains the value 'banana'?


##################################################
// Question 3
##################################################
$red = 'blue';
$blue = 'green';
$green = 'yellow';
$yellow = 'red';

$$green = 'purple';
$$$red = 'orange';


// what does the following output:
echo '3.1:'. $green;            echo "\n";
echo '3.2:'. $yellow;           echo "\n";
echo '3.3:'. $$red;             echo "\n";
echo '3.4:'. $$$red;            echo "\n";
echo '3.5:'. ${${${$yellow}}};  echo "\n";

// answer the following questions: 
//   Q3.6: What variable name now contains the value 'orange'?


##################################################
// Question 4
##################################################
$yes = 'no';
$no = 'maybe';
$maybe = 'yes';
$$no = 'sometimes';
$sometimes = 'always';
$$$maybe = 'never';

// what does the following output:
echo '4.1:'. $no;       echo "\n";
echo '4.2:'. $$no;       echo "\n";
echo '4.3:'. $$$maybe;       echo "\n";
echo '4.4:'. ${${${$yes}}};       echo "\n";

// answer the following questions: 
//   Q4.5: What variable was just set to 'never'?

##################################################
// Question 5
##################################################
$truth = 'lie';
$lie = 'truth';
$false = 'truth';
$truth = 'false'; 
$$$false = 'paradox';

// what does the following output:
echo '5.1:'. $truth;        echo "\n";
echo '5.2:'. $false;        echo "\n";
echo '5.3:'. $$lie;         echo "\n";
echo '5.4:'. $$false;       echo "\n";
echo '5.5:'. ${${$false}};  echo "\n";

// answer the following questions: 
//    Q5.6: What variable was assigned 'paradox'?
//    Q5.7: Which variable now holds 'truth' as a string value?

