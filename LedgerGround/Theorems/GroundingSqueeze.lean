import LedgerGround.Bridge.ToSyntaxSemantics
import LedgerGround.Bridge.ToReflexiveFinality
import LedgerGround.Bridge.ToGhostCollapse
import LedgerGround.Core.Principles

/-!
# LedgerGround.Theorems.GroundingSqueeze

**Corollary 62.5: Grounding squeeze (Paper 62).**

Any adequate ontological ground must be of a different category from syntax,
object-level semantics, same-level external completion, and ghost residue.

Proved using bridge theorems from Papers 53, 23, 61 and the object-level
semantics axiom from Principles.
-/

set_option autoImplicit false

namespace LedgerGround

open NemS.Reflexive

universe u v w

variable {Ledger : Type u} {Ground : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}
variable {GroundIsSyntax : Ground → Prop}
variable {GroundIsObjectLevelSemantics : Ground → Prop}
variable {GroundIsExternalEqualStatus : Ground → Prop}
variable {GroundIsGhost : Ground → Prop}

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
Witness that g is in an excluded grounding category, with the appropriate
bridge hypothesis for bridge-derived exclusions.
-/
inductive ExcludedCategory (g : Ground) (R : Ledger) (hGround : OntologicalGround g R) : Prop
  | syn (hSyn : GroundIsSyntax g)
      (hBridge : SyntacticGroundingInducesExhaustion F g R hGround hSyn)
  | semantics (hSem : GroundIsObjectLevelSemantics g)
  | external (hExt : GroundIsExternalEqualStatus g)
      (hBridge : @ExternalGroundingInterpretation Ledger Ground OntologicalGround GroundIsExternalEqualStatus S toTheory toMeta g R hGround hExt)
  | ghost (hGhost : GroundIsGhost g)
      (hBridge : @GhostGroundingInterpretation Ledger Ground OntologicalGround GroundIsGhost Entity
        OffLedger DeterminacyRelevant SemanticNull g R hGround hGhost)

/--
**Corollary 62.5:** If g ontologically grounds R and g is in an excluded
category (syntax, object-level semantics, external equal-status, or ghost),
we obtain a contradiction.
-/
theorem grounding_squeeze (g : Ground) (R : Ledger) (hGround : OntologicalGround g R)
  (hExcluded : @ExcludedCategory Ledger Ground OntologicalGround GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost W F
    S toTheory toMeta Entity OffLedger DeterminacyRelevant SemanticNull g R hGround) : False := by
  cases hExcluded with
  | syn hSyn hBridge =>
      exact @LedgerGround.syntax_cannot_ground_from_paper53 Ledger Ground OntologicalGround
        GroundIsSyntax W F _ _ g R hGround hSyn hBridge
  | semantics hSem => exact object_level_semantics_cannot_ground g R hGround hSem
  | external hExt hBridge =>
      exact @LedgerGround.no_external_equal_status_ground_from_paper23 Ledger Ground OntologicalGround
        GroundIsExternalEqualStatus S toTheory toMeta g R hGround hExt hBridge
  | ghost hGhost hBridge =>
      exact @LedgerGround.no_ghost_ground_from_paper61 Ledger Ground OntologicalGround GroundIsGhost
        Entity OffLedger DeterminacyRelevant SemanticNull g R hGround hGhost hBridge

end LedgerGround
