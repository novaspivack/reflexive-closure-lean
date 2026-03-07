import GroundedExistence.Core.Definitions
import Alpha.Theorems.AlphaTheorem
import Alpha.Core.ReflexiveRealityExistence
import LedgerGround.Bridge.ToSyntaxSemantics
import LedgerGround.Bridge.ToReflexiveFinality
import LedgerGround.Bridge.ToGhostCollapse

/-!
# GroundedExistence.Theorems.GroundedExistenceThm

**Theorem 64.1: Grounded Existence (Paper 64).**

Whatever exists (admissible content of reflexive reality) is Alpha-grounded.
Existence entails Alpha-groundedness.
-/

set_option autoImplicit false

universe u v w

variable {Ledger : Type u} {Ground : Type v} {Entity : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}
variable {LedgerActuality : Ledger → Prop}
variable {GroundIsSyntax : Ground → Prop}
variable {GroundIsObjectLevelSemantics : Ground → Prop}
variable {GroundIsExternalEqualStatus : Ground → Prop}
variable {GroundIsGhost : Ground → Prop}
variable {SelfActualizingLedger : Ledger → Prop}
variable (ContentOf : Entity → Ledger → Prop)

namespace GroundedExistence

open Alpha
open LedgerGround

variable {W : Type w} (F : SemanticSelfDescription.SelfSemanticFrame W)
variable [SemanticSelfReference.SemanticNegation F]
variable [SemanticSelfReference.SelfReferenceFrame F]
variable (S : NemS.Reflexive.ReflexiveTheorySpace)
variable (toTheory : Ledger → S.Theory)
variable (toMeta : Ground → S.Theory)
variable (OffLedger : Entity → Prop)
variable (DeterminacyRelevant : Entity → Prop)
variable (SemanticNull : Entity → Prop)
variable (hBridgeSyn : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
  (hSyn : GroundIsSyntax g) → SyntacticGroundingInducesExhaustion F g R hGround hSyn)
variable (hBridgeExt : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
  (hExt : GroundIsExternalEqualStatus g) →
    @ExternalGroundingInterpretation Ledger Ground OntologicalGround GroundIsExternalEqualStatus
      S toTheory toMeta g R hGround hExt)
variable (hBridgeGhost : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
  (hGhost : GroundIsGhost g) →
    @GhostGroundingInterpretation Ledger Ground OntologicalGround GroundIsGhost Entity
      OffLedger DeterminacyRelevant SemanticNull g R hGround hGhost)

/--
**Theorem 64.1 (Grounded Existence):** If x is admissible content of reflexive
reality R, then x is Alpha-grounded.

Proof: By Theorem 63.3, ∃ α, NecessaryGround α R. We have ContentOf x R and
LedgerActuality R (from NontrivialReflexiveRealityExists). So GroundedInAlpha x.
-/
theorem grounded_existence_thm
  (F : SemanticSelfDescription.SelfSemanticFrame W)
  [SemanticSelfReference.SemanticNegation F]
  [SemanticSelfReference.SelfReferenceFrame F]
  (S : NemS.Reflexive.ReflexiveTheorySpace)
  (toTheory : Ledger → S.Theory)
  (toMeta : Ground → S.Theory)
  (OffLedger : Entity → Prop)
  (DeterminacyRelevant : Entity → Prop)
  (SemanticNull : Entity → Prop)
  (hBridgeSyn : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
    (hSyn : GroundIsSyntax g) → SyntacticGroundingInducesExhaustion F g R hGround hSyn)
  (hBridgeExt : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
    (hExt : GroundIsExternalEqualStatus g) →
      @ExternalGroundingInterpretation Ledger Ground OntologicalGround GroundIsExternalEqualStatus
        S toTheory toMeta g R hGround hExt)
  (hBridgeGhost : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
    (hGhost : GroundIsGhost g) →
      @GhostGroundingInterpretation Ledger Ground OntologicalGround GroundIsGhost Entity
        OffLedger DeterminacyRelevant SemanticNull g R hGround hGhost)
  (R : Ledger) (x : Entity)
  (hExists : @NontrivialReflexiveRealityExists Ledger LedgerActuality SelfActualizingLedger R)
  (hContent : ContentOf x R) :
  @GroundedInAlpha Ledger Ground Entity OntologicalGround LedgerActuality GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost SelfActualizingLedger
    ContentOf x := by
  obtain ⟨α, hNG⟩ := alpha_theorem F S toTheory toMeta
    OffLedger DeterminacyRelevant SemanticNull hBridgeSyn hBridgeExt hBridgeGhost R hExists
  exact ⟨α, R, ⟨hNG, ⟨hContent, hExists.1⟩⟩⟩

/--
**Theorem (Alpha terminus):** There exists a necessary pre-categorial ground that
is the terminus of same-level grounding. Derived from alpha_theorem and
grounded_by_other_implies_not_sufficient_ground: necessary ground is sufficient,
and derivative grounds are not sufficient, so Alpha cannot be derivative.
-/
theorem alpha_terminus
  (F : SemanticSelfDescription.SelfSemanticFrame W)
  [SemanticSelfReference.SemanticNegation F]
  [SemanticSelfReference.SelfReferenceFrame F]
  (S : NemS.Reflexive.ReflexiveTheorySpace)
  (toTheory : Ledger → S.Theory)
  (toMeta : Ground → S.Theory)
  (OffLedger : Entity → Prop)
  (DeterminacyRelevant : Entity → Prop)
  (SemanticNull : Entity → Prop)
  (hBridgeSyn : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
    (hSyn : GroundIsSyntax g) → SyntacticGroundingInducesExhaustion F g R hGround hSyn)
  (hBridgeExt : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
    (hExt : GroundIsExternalEqualStatus g) →
      @ExternalGroundingInterpretation Ledger Ground OntologicalGround GroundIsExternalEqualStatus
        S toTheory toMeta g R hGround hExt)
  (hBridgeGhost : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
    (hGhost : GroundIsGhost g) →
      @GhostGroundingInterpretation Ledger Ground OntologicalGround GroundIsGhost Entity
        OffLedger DeterminacyRelevant SemanticNull g R hGround hGhost)
  (R : Ledger)
  (hExists : @NontrivialReflexiveRealityExists Ledger LedgerActuality SelfActualizingLedger R) :
  ∃ α : Ground, @AlphaTerminus Ledger Ground OntologicalGround GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost SelfActualizingLedger α R := by
  obtain ⟨α, hNG⟩ := alpha_theorem F S toTheory toMeta
    OffLedger DeterminacyRelevant SemanticNull hBridgeSyn hBridgeExt hBridgeGhost R hExists
  have hTerm : ¬@GroundedByOther Ledger Ground OntologicalGround α := by
    intro hDeriv
    exact grounded_by_other_implies_not_sufficient_ground α R hDeriv hNG.1
  exact ⟨α, ⟨hNG, hTerm⟩⟩

end GroundedExistence
