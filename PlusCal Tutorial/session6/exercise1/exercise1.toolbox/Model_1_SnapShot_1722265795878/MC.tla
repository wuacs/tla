---- MODULE MC ----
EXTENDS exercise1, TLC

\* CONSTANT definitions @modelParameterConstants:0SET
const_1722265793858139000 == 
1..100
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1722265793858140000 ==
Init /\ [][Next]_vars
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1722265793858141000 ==
pc = "Done" => x = N^2
----
\* INVARIANT definition @modelCorrectnessInvariants:1
inv_1722265793858142000 ==
x \in 0..N^2 /\ i \in 1..N /\ pc \in {"a","b","done"}
----
=============================================================================
\* Modification History
\* Created Mon Jul 29 17:09:53 CEST 2024 by dario
