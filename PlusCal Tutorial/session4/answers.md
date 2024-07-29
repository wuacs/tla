- Exercise 2: Write the set of all prime numbers intensionally

{n \in Int : (\A t \in 2..n\div 2 : n%t#0) }

- Exercise 3: Write the set of all pairs <<p, q>> of integers such that p is less than q.

{t \in {<<p, q>>: p \in Int, q \in Int}: t[1] < t[2]}

- Exercise 4: Use UNION to write the set of all tuples of length at most 21 whose elements are "a", "b", or "c".

UNION ({[1..n -> {"a","b","c"}]: n \in 1..21})

- Puzzle 1: Define Intersect so that for any set S of sets, Intersect(S) is the intersection of the sets in S—that is, the set of all elements that are in all the elements of S.

Intersect(S) == {element \in UNION(S) : \A set \in S: element \in set } 

or

Intesect(S) == {element \in UNION(S) : {set \in S: element \in set}=S } 

- Puzzle 2   What does this set equal: {(x \in S) : x \in S}?

It is not equal to S, the parentheses in (x \in S) means we are evaluating rather than choosing. Thus if S is not emtpy x \in S will return TRUE for each x \in S if x is a subset.

Sets with both sets and primitive elements is not allowed.
So if S is empty it will return empty.
Otherwise it will return {TRUE}

- Exercise 5   What is this set: (S \X T) \X U ?

It is all pairs << <<s,t>>, u  >> where s \in S, t \in T, u \in U

- Exercise 6   How many ways can you write the set of all 1-tuples whose element is in the set S ?
   
[{1}->S]

{\<\< s >>: s\in S}
