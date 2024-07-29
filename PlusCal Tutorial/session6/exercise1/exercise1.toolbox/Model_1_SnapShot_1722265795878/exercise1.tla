----------------------------- MODULE exercise1 -----------------------------

EXTENDS Integers, TLC

CONSTANT SET
ASSUME SET \subseteq Nat



(*

--algorithm Square {
  variable x = 0, i = 0, N \in SET ;
  { a: while (i < N) {
        i := i + 1  ;
        b: x := x + (2*i - 1) ;
       } ;
  }
  
}

*)
\* BEGIN TRANSLATION (chksum(pcal) = "fdefe45b" /\ chksum(tla) = "b304ebed")
VARIABLES x, i, N, pc

vars == << x, i, N, pc >>

Init == (* Global variables *)
        /\ x = 0
        /\ i = 0
        /\ N \in SET
        /\ pc = "a"

a == /\ pc = "a"
     /\ IF i < N
           THEN /\ i' = i + 1
                /\ pc' = "b"
           ELSE /\ pc' = "Done"
                /\ i' = i
     /\ UNCHANGED << x, N >>

b == /\ pc = "b"
     /\ x' = x + (2*i - 1)
     /\ pc' = "a"
     /\ UNCHANGED << i, N >>

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == a \/ b
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 

=============================================================================
\* Modification History
\* Last modified Mon Jul 29 17:08:18 CEST 2024 by dario
\* Created Mon Jul 29 15:54:33 CEST 2024 by dario
