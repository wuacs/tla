----------------------------- MODULE SquareFun -----------------------------

EXTENDS Integers, TLC

CONSTANT SET
ASSUME SET \subseteq Nat



(*

--algorithm Square {
  variable i = 0, N \in SET, x = [t \in 0..N |-> 0] ;
  { s: x[0] := 0;
    a: while (i < N) {
        b: x := x + (2*i + 1) ;
        c: x[i+1] := x;
        i := i + 1  ;
       } ;
  }
  
}

*)
\* BEGIN TRANSLATION (chksum(pcal) = "9ae175bc" /\ chksum(tla) = "fef832e2")
VARIABLES i, N, x, pc

vars == << i, N, x, pc >>

Init == (* Global variables *)
        /\ i = 0
        /\ N \in SET
        /\ x = [t \in 0..N |-> 0]
        /\ pc = "s"

s == /\ pc = "s"
     /\ x' = [x EXCEPT ![0] = 0]
     /\ pc' = "a"
     /\ UNCHANGED << i, N >>

a == /\ pc = "a"
     /\ IF i < N
           THEN /\ pc' = "b"
           ELSE /\ pc' = "Done"
     /\ UNCHANGED << i, N, x >>

b == /\ pc = "b"
     /\ x' = x + (2*i + 1)
     /\ pc' = "c"
     /\ UNCHANGED << i, N >>

c == /\ pc = "c"
     /\ x' = [x EXCEPT ![i+1] = x]
     /\ i' = i + 1
     /\ pc' = "a"
     /\ N' = N

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == s \/ a \/ b \/ c
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 

=============================================================================
\* Modification History
\* Last modified Mon Jul 29 17:40:29 CEST 2024 by dario
\* Created Mon Jul 29 17:27:23 CEST 2024 by dario
