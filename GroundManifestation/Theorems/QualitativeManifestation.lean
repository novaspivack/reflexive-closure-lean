import QualiaAlphaGrounded.Theorems.AlphaGroundedQualia
import GroundManifestation.Bridge.PresenceFromKnownQuale
import GroundManifestation.Bridge.ManifestationBridge
import GroundManifestation.Core.AlphaManifestation
import LedgerGround.Bridge.ToReflexiveFinality
import LedgerGround.Bridge.ToGhostCollapse
import Alpha.Theorems.AlphaTheorem

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
open Alpha

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
    @LedgerGround.ExternalGroundingInterpretation Ledger Ground OntologicalGround
      GroundIsExternalEqualStatus S toTheory toMeta g R hGround hExt)
variable (hBridgeGhost : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
  (hGhost : GroundIsGhost g) →
    @LedgerGround.GhostGroundingInterpretation Ledger Ground OntologicalGround GroundIsGhost
      F.Claim OffLedger DeterminacyRelevant SemanticNull g R hGround hGhost)

/--
**Theorem 66.3 (Qualitative manifestation):** Known qualia are Alpha-manifestations.
-/
theorem qualitative_manifestation
  (F : SemanticSelfDescription.SelfSemanticFrame W)
  [SemanticSelfReference.SemanticNegation F]
  [SemanticSelfReference.SelfReferenceFrame F]
  (S : NemS.Reflexive.ReflexiveTheorySpace)
  (toTheory : Ledger → S.Theory)
  (toMeta : Ground → S.Theory)
  (AwareOfQuale : Subject → F.Claim → Prop)
  (OffLedger : F.Claim → Prop)
  (DeterminacyRelevant : F.Claim → Prop)
  (SemanticNull : F.Claim → Prop)
  (hBridgeSyn : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
    (hSyn : GroundIsSyntax g) → LedgerGround.SyntacticGroundingInducesExhaustion F g R hGround hSyn)
  (hBridgeExt : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
    (hExt : GroundIsExternalEqualStatus g) →
      @LedgerGround.ExternalGroundingInterpretation Ledger Ground OntologicalGround
        GroundIsExternalEqualStatus S toTheory toMeta g R hGround hExt)
  (hBridgeGhost : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
    (hGhost : GroundIsGhost g) →
      @LedgerGround.GhostGroundingInterpretation Ledger Ground OntologicalGround GroundIsGhost
        F.Claim OffLedger DeterminacyRelevant SemanticNull g R hGround hGhost)
  (R : Ledger) (x : F.Claim)
  (hExists : @NontrivialReflexiveRealityExists Ledger LedgerActuality SelfActualizingLedger R)
  (hKnown : LedgerRepresented F Subject AwareOfQuale x)
  (hNoSyn : ¬PurelySyntacticQualiaEncoding F) :
  ∃ (α : Ground),
    @AlphaManifestation Ledger Ground OntologicalGround LedgerActuality GroundIsSyntax
      GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
      SelfActualizingLedger W F Subject AwareOfQuale
      (fun (c : F.Claim) (_l : Ledger) => LedgerRepresented F Subject AwareOfQuale c)
      x α R := by
  have hPresence : PhenomenalPresence F Subject AwareOfQuale x :=
    @presence_from_known_quale W F Subject AwareOfQuale x hKnown
  have hContent : LedgerRepresented F Subject AwareOfQuale x := hKnown
  let contentOf (c : F.Claim) (_ledger : Ledger) : Prop :=
    LedgerRepresented F Subject AwareOfQuale c
  obtain ⟨α, hNG⟩ := alpha_theorem F S toTheory toMeta OffLedger DeterminacyRelevant SemanticNull
    hBridgeSyn hBridgeExt hBridgeGhost R hExists
  have hWitnessed : @GroundedExistence.GroundedInAlphaWitnessed Ledger Ground F.Claim
      OntologicalGround LedgerActuality GroundIsSyntax GroundIsObjectLevelSemantics
      GroundIsExternalEqualStatus GroundIsGhost SelfActualizingLedger contentOf x α R :=
    ⟨hNG, hContent, hExists.1⟩
  have hGroundMode :=
    manifestation_bridge F Subject AwareOfQuale contentOf x α R hPresence hWitnessed hNoSyn
  exact ⟨α, ⟨hGroundMode, hPresence⟩⟩

end GroundManifestation
