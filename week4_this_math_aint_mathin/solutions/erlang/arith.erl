-module(arith).
-export([incr/1]).
-export([decr/1]).
-export([neg/1]).
-export([fact/1]).
-export([add/2]).
-export([sub/2]).
-export([mult/2]).
-export([quotient/2]).
-export([quotient/3]).
-export([modulo/2]).
-export([exp/2]).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%  Arithmatic class in Erlang
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% for bonus: 
%%%% implement using bit operations
incr(A) -> A + 1.
decr(A) -> A -1.
neg(N) 	-> -N.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fact(0) -> 1;
fact(N) -> mult(N, fact(decr(N))).

add(A,0) -> A;
add(A,B) when B < 0 -> add(decr(A),incr(B));
add(A,B) -> add(incr(A),decr(B)).

sub(A,B) -> add(A,neg(B)).

mult(A,1) -> A;
mult(1,B) -> B;
mult(0,_) -> 0;
mult(_,0) -> 0;
mult(A,B) when A < 0, B < 0 	-> mult(neg(A),neg(B));
mult(A,B) when A < 0  		-> neg(mult(neg(A),B));
mult(A,B) when B < 0  		-> neg(mult(A,neg(B)));
mult(A,B) 			-> add(mult(A,decr(B)),A).

modulo(_,0) -> 0;
modulo(_,1) -> 0;
modulo(A,B) when A < 0, B < 0 	-> neg(modulo(A,B));
modulo(A,B) when A < 0 		-> neg(modulo(neg(A),B));
modulo(A,B) when B < 0 		-> neg(modulo(A,neg(B)));
modulo(A,B) when A =:= B 	-> 0;
modulo(A,B) when A < B 		-> A;
modulo(A,B)  			-> modulo(sub(A,B),B).

quotient(_,0) 		-> 0;
quotient(A,1) 		-> A;
quotient(A,B) when A < 0, B < 0 	-> quotient(neg(A),neg(B),0);
quotient(A,B) when A < 0 		-> neg(quotient(neg(A),B,0));
quotient(A,B) when B < 0 		-> neg(quotient(A,neg(B),0));
quotient(A,B) when A =:= B		-> 1;
quotient(A,B) when A < B 		-> 0;
quotient(A,B)				-> quotient(A,B,0).
quotient(A,B,Answer) 			-> add(incr(Answer),quotient(sub(A,B),B)).

exp(_,0) 			-> 1;
exp(A,B) 			-> mult(A,exp(A,decr(B))).
