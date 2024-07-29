------------------------------ MODULE SillyTupleMax ------------------------------ 

EXTENDS Integers, Sequences, TLC

CONSTANT Tuples, minValue
ASSUME /\ Tuples \subseteq Seq(Int)
       /\ minValue \in Int
       /\ \A t \in Tuples : \A i \in 1..Len(t) : t[i] > minValue 

(*********  

--algorithm TupleMaxND {
   variables inp \in Tuples, max = minValue, I = 1..Len(inp), done = FALSE ;    
   { while (I /= {} /\ ~done) {
       with (q \in I) {
         if (\A k \in 1..Len(inp): inp[k]<=inp[q]) {
            done := TRUE;
            max := inp[q];
         };
         I := I \ {q};
       }
     } ;
     assert IF inp = << >> THEN max = minValue
                           ELSE /\ \E n \in 1..Len(inp) : max = inp[n]
                                /\ \A n \in 1..Len(inp) : max >= inp[n]
   }
}

********)
\* BEGIN TRANSLATION (chksum(pcal) = "5b6b043f" /\ chksum(tla) = "fe20cefd")
VARIABLES inp, max, I, done, pc

vars == << inp, max, I, done, pc >>

Init == (* Global variables *)
        /\ inp \in Tuples
        /\ max = minValue
        /\ I = 1..Len(inp)
        /\ done = FALSE
        /\ pc = "Lbl_1"

Lbl_1 == /\ pc = "Lbl_1"
         /\ IF I /= {} /\ ~done
               THEN /\ \E q \in I:
                         /\ IF \A k \in 1..Len(inp): inp[k]<=inp[q]
                               THEN /\ done' = TRUE
                                    /\ max' = inp[q]
                               ELSE /\ TRUE
                                    /\ UNCHANGED << max, done >>
                         /\ I' = I \ {q}
                    /\ pc' = "Lbl_1"
               ELSE /\ Assert(IF inp = << >> THEN max = minValue
                                             ELSE /\ \E n \in 1..Len(inp) : max = inp[n]
                                                  /\ \A n \in 1..Len(inp) : max >= inp[n], 
                              "Failure of assertion at line 23, column 6.")
                    /\ pc' = "Done"
                    /\ UNCHANGED << max, I, done >>
         /\ inp' = inp

(* Allow infinite stuttering to prevent deadlock on termination. *)
Terminating == pc = "Done" /\ UNCHANGED vars

Next == Lbl_1
           \/ Terminating

Spec == Init /\ [][Next]_vars

Termination == <>(pc = "Done")

\* END TRANSLATION 


====
