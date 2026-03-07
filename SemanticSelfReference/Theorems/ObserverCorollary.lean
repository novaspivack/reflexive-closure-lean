import Mathlib.Data.Set.Basic
import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.SelfTheory
import SemanticSelfDescription.Theorems.NoFinalSelfTheory
import SemanticSelfDescription.Bridge.ToSelfAwareness
import SemanticSelfReference.Core.SemanticNegation
import SemanticSelfReference.Core.SelfReferenceFrame
import SemanticSelfReference.Core.AntiVerdictClaims
import SemanticSelfReference.Theorems.DirectNoFinalSelfTheory

/-!
# SemanticSelfReference.Theorems.ObserverCorollary

**Paper 54: Observers, Minds, and Reflexive Non-Self-Exhaustion.**

Formal observer self-model objects and the no-self-exhausting-observer theorem.
An observer's internal self-model, when total and exact on the self-semantic family,
would constitute a final internal self-theory. Paper 52 proves no such theory exists.
Therefore no observer can be self-exhausting.

## Key definitions

- `ObserverSelfModel` — observer's internal self-model (wraps InternalSelfTheory)
- `CompleteObserverModel` — total and exact on full family (forbidden)
- `StratifiedObserverModel` — total and exact on a proper subset (allowable)
- `no_self_exhausting_observer` — no complete observer model under diagonal capability

## Positive theorem

- `stratified_observer_model_empty` — shows non-vacuity of StratifiedObserverModel (any observer
  is total and exact on ∅). The nontrivial positive content (stratified observerhood over
  meaningful restricted classes) is supplied by Paper 33's allowable lower self-awareness
  classes and the bridge theorems, not by this vacuous witness.

## Bridge to Paper 33

- `complete_observer_model_implies_barrier_violation` — complete model would imply
  forbidden total decider; contradicts selector necessity (Paper 33).
-/

set_option autoImplicit false
set_option linter.unusedSectionVars false

namespace SemanticSelfReference

universe u v

open SemanticSelfDescription

variable {W : Type u} (F : SelfSemanticFrame W)
variable [SemanticNegation F]
variable [SelfReferenceFrame F]

/--
**Observer self-model** (Paper 54).

An observer's internal representation of itself is modeled as an internal self-theory.
The structure wraps `InternalSelfTheory` to make the observer interpretation explicit.
-/
structure ObserverSelfModel where
  selfModel : InternalSelfTheory F

/--
**Complete observer model** — total and exact on the full self-semantic family.

A complete observer model would exhaust realized semantic truth. Paper 52 proves
no such model exists under diagonal capability.
-/
def CompleteObserverModel (O : ObserverSelfModel F) : Prop :=
  FinalSelfTheory O.selfModel

/--
**Paper 54 Theorem 54.1:** No observer can be self-exhausting.

Under diagonal capability (SemanticNegation + SelfReferenceFrame + yes-claim data),
no observer can possess a complete self-model. Immediate from `direct_no_final_self_theory`.
-/
theorem no_self_exhausting_observer
    (O : ObserverSelfModel F)
    (yesClaimFor : ∀ c : F.Code, YesClaimData F O.selfModel c)
    (hComplete : CompleteObserverModel F O) :
    False :=
  direct_no_final_self_theory F O.selfModel yesClaimFor hComplete

/--
**Alternate formulation:** Direct on InternalSelfTheory (for backward compatibility).

When the self-model T is final and yes-claim data holds, contradiction.
-/
theorem no_self_exhausting_observer'
    (T : InternalSelfTheory F)
    (yesClaimFor : ∀ c : F.Code, YesClaimData F T c)
    (hFinal : FinalSelfTheory T) :
    False :=
  direct_no_final_self_theory F T yesClaimFor hFinal

/--
**Total on restricted set** — theory assigns non-abstain verdict to every code in S.
-/
def TotalOnRestricted (T : InternalSelfTheory F) (S : Set F.Code) : Prop :=
  ∀ c ∈ S, T.verdict c ≠ Verdict.abstain

/--
**Exact on restricted set** — verdicts match realized truth for every code in S.
-/
def ExactOnRestricted (T : InternalSelfTheory F) (S : Set F.Code) : Prop :=
  ∀ c ∈ S,
    (T.verdict c = Verdict.yes ↔ F.RealizedTrue (F.decode c)) ∧
    (T.verdict c = Verdict.no ↔ ¬ F.RealizedTrue (F.decode c))

/--
**Stratified observer model** (Paper 54).

An observer has a stratified self-model over S when S is a proper subset of the
full code space and the self-model is total and exact on S. Stratified models
correspond to allowable lower self-awareness layers (Paper 33).
-/
def StratifiedObserverModel (O : ObserverSelfModel F) (S : Set F.Code) : Prop :=
  S ⊂ Set.univ ∧
  TotalOnRestricted F O.selfModel S ∧
  ExactOnRestricted F O.selfModel S

/--
**Paper 54 Theorem 54.2 (trivial case):** Stratified observer models exist.

The empty set admits a vacuously stratified model: any observer is total and
exact on ∅. This establishes non-vacuity of the formal StratifiedObserverModel
notion. The nontrivial positive content (stratified observerhood over meaningful
restricted classes such as Paper 33's base class C₀) is supplied by the bridge
to Paper 33, not by this witness. Requires `Nonempty F.Code` so that ∅ is a
proper subset of the full code space.
-/
theorem stratified_observer_model_empty
    [Nonempty F.Code]
    (O : ObserverSelfModel F) :
    StratifiedObserverModel F O ∅ := by
  constructor
  · exact Set.Nonempty.empty_ssubset Set.univ_nonempty
  · constructor
    · intro c hc
      exact absurd hc (Set.mem_empty_iff_false c).mp
    · intro c hc
      exact absurd hc (Set.mem_empty_iff_false c).mp

/--
**Bridge to Paper 33:** Complete observer model implies forbidden total decider.

A complete observer model would induce `DecidableAt S_all` for self-semantic
truth. Under BarrierHypotheses, selector necessity (Paper 33) rules that out.
-/
theorem complete_observer_model_implies_barrier_violation
    (O : ObserverSelfModel F)
    (hComplete : CompleteObserverModel F O)
    (hB : SemanticSelfDescription.BarrierHypotheses F) :
    False := by
  have hDec : SelectorStrength.DecidableAt SelectorStrength.S_all F.selfSemanticTruth :=
    SemanticSelfDescription.finalTheory_induces_decidableAt F O.selfModel hComplete
  exact SemanticSelfDescription.selector_necessity_under_barrier F hB hDec

end SemanticSelfReference
