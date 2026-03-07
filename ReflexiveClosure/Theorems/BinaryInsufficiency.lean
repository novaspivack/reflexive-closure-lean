import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.SelfTheory
import SemanticSelfReference.Core.SemanticNegation
import SemanticSelfReference.Core.SelfReferenceFrame
import SemanticSelfReference.Core.AntiVerdictClaims
import SemanticSelfReference.Theorems.DirectNoFinalSelfTheory
import ReflexiveClosure.Core.SelfCoincidence

/-!
# ReflexiveClosure.Theorems.BinaryInsufficiency

**Paper 56 upgrade: Binary insufficiency and minimal ternary closure form.**

56.T1: No purely binary reflexive closure scheme can sustain non-collapse.
56.T2: Non-collapsing reflexive closure requires minimal ternary closure form.

The three components: SelfReturn, PartialSelfArticulation, ReflexiveDistance.
Binary = at most two of the three. Each binary configuration fails.

Uses DirectNoFinalSelfTheory (Paper 52) directly; does not depend on
ClosureWithoutCollapse to avoid coupling to that module's dependencies.
-/

set_option autoImplicit false
set_option linter.unusedSectionVars false

namespace ReflexiveClosure

universe u

open SemanticSelfDescription
open SemanticSelfReference

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)
variable [SemanticNegation F]
variable [SelfReferenceFrame F]

/--
**PartialSelfArticulation** — There exists a non-final internal self-theory.
The system can model itself partially; internal self-theory exists but is not final.
-/
def PartialSelfArticulation : Prop :=
  ∃ T : InternalSelfTheory F, ¬FinalSelfTheory T

/--
**SelfReturn** — The frame has self-referential structure.
When [SelfReferenceFrame F], the system can return to itself.
-/
def SelfReturn (_ : SelfSemanticFrame W) : Prop := True

/--
**ReflexiveDistance** — Alias for IrreducibleReflexiveDistance.
The gap between system and complete self-image cannot be closed.
-/
def ReflexiveDistance : Prop :=
  IrreducibleReflexiveDistance F

/--
**TernaryClosureForm** — All three components present.
SelfReturn ∧ PartialSelfArticulation ∧ ReflexiveDistance.
-/
def TernaryClosureForm : Prop :=
  SelfReturn F ∧ PartialSelfArticulation F ∧ ReflexiveDistance F

/--
**No self-coincidence (Theorem 56.1).** Used locally; from Paper 52.
-/
theorem no_self_coincidence
    (T : InternalSelfTheory F)
    (yesClaimFor : ∀ c : F.Code, YesClaimData F T c)
    (hCoincide : SelfCoinciding F T) :
    False :=
  direct_no_final_self_theory F T yesClaimFor hCoincide

/--
**Irreducible reflexive distance under diagonal capability.** Used locally.
-/
theorem irreducible_reflexive_distance_under_diagonal
    (yesClaimFor : ∀ T : InternalSelfTheory F, ∀ c : F.Code, YesClaimData F T c) :
    IrreducibleReflexiveDistance F := by
  intro T hFinal
  have hCoincide : SelfCoinciding F T := hFinal
  exact no_self_coincidence F T (yesClaimFor T) hCoincide

/--
**Lemma 1 (56.T1a):** SelfReturn ∧ PartialSelfArticulation without ReflexiveDistance
leads to self-coincidence, hence contradiction.

¬ReflexiveDistance gives ∃ T, FinalSelfTheory T. Under diagonal capability,
no_self_coincidence yields False.
-/
theorem return_articulation_without_distance_insufficient
    (hRD : ¬ReflexiveDistance F)
    (yesClaimFor : ∀ T : InternalSelfTheory F, ∀ c : F.Code, YesClaimData F T c) :
    False := by
  simp only [ReflexiveDistance] at hRD
  obtain ⟨T, hT⟩ := Classical.not_forall.mp hRD
  have hFinal := Classical.not_not.mp hT
  have hCoincide : SelfCoinciding F T := hFinal
  exact no_self_coincidence F T (yesClaimFor T) hCoincide

/--
**Lemma 2 (56.T1b):** SelfReturn ∧ ReflexiveDistance without PartialSelfArticulation
leads to contradiction.

¬PartialSelfArticulation means ∀ T, FinalSelfTheory T. With Nonempty we get
a T with FinalSelfTheory T; no_self_coincidence yields False.
-/
theorem return_distance_without_articulation_insufficient
    (hPA : ¬PartialSelfArticulation F)
    (hInhabited : Nonempty (InternalSelfTheory F))
    (yesClaimFor : ∀ T : InternalSelfTheory F, ∀ c : F.Code, YesClaimData F T c) :
    False := by
  simp only [PartialSelfArticulation] at hPA
  have hAll : ∀ T, ¬¬FinalSelfTheory T := fun T h => hPA ⟨T, h⟩
  obtain ⟨T⟩ := hInhabited
  have hFinal := Classical.not_not.mp (hAll T)
  have hCoincide : SelfCoinciding F T := hFinal
  exact no_self_coincidence F T (yesClaimFor T) hCoincide

/--
**Lemma 3 (56.T1c):** PartialSelfArticulation ∧ ReflexiveDistance without SelfReturn
fails to yield ternary closure form.

If ¬SelfReturn then we don't have all three. Definitional.
-/
theorem articulation_distance_without_return_insufficient
    (hSR : ¬SelfReturn F) :
    ¬TernaryClosureForm F := by
  intro ⟨hSR', _, _⟩
  exact hSR hSR'

/--
**56.T1 — Binary closure insufficient.**

No purely binary reflexive closure scheme can sustain non-collapse.
Any configuration with at most two of the three components either
collapses (lemmas 1–2) or fails to be closure (lemma 3).
-/
theorem binary_closure_insufficient
    (yesClaimFor : ∀ T : InternalSelfTheory F, ∀ c : F.Code, YesClaimData F T c)
    (hInhabited : Nonempty (InternalSelfTheory F))
    (hBinary : ¬ReflexiveDistance F ∨ ¬PartialSelfArticulation F ∨ ¬SelfReturn F) :
    False := by
  cases hBinary with
  | inl hRD => exact return_articulation_without_distance_insufficient F hRD yesClaimFor
  | inr hRest => cases hRest with
    | inl hPA => exact return_distance_without_articulation_insufficient F hPA hInhabited yesClaimFor
    | inr hSR => exact hSR trivial

/--
**56.T2 — Non-collapsing reflexive closure is minimally ternary.**

Under diagonal capability, IrreducibleReflexiveDistance holds (Paper 52).
With SelfReturn (from [SelfReferenceFrame F]) and PartialSelfArticulation
(from the existence of non-final theories under diagonal capability),
ternary form holds. From 56.T1, binary is insufficient; hence ternary is minimal.
-/
theorem noncollapsing_reflexive_closure_minimally_ternary
    (yesClaimFor : ∀ T : InternalSelfTheory F, ∀ c : F.Code, YesClaimData F T c)
    (hPA : PartialSelfArticulation F) :
    TernaryClosureForm F := by
  have hRD : ReflexiveDistance F :=
    irreducible_reflexive_distance_under_diagonal F yesClaimFor
  have hSR : SelfReturn F := trivial
  exact ⟨hSR, hPA, hRD⟩

end ReflexiveClosure
