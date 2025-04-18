-module(arith_tests).
-export([run_tests/0]).

%% Simple test runner for arith.erl
%% 
%% to run: erl -noshell -s arith_tests run_tests -s init stop
%% 
%% 

run_tests() ->
    io:format("Running arithmetic tests...~n"),
    lists:foreach(fun print_result/1, tests()),
    io:format("Done.~n").

tests() -> [
    {"incr(0)", arith:incr(0) == 1},
    {"incr(9)", arith:incr(9) == 10},
    {"decr(0)", arith:decr(0) == -1},
    {"decr(9)", arith:decr(9) == 8},

    {"add(3,5)", arith:add(3,5) == 8},
    {"add(2,-2)", arith:add(2,-2) == 0},
    {"add(2,-3)", arith:add(2,-3) == -1},

    {"sub(10,3)", arith:sub(10,3) == 7},
    {"sub(2,-3)", arith:sub(2,-3) == 5},
    {"sub(-2,3)", arith:sub(-2,3) == -5},

    {"mult(2,3)", arith:mult(2,3) == 6},
    {"mult(2,-3)", arith:mult(2,-3) == -6},
    {"mult(-3,-3)", arith:mult(-3,-3) == 9},

    {"quotient(9,3)", arith:quotient(9,3) == 3},
    {"quotient(7,3)", arith:quotient(7,3) == 2},
    {"quotient(2,3)", arith:quotient(2,3) == 0},

    {"modulo(7,3)", arith:modulo(7,3) == 1},
    {"modulo(7,5)", arith:modulo(7,5) == 2},

    {"fact(0)", arith:fact(0) == 1},
    {"fact(5)", arith:fact(5) == 120},

    {"exp(5,0)", arith:exp(5,0) == 1},
    {"exp(2,3)", arith:exp(2,3) == 8},
    {"exp(2,4)", arith:exp(2,4) == 16}
].

print_result({Desc, true}) ->
    io:format("PASS: ~s~n", [Desc]);
print_result({Desc, false}) ->
    io:format("FAIL: ~s~n", [Desc]).

