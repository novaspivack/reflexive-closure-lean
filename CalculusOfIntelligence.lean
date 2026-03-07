import CalculusOfIntelligence.Core.IntelligenceLevels
import CalculusOfIntelligence.Core.SelfModelDepth
import CalculusOfIntelligence.Theorems.HierarchyTheorems
import CalculusOfIntelligence.Bridge.FromEpistemicAgency

/-!
# CalculusOfIntelligence — Paper 59: A Calculus of Intelligence

**Frontier, adjudication, and self-modeling in reflexive systems.**

Defines intelligence formally as a hierarchy of chooserhood over live frontier.
Without frontier, there is no nontrivial intelligence. Frontier-bearing
reflexive systems admit precise intelligence levels.

## Key definitions

- `IntelligenceLevel`, `NontrivialIntelligence` — intelligence levels
- `SelfModelDepth`, `HasDepth` — graded self-modeling
- `no_intelligence_without_frontier` — Theorem 59.1

## Key theorems

- `no_intelligence_without_frontier` — Theorem 59.1
- `terminal_implies_no_nontrivial_intelligence` — Corollary 59.2
- `minimal_intelligence_at_least_level_two` — Theorem 59.3
- `hierarchy_monotonic` — Proposition 59.4

## Dependencies

- reflexive-closure-lean NecessaryReflexiveIntelligence (Paper 58)
- ReflexiveUnfolding (Paper 57), ReflexiveClosure (Paper 56)
-/
