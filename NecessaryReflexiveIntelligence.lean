import NecessaryReflexiveIntelligence.Core.ExecutionModes
import NecessaryReflexiveIntelligence.Core.ChooserHierarchy
import NecessaryReflexiveIntelligence.Core.MinimalReflexiveIntelligence
import NecessaryReflexiveIntelligence.Bridge.FromNemS
import NecessaryReflexiveIntelligence.Bridge.FromStructuredFramework
import NecessaryReflexiveIntelligence.Bridge.FromReflexiveUnfolding
import NecessaryReflexiveIntelligence.Theorems.NecessaryAdjudication

/-!
# NecessaryReflexiveIntelligence — Paper 58: Necessary Reflexive Intelligence

**Why nontrivial reflexive worlds are not random or robotic.**

Classifies the execution layer of a reflexive universe: neither dead mechanism
nor brute-randomness, but lawful non-algorithmic adjudication. Under
frontier-sensitive self-model-bearing closure, minimally intelligent in a
structural sense.

## Key definitions

- `DeadMechanistic`, `BruteRandom`, `Adjudicative` — execution modes
- `ChooserLevel`, `AtLeastLevel`, `AdjudicativeLevel` — chooser hierarchy
- `MinimalReflexiveIntelligence` — adjudicative + frontier-sensitive + self-model-bearing

## Key theorems

- `not_dead_mechanistic` — Theorem 58.1 (from nems-lean irreducible_agency)
- `not_brute_random` — Theorem 58.2 (structured framework)
- `necessary_adjudication` — Theorem 58.3 (necessarily adjudicative)

## Dependencies

- reflexive-closure-lean ReflexiveUnfolding (Paper 57), ReflexiveClosure (Paper 56)
- nems-lean NemS.Adjudication (Papers 15, 19, 22)
-/
