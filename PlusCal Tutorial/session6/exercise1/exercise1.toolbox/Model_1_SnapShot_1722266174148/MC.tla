---- MODULE MC ----
EXTENDS exercise1, TLC

\* CONSTANT definitions @modelParameterConstants:0SET
const_1722266172131179000 == 
1..100
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1722266172131180000 ==
Init /\ [][Next]_vars
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1722266172131181000 ==
pc = "Done" => x = N^2
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1722266172131182000 ==
x \in 0..N^2 /\ i \in 0..N /\ pc \in {"a","b","Done"}
----
=============================================================================
\* Modification History
\* Created Mon Jul 29 17:16:12 CEST 2024 by dario
