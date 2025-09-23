#!/bin/bash

swap_temp() {
    local a=$1
    local b=$2
    echo "Before: a=$a, b=$b"
    local temp=$a
    a=$b
    b=$temp
    echo "After: a=$a, b=$b"
}

# Example usage
swap_temp 1 2

