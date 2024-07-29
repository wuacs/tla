---- MODULE MC ----
EXTENDS SillyTupleMax, TLC

\* CONSTANT definitions @modelParameterConstants:0minValue
const_1722247092937437000 == 
-99999
----

\* CONSTANT definitions @modelParameterConstants:1Tuples
const_1722247092937438000 == 
[1..4 -> -3..3]
----

\* Constant expression definition @modelExpressionEval
const_expr_1722247092937439000 == 
{(x \in {}): x \in {}}
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1722247092937439000>>)
----

\* INIT definition @modelBehaviorNoSpec:0
init_1722247092937440000 ==
FALSE/\done = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_1722247092937441000 ==
FALSE/\done' = done
----
=============================================================================
\* Modification History
\* Created Mon Jul 29 11:58:12 CEST 2024 by dario
