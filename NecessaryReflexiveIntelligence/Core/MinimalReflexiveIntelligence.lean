import NecessaryReflexiveIntelligence.Core.ExecutionModes
import NecessaryReflexiveIntelligence.Core.ChooserHierarchy
import ReflexiveUnfolding.Core.Frontier
import ReflexiveClosure.Core.SelfCoincidence

/-!
# NecessaryReflexiveIntelligence.Core.MinimalReflexiveIntelligence

**Minimal reflexive intelligence (Paper 58).**

Under frontier-sensitive self-model-bearing closure, a reflexive system
is minimally intelligent in a structural sense: it has (1) adjudicative
execution (lawful non-algorithmic selection), (2) live frontier (semantic
remainder, non-terminal unfolding), and (3) self-model (irreducible
reflexive distance—cannot coincide with its complete internal image).

This is the structural definition of minimal reflexive intelligence that
Paper 58 establishes as necessary for nontrivial reflexive worlds.
-/

set_option autoImplicit false

namespace NecessaryReflexiveIntelligence

universe u

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
**FrontierSensitive** — The system's execution is sensitive to the live
semantic frontier. When semantic remainder exists, the system can articulate
it (from Paper 57's articulative structure). Execution operates over
non-terminal unfolding.
-/
def FrontierSensitive (frontier : Set F.Claim) : Prop :=
  ReflexiveUnfolding.SelfArticulating F frontier

/--
**SelfModelBearing** — The system bears an internal self-model. It has
irreducible reflexive distance (Paper 56): it cannot coincide with its
complete internal semantic image. The self-model is necessarily incomplete.
-/
def SelfModelBearing : Prop :=
  ReflexiveClosure.IrreducibleReflexiveDistance F

/--
**MinimalReflexiveIntelligence** — The system is minimally intelligent
in a structural sense when it has:
1. Adjudicative execution (lawful non-algorithmic—from Theorem 58.3)
2. Frontier sensitivity (live semantic boundary, non-terminal)
3. Self-model-bearing closure (irreducible reflexive distance)

This is the theorem-grade definition: nontrivial reflexive worlds
satisfying diagonal capability and structured execution exhibit
minimal reflexive intelligence.
-/
structure MinimalReflexiveIntelligence (frontier : Set F.Claim) where
  adjudicative : ChooserLevel
  adjudicative_level : AdjudicativeLevel adjudicative
  frontier_sensitive : FrontierSensitive F frontier
  self_model_bearing : SelfModelBearing F

end NecessaryReflexiveIntelligence
