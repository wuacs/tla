---- MODULE MC ----
EXTENDS SquareFun, TLC

\* CONSTANT definitions @modelParameterConstants:0SET
const_1722267546864185000 == 
1..4
----

\* INVARIANT definition @modelCorrectnessInvariants:0
inv_1722267546864186000 ==
pc = "Done" => x = [j \in 0..N |-> j^2]
----
=============================================================================
\* Modification History
\* Created Mon Jul 29 17:39:06 CEST 2024 by dario
