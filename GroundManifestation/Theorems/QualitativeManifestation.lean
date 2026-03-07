import QualiaAlphaGrounded.Theorems.AlphaGroundedQualia
import GroundManifestation.Bridge.PresenceFromKnownQuale
import GroundManifestation.Bridge.ManifestationBridge
import GroundManifestation.Core.AlphaManifestation
import LedgerGround.Bridge.ToReflexiveFinality
import LedgerGround.Bridge.ToGhostCollapse

/-!
# GroundManifestation.Theorems.QualitativeManifestation

**Theorem 66.3: Known qualia are Alpha-manifestations.**

KnownQuale(x) ⇒ AlphaManifestation(x).

Proof: (1) KnownQuale ⇒ PhenomenalPresence (66.1). (2) KnownQuale ⇒
IrreducibleSemantic ∧ AlphaGrounded (65.1). (3) Conjunction ⇒ GroundMode (66.2).
(4) GroundMode ∧ PhenomenalPresence ⇒ AlphaManifestation (definition).
-/

set_option autoImplicit false

namespace GroundManifestation

open QualiaAlphaGrounded
open QualiaLedger

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
variable (S : NemS.Reflexive.ReflexiveTheorySpace)
variable (toTheory : Ledger → S.Theory)
variable (toMeta : Ground → S.Theory)
variable {Subject : Type v}
variable (AwareOfQuale : Subject → F.Claim → Prop)
variable (OffLedger : F.Claim → Prop)
variable (DeterminacyRelevant : F.Claim → Prop)
variable (SemanticNull : F.Claim → Prop)

variable (hBridgeSyn : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
  (hSyn : GroundIsSyntax g) → LedgerGround.SyntacticGroundingInducesExhaustion F g R hGround hSyn)
variable (hBridgeExt : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
  (hExt : GroundIsExternalEqualStatus g) →
    LedgerGround.ExternalGroundingInterpretation Ledger Ground OntologicalGround
      GroundIsExternalEqualStatus S toTheory toMeta g R hGround hExt)
variable (hBridgeGhost : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
  (hGhost : GroundIsGhost g) →
    LedgerGround.GhostGroundingInterpretation Ledger Ground OntologicalGround GroundIsGhost
      F.Claim OffLedger DeterminacyRelevant SemanticNull g R hGround hGhost)

/--
**Theorem 66.3 (Qualitative manifestation):** Known qualia are Alpha-manifestations.
-/
theorem qualitative_manifestation
  (R : Ledger) (x : F.Claim) (α : Ground)
  (hExists : @Alpha.NontrivialReflexiveRealityExists Ledger LedgerActuality SelfActualizingLedger R)
  (hKnown : LedgerRepresented F Subject AwareOfQuale x)
  (hNoSyn : ¬PurelySyntacticQualiaEncoding F) :
  AlphaManifestation F Subject AwareOfQuale (QualiaAlphaGrounded.ContentOfQualia F Subject AwareOfQuale)
    x α R := by
  have hPresence : PhenomenalPresence F Subject AwareOfQuale x :=
    presence_from_known_quale F Subject AwareOfQuale x hKnown
  have h65 := alpha_grounded_qualia R x hExists hKnown hNoSyn S toTheory toMeta
    OffLedger DeterminacyRelevant SemanticNull hBridgeSyn hBridgeExt hBridgeGhost
  have hGrounded : @GroundedExistence.GroundedInAlpha Ledger Ground F.Claim OntologicalGround
    LedgerActuality GroundIsSyntax GroundIsObjectLevelSemantics GroundIsExternalEqualStatus
    GroundIsGhost SelfActualizingLedger (QualiaAlphaGrounded.ContentOfQualia F Subject AwareOfQuale) x :=
    h65.1
  have hGroundMode : GroundMode F Subject AwareOfQuale
    (QualiaAlphaGrounded.ContentOfQualia F Subject AwareOfQuale) x α R :=
    manifestation_bridge F Subject AwareOfQuale (QualiaAlphaGrounded.ContentOfQualia F Subject AwareOfQuale)
      x α R hPresence hGrounded hNoSyn
  exact ⟨hGroundMode, hPresence⟩

end GroundManifestation
