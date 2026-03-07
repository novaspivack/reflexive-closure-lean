import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.SelfTheory
import SemanticSelfReference.Core.SemanticNegation
import SemanticSelfReference.Core.SelfReferenceFrame
import SemanticSelfReference.Core.AntiVerdictClaims
import ReflexiveClosure.Theorems.BinaryInsufficiency
import RealityAsRecursiveIntelligence.Core.ReflexiveReality
import UnifiedPresence.Core.ArticulationAspect

/-!
# UnifiedPresence.Bridge.ToReflexiveClosure

**Paper 69: Bridge from three-aspect synthesis to Paper 56 minimal ternary closure.**

Paper 56 established that non-collapsing reflexive closure is of minimal ternary
closure form (56.T1: binary insufficient, 56.T2: ternary minimal). The present
theorem shows that when the three-aspect synthesis holds (ground, articulation,
manifestation-in-awareness), the underlying self-semantic frame satisfies that
same minimal ternary structure.

This is structural recurrence: the ontological triad instantiates the pattern
already proved necessary at the reflexive-closure level. Not a new premise for
69.1–69.4; a further structural unification.
-/

set_option autoImplicit false

namespace UnifiedPresence

universe u

open ReflexiveClosure
open RealityAsRecursiveIntelligence
open SemanticSelfDescription
open SemanticSelfReference

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)
variable [SemanticNegation F]
variable [SelfReferenceFrame F]

/--
**Proposition 69.T (bridge):** When the articulation aspect holds at a frontier
under diagonal capability, the underlying frame satisfies the minimal ternary
closure form established in Paper 56.

The three ontological aspects (ground, articulation, manifestation-in-awareness)
structurally instantiate the same ternary pattern: SelfReturn, PartialSelfArticulation,
ReflexiveDistance. Paper 56 proved this form is minimal for non-collapsing
reflexive closure; Paper 69 shows the ontological synthesis recapitulates it.
-/
theorem three_aspect_synthesis_instantiates_minimal_ternary_closure
    (frontier : Set F.Claim)
    (R : NontrivialReflexiveReality F frontier)
    (yesClaimFor : ∀ T : InternalSelfTheory F, ∀ c : F.Code, YesClaimData F T c)
    (hInhabited : Nonempty (InternalSelfTheory F)) :
    ReflexiveClosure.TernaryClosureForm F := by
  have hRD : ReflexiveClosure.ReflexiveDistance F := R.irreducible_distance
  have hSR : ReflexiveClosure.SelfReturn F := trivial
  have hPA : ReflexiveClosure.PartialSelfArticulation F := by
    obtain ⟨T⟩ := hInhabited
    use T
    intro hFinal
    have hCoincide : ReflexiveClosure.SelfCoinciding F T := hFinal
    exact ReflexiveClosure.no_self_coincidence F T (yesClaimFor T) hCoincide
  exact ⟨hSR, hPA, hRD⟩

end UnifiedPresence
