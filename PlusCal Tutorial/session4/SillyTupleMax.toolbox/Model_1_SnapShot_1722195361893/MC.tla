---- MODULE MC ----
EXTENDS SillyTupleMax, TLC

\* CONSTANT definitions @modelParameterConstants:0minValue
const_1722195359873316000 == 
-99999
----

\* CONSTANT definitions @modelParameterConstants:1Tuples
const_1722195359873317000 == 
[1..4 -> -3..3]
----

\* Constant expression definition @modelExpressionEval
const_expr_1722195359873318000 == 
<<1,2>> \in  {t \in {<<p, q>>: p \in Int, q \in Int}: t[1]<t[2]}
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1722195359873318000>>)
----

\* INIT definition @modelBehaviorNoSpec:0
init_1722195359873319000 ==
FALSE/\done = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_1722195359873320000 ==
FALSE/\done' = done
----
=============================================================================
\* Modification History
\* Created Sun Jul 28 21:35:59 CEST 2024 by dario
