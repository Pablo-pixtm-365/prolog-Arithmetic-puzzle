%Arithmetic puzzle: 

%In this problem you enter a list which will be divided into the left and right part, both will have the same result.
% important the list should be of integers numbers

%The idea to the problem is from Roland Beuret. Thanx.

% equation(L,LT,RT) :- L is the list of numbers which are the leaves
% LT -> left term and RT -> right term


equation(L,LT,RT) :-
   split(L,LL,RL),              % decompose the list L
   term(LL,LT),                 % construct the left term
   term(RL,RT),                 % construct the right term
   LT =:= RT.                   % evaluate and compare the terms

% term(L,T) :- L is the list of numbers which are the leaves in
% the arithmetic term T - from left to right.

term([X],X).                    % a number is a term in itself
% term([X],-X).                   % unary minus
term(L,T) :-                    % general case: binary term
   split(L,LL,RL),              % decompose the list L
   term(LL,LT),                 % construct the left term
   term(RL,RT),                 % construct the right term
   binterm(LT,RT,T).            % construct combined binary term

% binterm(LT,RT,T) :- T is a combined binary term constructed from
% left-hand term LT and right-hand term RT

binterm(LT,RT,LT+RT).     % fact
binterm(LT,RT,LT-RT).     % fact
binterm(LT,RT,LT*RT).     % fact
binterm(LT,RT,LT/RT) :- RT =\= 0.   % avoid division by zero | =\= succeeds if values of expressions RT and 0 are not equal it return yes

% split(L,L1,L2) :- split the list L into non-empty parts L1 and L2
% such that their concatenation is L

split(L,L1,L2) :- append(L1,L2,L), L1 = [_|_], L2 = [_|_].

% do(L) :- find all solutions to the problem as given by the list of
%    numbers L, and print them out, one solution per line.

do(L) :- 
   equation(L,LT,RT),
      writef('%w = %w\n',[LT,RT]),
   fail.
do(_).
