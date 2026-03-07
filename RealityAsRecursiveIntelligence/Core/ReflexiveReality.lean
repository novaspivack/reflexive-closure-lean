import SemanticSelfDescription.Core.Claims
import ReflexiveClosure.Core.SelfCoincidence
import ReflexiveUnfolding.Core.Frontier
import ReflexiveUnfolding.Core.TerminalCompletion
import NecessaryReflexiveIntelligence.Core.ChooserHierarchy
import NecessaryReflexiveIntelligence.Core.MinimalReflexiveIntelligence

/-!
# RealityAsRecursiveIntelligence.Core.ReflexiveReality

**Nontrivial reflexive reality (Paper 60).**

A nontrivial self-contained reflexive reality is a reflexive system that:
(1) has irreducible reflexive distance (Paper 56—no self-coincidence),
(2) has a live frontier with semantic remainder (Paper 57—non-terminal),
(3) has adjudicative execution (Paper 58—lawful non-algorithmic).

This structure bundles the summit hypotheses. The unified theorem (Paper 60)
shows that such a reality cannot close as static self-identity, persists as
recursive frontier-generation, and is recursively intelligent.
-/

set_option autoImplicit false

namespace RealityAsRecursiveIntelligence

universe u

open ReflexiveUnfolding
open SemanticSelfDescription

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
**NontrivialReflexiveReality** — A reflexive reality at a live frontier with
the full summit structure: irreducible reflexive distance (Paper 56), semantic
remainder (live frontier, Paper 57), and adjudicative execution (Paper 58).

This is the hypothesis structure for the unified theorem. When these hold,
the reality cannot close as static self-identity and exhibits recursive
intelligence.
-/
structure NontrivialReflexiveReality (frontier : Set F.Claim) where
  irreducible_distance : ReflexiveClosure.IrreducibleReflexiveDistance F
  semantic_remainder : SemanticRemainder F frontier
  adjudicative_level : NecessaryReflexiveIntelligence.ChooserLevel
  adjudicative : NecessaryReflexiveIntelligence.AdjudicativeLevel adjudicative_level

/--
**NontrivialReflexiveRealityAtSomeFrontier** — There exists a frontier at
which the reality exhibits the full nontrivial reflexive structure.
-/
def NontrivialReflexiveRealityAtSomeFrontier : Prop :=
  ∃ frontier : Set F.Claim, Nonempty (NontrivialReflexiveReality F frontier)

end RealityAsRecursiveIntelligence
