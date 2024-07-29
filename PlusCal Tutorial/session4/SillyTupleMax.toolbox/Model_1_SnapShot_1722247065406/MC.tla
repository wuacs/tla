---- MODULE MC ----
EXTENDS SillyTupleMax, TLC

\* CONSTANT definitions @modelParameterConstants:0minValue
const_1722247063383427000 == 
-99999
----

\* CONSTANT definitions @modelParameterConstants:1Tuples
const_1722247063383428000 == 
[1..4 -> -3..3]
----

\* Constant expression definition @modelExpressionEval
const_expr_1722247063384429000 == 
{(x \in {3,2}): x \in {3,2}}
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1722247063384429000>>)
----

\* INIT definition @modelBehaviorNoSpec:0
init_1722247063384430000 ==
FALSE/\done = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_1722247063384431000 ==
FALSE/\done' = done
----
=============================================================================
\* Modification History
\* Created Mon Jul 29 11:57:43 CEST 2024 by dario
