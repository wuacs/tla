------------------------------- MODULE part1 -------------------------------

EXTENDS Integers, Sequences, TLC

CONSTANT pairs

ASSUME /\ pairs \subseteq Seq(Int)

       

(********

--algorithm multiplyIteratively {
   variables pair \in pairs, i = 1, k = pair[1];    
   { 
     while (i =< pair[2]) {
       k := k * pair[1];
       i := i + 1;
     } ;
     assert k = pair[1]^pair[2] 
   }
}

*******)
\* BEGIN TRANSLATION (chksum(pcal) \in STRING /\ chksum(tla) \in STRING)
VARIABLES pair, i, k, pc

vars == << pair, i, k, pc >>

Init == (* Global variables *)
        /\ pair \in pairs
        /\ i = 1
        /\ k = pair[1]
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ IF i =< pair[2]
               THEN /\ k' = k * pair[1]
                    /\ i' = i + 1
                    /\ pc' = "Lbl_1"
               ELSE /\ Assert(k = pair[1]^pair[2], 
                              "Failure of assertion at line 20, column 6.")
                    /\ pc' = "Done"
                    /\ UNCHANGED << i, k >>
         /\ pair' = pair

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == Lbl_1
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 

=============================================================================
\* Modification History
\* Last modified Sun Jul 28 11:45:30 CEST 2024 by dario
\* Created Sun Jul 28 11:16:34 CEST 2024 by dario
