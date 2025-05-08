<?php
function swapViaArr($a, $b) {
    return array($b, $a);
}

function swapByXorReference(&$a, &$b) {
    $a = $a ^ $b;
    $b = $a ^ $b;
    $a = $a ^ $b;
}

$a = 5; $b = 3; 
echo "Before: a=$a, b=$b\n";

list($a, $b) = swapViaArr($a, $b);
echo "After via Arr Swap: a=$a, b=$b\n";


swapByXorReference($a, $b);
echo "After xor by ref: a=$a, b=$b\n";
?>


