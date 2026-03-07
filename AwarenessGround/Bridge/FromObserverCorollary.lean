import AwarenessGround.Core.AwarenessLocus
import AwarenessGround.Core.LocusOfAlphaPresence
import AwarenessGround.Core.RealizedAwareness
import AwarenessGround.Core.RequiresSameLevelObserver
import AwarenessGround.Core.SelfIllumination
import SemanticSelfReference.Theorems.ObserverCorollary
import SemanticSelfDescription.Theorems.NoFinalSelfTheory

/-!
# AwarenessGround.Bridge.FromObserverCorollary

**Paper 67 + Paper 33: Discharge 67.6b from Paper 33 observer structure.**

When awareness loci are mapped to observer self-models and BarrierHypotheses holds,
Paper 33 (no complete self-model) proves that realized awareness does not require
same-level mediation. This replaces the placeholder in Core.RequiresSameLevelObserver.

## Key definitions

- `sameLevelMediationPaper33` — B mediates A iff A's observer-model is complete
  (CompleteObserverModel F (LocusToObserver A)). Paper 33 proves this never holds.

## Key theorems

- `not_requires_same_level_observer_p33` — under BarrierHypotheses, no locus
  requires same-level mediation (from complete_observer_model_implies_barrier_violation)
- `realized_awareness_not_requires_same_level_observer_p33` — 67.6b (Paper 33 discharge)
- `awareness_locus_self_illuminating_p33` — 67.6 with Paper 33 proof
-/

set_option autoImplicit false
set_option linter.unusedSectionVars false

namespace AwarenessGround

universe u v w

open SemanticSelfDescription SemanticSelfReference

variable {Ledger : Type u} {Ground : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}
variable {LedgerActuality : Ledger → Prop}
variable {GroundIsSyntax : Ground → Prop}
variable {GroundIsObjectLevelSemantics : Ground → Prop}
variable {GroundIsExternalEqualStatus : Ground → Prop}
variable {GroundIsGhost : Ground → Prop}
variable {SelfActualizingLedger : Ledger → Prop}

variable {W : Type w} {F : SemanticSelfDescription.SelfSemanticFrame W}
variable [SemanticSelfReference.SemanticNegation F]
variable [SemanticSelfReference.SelfReferenceFrame F]
variable {Subject : Type v}
variable {AwareOfQuale : Subject → F.Claim → Prop}
variable {ContentOf : F.Claim → Ledger → Prop}

variable {Locus : Type v}

/--
**SameLevelMediation (Paper 33)** — B would mediate A iff A's observer-model is complete.

LocusToObserver maps each locus to its observer self-model. When A's self-model is
complete, A would be fully objectifiable; Paper 33 rules this out.
The B parameter is formal; the key is CompleteObserverModel F (locToObs A).
-/
def sameLevelMediationPaper33 (locToObs : Locus → SemanticSelfReference.ObserverSelfModel F) (_B A : Locus) : Prop :=
  SemanticSelfReference.CompleteObserverModel F (locToObs A)

/--
**67.6b (Paper 33 discharge):** Under BarrierHypotheses, no locus requires same-level mediation.

From `complete_observer_model_implies_barrier_violation`: a complete observer model
would imply a forbidden total decider; Paper 33 (selector necessity) rules that out.
Hence ¬CompleteObserverModel F (LocusToObserver A) for any A.
-/
theorem not_requires_same_level_observer_p33
  (locToObs : Locus → SemanticSelfReference.ObserverSelfModel F)
  (hB : BarrierHypotheses F) (A : Locus) :
  ¬RequiresSameLevelObserverWith (sameLevelMediationPaper33 locToObs) A := by
  intro hR
  obtain ⟨_B, _hBne, hMed⟩ := hR
  exact SemanticSelfReference.complete_observer_model_implies_barrier_violation
    F (locToObs A) hMed hB

/--
**67.6b (Paper 33):** RealizedAwareness(A) ⇒ ¬RequiresSameLevelObserver (Paper 33 mediation).

Discharged from Paper 33. Realized awareness does not require same-level mediation
because the observer/locus cannot be exhaustively objectified.
-/
theorem realized_awareness_not_requires_same_level_observer_p33
  (locToObs : Locus → SemanticSelfReference.ObserverSelfModel F)
  (HasAlphaManifestation : F.Claim → Prop) (A : Locus)
  (hB : BarrierHypotheses F)
  (_hRA : RealizedAwareness F HasAlphaManifestation A) :
  ¬RequiresSameLevelObserverWith (sameLevelMediationPaper33 locToObs) A :=
  not_requires_same_level_observer_p33 locToObs hB A

/--
**SelfIlluminating (Paper 33)** — Uses the Paper 33 mediation relation.
-/
def SelfIlluminatingPaper33 (locToObs : Locus → SemanticSelfReference.ObserverSelfModel F)
    (HasAlphaManifestation : F.Claim → Prop) (A : Locus) : Prop :=
  RealizedAwareness F HasAlphaManifestation A ∧
  ¬RequiresSameLevelObserverWith (sameLevelMediationPaper33 locToObs) A

/--
**67.6 (Paper 33):** AwarenessLocus(A) ∧ LocusOfAlphaPresence(A) ⇒ SelfIlluminating (Paper 33).

Derived from 67.6a, 67.6b (Paper 33), 67.6c. No placeholder; fully discharged.
-/
theorem awareness_locus_self_illuminating_p33
  (locToObs : Locus → SemanticSelfReference.ObserverSelfModel F)
  (HasAlphaManifestation : F.Claim → Prop) (A : Locus)
  (hB : BarrierHypotheses F)
  (hLoc : AwarenessLocus A) (hLocus : LocusOfAlphaPresence F HasAlphaManifestation A) :
  SelfIlluminatingPaper33 locToObs HasAlphaManifestation A := by
  constructor
  · exact locus_of_alpha_presence_implies_realized_awareness F HasAlphaManifestation A hLocus
  · exact realized_awareness_not_requires_same_level_observer_p33 locToObs
      HasAlphaManifestation A hB
      (locus_of_alpha_presence_implies_realized_awareness F HasAlphaManifestation A hLocus)

/--
**67.7 (Paper 33):** SelfIlluminating (Paper 33) ⇒ no second same-level observer required.
-/
theorem self_illuminating_p33_no_second_observer_required
  (locToObs : Locus → SemanticSelfReference.ObserverSelfModel F)
  (HasAlphaManifestation : F.Claim → Prop) (A : Locus)
  (hSI : SelfIlluminatingPaper33 locToObs HasAlphaManifestation A) :
  ¬RequiresSameLevelObserverWith (sameLevelMediationPaper33 locToObs) A :=
  hSI.2

end AwarenessGround
