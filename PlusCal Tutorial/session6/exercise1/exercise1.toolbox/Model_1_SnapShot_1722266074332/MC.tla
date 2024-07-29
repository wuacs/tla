---- MODULE MC ----
EXTENDS exercise1, TLC

\* CONSTANT definitions @modelParameterConstants:0SET
const_1722266072312147000 == 
1..100
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1722266072312148000 ==
Init /\ [][Next]_vars
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1722266072312149000 ==
pc = "Done" => x = N^2
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1722266072312150000 ==
x \in 0..N^2 /\ i \in 1..N /\ pc \in {"a","b","done"}
----
=============================================================================
\* Modification History
\* Created Mon Jul 29 17:14:32 CEST 2024 by dario
