%% Erlang
%% swap.erl
-module(swap).
-export([main/0]).

main() ->
    A = 5, B = 3,
    NewA = B, NewB = A,
    io:format("a = ~p, b = ~p~n", [NewA, NewB]).


