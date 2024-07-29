---- MODULE MC ----
EXTENDS SillyTupleMax, TLC

\* CONSTANT definitions @modelParameterConstants:0minValue
const_1722244758665102000 == 
-99999
----

\* CONSTANT definitions @modelParameterConstants:1Tuples
const_1722244758665103000 == 
[1..4 -> -3..3]
----

\* Constant expression definition @modelExpressionEval
const_expr_1722244758665104000 == 
UNION ({[1..n -> {"a","b","c"}]: n \in 1..3})
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1722244758665104000>>)
----

\* INIT definition @modelBehaviorNoSpec:0
init_1722244758665105000 ==
FALSE/\done = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_1722244758665106000 ==
FALSE/\done' = done
----
=============================================================================
\* Modification History
\* Created Mon Jul 29 11:19:18 CEST 2024 by dario
