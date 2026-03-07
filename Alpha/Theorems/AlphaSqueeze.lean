import LedgerGround.Core.OntologicalGround
import LedgerGround.Core.GroundCategories
import LedgerGround.Theorems.GroundingSqueeze
import LedgerGround.Bridge.ToSyntaxSemantics
import LedgerGround.Bridge.ToReflexiveFinality
import LedgerGround.Bridge.ToGhostCollapse
import Alpha.Core.PreCategorialGround

/-!
# Alpha.Theorems.AlphaSqueeze

**Theorem 63.1: Alpha squeeze (Paper 63).**

Any adequate ontological ground cannot be: syntax, object-level semantics,
equal-status externality, ghost residue, or self-actualizing ledger.

**Derived** from Paper 62's grounding_squeeze (Corollary 62.5). When the
bridge interpretations are available for syntax, external, and ghost
categories, the squeeze follows: any ground must be pre-categorial.
-/

set_option autoImplicit false

namespace Alpha

open LedgerGround
open NemS.Reflexive

universe u v w

variable {Ledger : Type u} {Ground : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}
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

/--
**Theorem 63.1 (Alpha squeeze):** If g ontologically grounds R and R is not
self-actualizing, then g is pre-categorial—provided the bridge interpretations
are available when g falls into syntax, external, or ghost categories.

Proof: By contradiction. If g were in any excluded category, we construct
ExcludedCategory and apply Paper 62's grounding_squeeze to obtain False.
The semantics case needs no bridge; syn, external, and ghost use the
provided bridge hypotheses.
-/
theorem alpha_squeeze
  (g : Ground) (R : Ledger)
  (hGround : OntologicalGround g R)
  (hNotSelf : ¬SelfActualizingLedger R)
  (hBridgeSyn : (hSyn : GroundIsSyntax g) →
    SyntacticGroundingInducesExhaustion F g R hGround hSyn)
  (hBridgeExt : (hExt : GroundIsExternalEqualStatus g) →
    @ExternalGroundingInterpretation Ledger Ground OntologicalGround GroundIsExternalEqualStatus
      S toTheory toMeta g R hGround hExt)
  (hBridgeGhost : (hGhost : GroundIsGhost g) →
    @GhostGroundingInterpretation Ledger Ground OntologicalGround GroundIsGhost Entity
      OffLedger DeterminacyRelevant SemanticNull g R hGround hGhost) :
  @PreCategorial Ledger Ground GroundIsSyntax GroundIsObjectLevelSemantics
    GroundIsExternalEqualStatus GroundIsGhost SelfActualizingLedger g R := by
  refine ⟨?_, ?_, ?_, ?_, hNotSelf⟩
  · intro hSyn
    exact @grounding_squeeze Ledger Ground OntologicalGround GroundIsSyntax GroundIsObjectLevelSemantics
      GroundIsExternalEqualStatus GroundIsGhost W F _ _ S toTheory toMeta Entity OffLedger DeterminacyRelevant SemanticNull
      g R hGround (@ExcludedCategory.syn Ledger Ground OntologicalGround GroundIsSyntax GroundIsObjectLevelSemantics
        GroundIsExternalEqualStatus GroundIsGhost W F S toTheory toMeta Entity OffLedger DeterminacyRelevant SemanticNull
        g R hGround hSyn (hBridgeSyn hSyn))
  · intro hSem
    exact @grounding_squeeze Ledger Ground OntologicalGround GroundIsSyntax GroundIsObjectLevelSemantics
      GroundIsExternalEqualStatus GroundIsGhost W F _ _ S toTheory toMeta Entity OffLedger DeterminacyRelevant SemanticNull
      g R hGround (@ExcludedCategory.semantics Ledger Ground OntologicalGround GroundIsSyntax GroundIsObjectLevelSemantics
        GroundIsExternalEqualStatus GroundIsGhost W F S toTheory toMeta Entity OffLedger DeterminacyRelevant SemanticNull
        g R hGround hSem)
  · intro hExt
    exact @grounding_squeeze Ledger Ground OntologicalGround GroundIsSyntax GroundIsObjectLevelSemantics
      GroundIsExternalEqualStatus GroundIsGhost W F _ _ S toTheory toMeta Entity OffLedger DeterminacyRelevant SemanticNull
      g R hGround (@ExcludedCategory.external Ledger Ground OntologicalGround GroundIsSyntax GroundIsObjectLevelSemantics
        GroundIsExternalEqualStatus GroundIsGhost W F S toTheory toMeta Entity OffLedger DeterminacyRelevant SemanticNull
        g R hGround hExt (hBridgeExt hExt))
  · intro hGhost
    exact @grounding_squeeze Ledger Ground OntologicalGround GroundIsSyntax GroundIsObjectLevelSemantics
      GroundIsExternalEqualStatus GroundIsGhost W F _ _ S toTheory toMeta Entity OffLedger DeterminacyRelevant SemanticNull
      g R hGround (@ExcludedCategory.ghost Ledger Ground OntologicalGround GroundIsSyntax GroundIsObjectLevelSemantics
        GroundIsExternalEqualStatus GroundIsGhost W F S toTheory toMeta Entity OffLedger DeterminacyRelevant SemanticNull
        g R hGround hGhost (hBridgeGhost hGhost))

end Alpha
