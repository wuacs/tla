---- MODULE MC ----
EXTENDS exercise1, TLC

\* CONSTANT definitions @modelParameterConstants:0SET
const_1722262312641132000 == 
1..100
----

\* SPECIFICATION definition @modelBehaviorSpec:0
spec_1722262312641133000 ==
Init /\ [][Next]_vars
----
\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1722262312641134000 ==
pc = "Done" => x /= N^2
----
=============================================================================
\* Modification History
\* Created Mon Jul 29 16:11:52 CEST 2024 by dario
