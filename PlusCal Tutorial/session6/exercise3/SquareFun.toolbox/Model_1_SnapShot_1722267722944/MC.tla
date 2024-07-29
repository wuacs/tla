---- MODULE MC ----
EXTENDS SquareFun, TLC

\* CONSTANT definitions @modelParameterConstants:0SET
const_1722267720927193000 == 
1..4
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1722267720927194000 ==
pc = "Done" => x = [j \in 0..N |-> j^4]
----
=============================================================================
\* Modification History
\* Created Mon Jul 29 17:42:00 CEST 2024 by dario
