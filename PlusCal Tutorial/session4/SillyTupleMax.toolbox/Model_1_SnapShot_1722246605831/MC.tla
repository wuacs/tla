---- MODULE MC ----
EXTENDS SillyTupleMax, TLC

\* CONSTANT definitions @modelParameterConstants:0minValue
const_1722246603816397000 == 
-99999
----

\* CONSTANT definitions @modelParameterConstants:1Tuples
const_1722246603816398000 == 
[1..4 -> -3..3]
----

\* Constant expression definition @modelExpressionEval
const_expr_1722246603817399000 == 
{(x \in {{1,2}}): x \in {{1,2}}}
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1722246603817399000>>)
----

\* INIT definition @modelBehaviorNoSpec:0
init_1722246603817400000 ==
FALSE/\done = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_1722246603817401000 ==
FALSE/\done' = done
----
=============================================================================
\* Modification History
\* Created Mon Jul 29 11:50:03 CEST 2024 by dario
