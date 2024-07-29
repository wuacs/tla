---- MODULE MC ----
EXTENDS exercise1, TLC

\* CONSTANT definitions @modelParameterConstants:0SET
const_1722262303593126000 == 
1..100
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1722262303593127000 ==
Init /\ [][Next]_vars
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1722262303593128000 ==
pc = "Done" => x = N^2
----
=============================================================================
\* Modification History
\* Created Mon Jul 29 16:11:43 CEST 2024 by dario
