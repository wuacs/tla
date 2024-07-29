---- MODULE MC ----
EXTENDS SillyTupleMax, TLC

\* CONSTANT definitions @modelParameterConstants:0minValue
const_172224474082192000 == 
-99999
----

\* CONSTANT definitions @modelParameterConstants:1Tuples
const_172224474082193000 == 
[1..4 -> -3..3]
----

\* Constant expression definition @modelExpressionEval
const_expr_172224474082194000 == 
UNION ({[1..n -> {"a","b","c"}]: n \in 1..21})
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_172224474082194000>>)
----

\* INIT definition @modelBehaviorNoSpec:0
init_172224474082195000 ==
FALSE/\done = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_172224474082196000 ==
FALSE/\done' = done
----
=============================================================================
\* Modification History
\* Created Mon Jul 29 11:19:00 CEST 2024 by dario
