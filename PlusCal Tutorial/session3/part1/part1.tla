------------------------------- MODULE part1 -------------------------------

EXTENDS Integers, Sequences, TLC

CONSTANT pairs

ASSUME /\ pairs \subseteq Seq(Int)

       

(********

--algorithm multiplyIteratively {
   variables pair \in pairs, i = 1, k = pair[1];    
   { 
     if (pair[2] = 0) k := 1 ;
     while (i < pair[2]) {
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
         /\ IF pair[2] = 0
               THEN /\ k' = 1
               ELSE /\ TRUE
                    /\ k' = k
         /\ pc' = "Lbl_2"
         /\ UNCHANGED << pair, i >>

Lbl_2 == /\ pc = "Lbl_2"
         /\ IF i < pair[2]
               THEN /\ k' = k * pair[1]
                    /\ i' = i + 1
                    /\ pc' = "Lbl_2"
               ELSE /\ Assert(k = pair[1]^pair[2], 
                              "Failure of assertion at line 21, column 6.")
                    /\ pc' = "Done"
                    /\ UNCHANGED << i, k >>
         /\ pair' = pair

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == Lbl_1 \/ Lbl_2
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 

=============================================================================
\* Modification History
\* Last modified Sun Jul 28 12:08:34 CEST 2024 by dario
\* Created Sun Jul 28 11:16:34 CEST 2024 by dario
