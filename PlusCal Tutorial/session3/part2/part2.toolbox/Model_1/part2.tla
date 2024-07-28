------------------------------- MODULE part2 -------------------------------

EXTENDS Integers, Sequences, TLC

CONSTANT pairs

ASSUME /\ pairs \subseteq Seq(Int)

       

(********

--algorithm exponentiationBySquaring {
   variables pair \in pairs, i = 1, k = 1, m = pair[1], n = pair[2];    
   { 
     if (pair[2] = 0) { m := 1; };
     while (n > 1) {
       if (n%2 # 0) {
            k := k * m;
            n := n - 1;
       };
       m := m * m;
       n := n \div 2;
     };
     assert k*m = pair[1]^pair[2] 
   }
}

*******)
\* BEGIN TRANSLATION (chksum(pcal) = "d37b05cb" /\ chksum(tla) = "939a9ea5")
VARIABLES pair, i, k, m, n, pc

vars == << pair, i, k, m, n, pc >>

Init == (* Global variables *)
        /\ pair \in pairs
        /\ i = 1
        /\ k = 1
        /\ m = pair[1]
        /\ n = pair[2]
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ IF pair[2] = 0
               THEN /\ m' = 1
               ELSE /\ TRUE
                    /\ m' = m
         /\ pc' = "Lbl_2"
         /\ UNCHANGED << pair, i, k, n >>

Lbl_2 == /\ pc = "Lbl_2"
         /\ IF n > 1
               THEN /\ IF n%2 # 0
                          THEN /\ k' = k * m
                               /\ n' = n - 1
                          ELSE /\ TRUE
                               /\ UNCHANGED << k, n >>
                    /\ m' = m * m
                    /\ pc' = "Lbl_3"
               ELSE /\ Assert(k*m = pair[1]^pair[2], 
                              "Failure of assertion at line 25, column 6.")
                    /\ pc' = "Done"
                    /\ UNCHANGED << k, m, n >>
         /\ UNCHANGED << pair, i >>

Lbl_3 == /\ pc = "Lbl_3"
         /\ n' = (n \div 2)
         /\ pc' = "Lbl_2"
         /\ UNCHANGED << pair, i, k, m >>

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == Lbl_1 \/ Lbl_2 \/ Lbl_3
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 

=============================================================================
\* Modification History
\* Last modified Sun Jul 28 13:04:10 CEST 2024 by dario
\* Created Sun Jul 28 12:13:25 CEST 2024 by dario
