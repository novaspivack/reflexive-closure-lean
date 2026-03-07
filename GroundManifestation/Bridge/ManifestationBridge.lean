import GroundManifestation.Core.PhenomenalPresence
import GroundManifestation.Core.GroundMode

/-!
# GroundManifestation.Bridge.ManifestationBridge

**Theorem 66.2: Phenomenally present, irreducible, Alpha-grounded content
is in ground-mode.**

PhenomenalPresence(x) ∧ IrreducibleSemantic(x) ∧ AlphaGrounded(x) ⇒ GroundMode(x,α).

By definition, GroundMode is that conjunction. The bridge is immediate.
-/

set_option autoImplicit false

namespace GroundManifestation

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
variable (Subject : Type v)
variable (AwareOfQuale : Subject → F.Claim → Prop)
variable (ContentOf : F.Claim → Ledger → Prop)

/--
**Theorem 66.2 (Manifestation bridge):** If x is phenomenally present,
Alpha-grounded, and the frame is not purely syntactic, then x is in ground-mode.
-/
theorem manifestation_bridge (x : F.Claim) (α : Ground) (R : Ledger)
  (hPresence : PhenomenalPresence F Subject AwareOfQuale x)
  (hGrounded : @GroundedExistence.GroundedInAlpha Ledger Ground F.Claim OntologicalGround
    LedgerActuality GroundIsSyntax GroundIsObjectLevelSemantics GroundIsExternalEqualStatus
    GroundIsGhost SelfActualizingLedger ContentOf x)
  (hNoSyn : ¬QualiaLedger.PurelySyntacticQualiaEncoding F) :
  @GroundMode Ledger Ground OntologicalGround LedgerActuality GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger W F Subject AwareOfQuale ContentOf x α R :=
  ⟨hPresence, hGrounded, hNoSyn⟩

end GroundManifestation
