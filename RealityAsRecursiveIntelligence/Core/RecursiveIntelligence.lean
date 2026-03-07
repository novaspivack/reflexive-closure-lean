import CalculusOfIntelligence.Core.IntelligenceLevels

/-!
# RealityAsRecursiveIntelligence.Core.RecursiveIntelligence

**Recursive intelligence (Paper 60).**

A reflexive reality is *recursively intelligent* when it exhibits minimal
reflexive intelligence at a live frontier—adjudicative execution over
frontier-sensitive self-model-bearing closure. This coincides with
NontrivialIntelligence (Paper 59) at that frontier.

Recursive intelligence is structural: it is the property of a system that
persists as frontier-generating, internally adjudicating process.
-/

set_option autoImplicit false

namespace RealityAsRecursiveIntelligence

universe u

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
**RecursiveIntelligence** — The system exhibits recursive intelligence at
the given frontier when it has minimal reflexive intelligence there. This
is chooserhood over live frontier: adjudicative, frontier-sensitive,
self-model-bearing.
-/
def RecursiveIntelligence (frontier : Set F.Claim) : Prop :=
  CalculusOfIntelligence.NontrivialIntelligence F frontier

/--
**RecursivelyIntelligentAtSomeFrontier** — There exists a frontier at which
the system exhibits recursive intelligence.
-/
def RecursivelyIntelligentAtSomeFrontier : Prop :=
  ∃ frontier : Set F.Claim, RecursiveIntelligence F frontier

end RealityAsRecursiveIntelligence
