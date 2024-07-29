---- MODULE MC ----
EXTENDS exercise1, TLC

\* CONSTANT definitions @modelParameterConstants:0SET
const_1722266160015171000 == 
1..100
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1722266160015172000 ==
Init /\ [][Next]_vars
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1722266160015173000 ==
pc = "Done" => x = N^2
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1722266160015174000 ==
x \in 0..N^2 /\ i \in 0..N-1 /\ pc \in {"a","b","Done"}
----
=============================================================================
\* Modification History
\* Created Mon Jul 29 17:16:00 CEST 2024 by dario
