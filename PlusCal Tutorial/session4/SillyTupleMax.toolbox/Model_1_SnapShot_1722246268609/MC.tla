---- MODULE MC ----
EXTENDS SillyTupleMax, TLC

\* CONSTANT definitions @modelParameterConstants:0minValue
const_1722246266592387000 == 
-99999
----

\* CONSTANT definitions @modelParameterConstants:1Tuples
const_1722246266592388000 == 
[1..4 -> -3..3]
----

\* Constant expression definition @modelExpressionEval
const_expr_1722246266592389000 == 
{v \in UNION({ {1,2},{2} }) : \A r \in { {1,2},{2} } : v \in r}
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_1722246266592389000>>)
----

\* INIT definition @modelBehaviorNoSpec:0
init_1722246266592390000 ==
FALSE/\done = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_1722246266592391000 ==
FALSE/\done' = done
----
=============================================================================
\* Modification History
\* Created Mon Jul 29 11:44:26 CEST 2024 by dario
