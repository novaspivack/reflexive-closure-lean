import SemanticSelfDescription.Core.SelfTheory
import LedgerGround.Core.OntologicalGround
import LedgerGround.Core.GroundCategories
import LedgerGround.Bridge.ToSyntaxSemantics
import LedgerGround.Bridge.ToReflexiveFinality
import LedgerGround.Bridge.ToGhostCollapse
import Alpha.Core.PreCategorialGround
import Alpha.Core.NecessaryGround
import Alpha.Core.ReflexiveRealityExistence
import Alpha.Theorems.GroundExistence
import Alpha.Theorems.AlphaSqueeze

/-!
# Alpha.Theorems.AlphaTheorem

**Theorem 63.3: Strong Alpha theorem (Paper 63).**

There exists α such that α is the necessary pre-categorial ontological
ground of the actuality of reflexive reality.

Combines Theorem 63.2 (ground existence) and Theorem 63.1 (alpha squeeze).
Requires the full LedgerGround bridge context (Papers 53, 23, 61).
-/

set_option autoImplicit false

namespace Alpha

open LedgerGround
open NemS.Reflexive

universe u v w

variable {Ledger : Type u} {Ground : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}
variable {LedgerActuality : Ledger → Prop}
variable {GroundIsSyntax : Ground → Prop}
variable {GroundIsObjectLevelSemantics : Ground → Prop}
variable {GroundIsExternalEqualStatus : Ground → Prop}
variable {GroundIsGhost : Ground → Prop}
variable {SelfActualizingLedger : Ledger → Prop}

variable {W : Type w} (F : SemanticSelfDescription.SelfSemanticFrame W)
variable [SemanticSelfReference.SemanticNegation F]
variable [SemanticSelfReference.SelfReferenceFrame F]

variable (S : ReflexiveTheorySpace)
variable (toTheory : Ledger → S.Theory)
variable (toMeta : Ground → S.Theory)

variable {Entity : Type v}
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
**Theorem 63.3 (Strong Alpha theorem):** If nontrivial reflexive reality
exists, then there exists a necessary pre-categorial ontological ground.

Proof: By Theorem 63.2, ∃ g, OntologicalGround g R. By NontrivialReflexiveRealityExists,
¬SelfActualizingLedger R. By Theorem 63.1 (alpha squeeze), any such g is
PreCategorial g R. So ∃ g, NecessaryGround g R.
-/
theorem alpha_theorem
  (F : SemanticSelfDescription.SelfSemanticFrame W)
  [SemanticSelfReference.SemanticNegation F]
  [SemanticSelfReference.SelfReferenceFrame F]
  (S : ReflexiveTheorySpace)
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
  ∃ α : Ground, @NecessaryGround Ledger Ground OntologicalGround GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost SelfActualizingLedger α R := by
  obtain ⟨g, hGround⟩ := ground_existence_thm R hExists
  have hNotSelf : ¬SelfActualizingLedger R := hExists.2
  have hPre := @alpha_squeeze Ledger Ground OntologicalGround GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost SelfActualizingLedger
    W F _ _ S toTheory toMeta Entity OffLedger DeterminacyRelevant SemanticNull
    g R hGround hNotSelf (hBridgeSyn g R hGround) (hBridgeExt g R hGround) (hBridgeGhost g R hGround)
  exact ⟨g, ⟨hGround, hPre⟩⟩

end Alpha
