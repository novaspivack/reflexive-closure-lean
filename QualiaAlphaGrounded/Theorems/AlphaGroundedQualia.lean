import QualiaAlphaGrounded.Bridge.FromQualiaLedger
import QualiaLedger.Core.LedgerRepresentation
import QualiaLedger.Bridge.ToSyntaxSemantics
import GroundedExistence.Core.Definitions
import GroundedExistence.Theorems.GroundedExistenceThm
import LedgerGround.Bridge.ToSyntaxSemantics
import LedgerGround.Bridge.ToReflexiveFinality
import LedgerGround.Bridge.ToGhostCollapse

/-!
# QualiaAlphaGrounded.Theorems.AlphaGroundedQualia

**Theorem 65.1: Alpha-grounded qualia (Paper 65, Layer A).**

Known qualia are irreducible semantic content whose actuality is Alpha-grounded.
-/

set_option autoImplicit false

namespace QualiaAlphaGrounded

open QualiaLedger
open GroundedExistence
open LedgerGround

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

/--
**ContentOfQualia (x) (R)** — Unified ledger content for the qualia/reflexive-reality context.

When R is the reflexive reality ledger, the semantic ledger of Paper 55 (ledger-represented
content) is identified with the content of R. So ContentOfQualia x R := LedgerRepresented x.
This makes LedgerRepresented(x) ⇒ ContentOf(x,R) a theorem (by definition) rather than an axiom.
-/
def ContentOfQualia (x : F.Claim) (R : Ledger) : Prop :=
  LedgerRepresented F Subject AwareOfQuale x

/--
**Theorem (ledger-represented implies content of):** For the reflexive reality ledger,
ledger-represented content is content of R. Derived from the shared ledger structure:
ContentOfQualia identifies the semantic ledger with R's content.
-/
theorem ledger_represented_implies_content_of
  (R : Ledger) (x : F.Claim)
  (hExists : @Alpha.NontrivialReflexiveRealityExists Ledger LedgerActuality SelfActualizingLedger R)
  (hLedgerRep : LedgerRepresented F Subject AwareOfQuale x) :
  ContentOfQualia x R :=
  hLedgerRep

variable (hBridgeSyn : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
  (hSyn : GroundIsSyntax g) → SyntacticGroundingInducesExhaustion F g R hGround hSyn)
variable (hBridgeExt : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
  (hExt : GroundIsExternalEqualStatus g) →
    @ExternalGroundingInterpretation Ledger Ground OntologicalGround
      GroundIsExternalEqualStatus S toTheory toMeta g R hGround hExt)
variable (hBridgeGhost : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
  (hGhost : GroundIsGhost g) →
    @GhostGroundingInterpretation Ledger Ground OntologicalGround GroundIsGhost
      F.Claim OffLedger DeterminacyRelevant SemanticNull g R hGround hGhost)

/--
**KnownQuale (x)** — Content x is a known quale (ledger-represented qualitative content).
-/
def KnownQuale (x : F.Claim) : Prop :=
  LedgerRepresented F Subject AwareOfQuale x

/--
**Theorem 65.1 (Alpha-grounded qualia):** Known qualia are irreducible semantic
content whose actuality is Alpha-grounded.

Proof: (1) Known qualia are on-ledger (Paper 55, Theorem 55.1). (2) By the
shared ledger structure, ledger-represented content is ContentOfQualia R for
reflexive reality R (theorem, not axiom). (3) By Theorem 64.1 (grounded existence),
ContentOfQualia x R ∧ LedgerActuality R ⇒ GroundedInAlpha x. (4) Known qualia are
irreducible semantic (Paper 55.5, 53).
-/
theorem alpha_grounded_qualia
  (R : Ledger) (x : F.Claim)
  (hExists : @Alpha.NontrivialReflexiveRealityExists Ledger LedgerActuality SelfActualizingLedger R)
  (hKnown : QualiaLedger.LedgerRepresented F Subject AwareOfQuale x)
  (hNoSyn : ¬QualiaLedger.PurelySyntacticQualiaEncoding F)
  (S : NemS.Reflexive.ReflexiveTheorySpace)
  (toTheory : Ledger → S.Theory)
  (toMeta : Ground → S.Theory)
  (OffLedger : F.Claim → Prop)
  (DeterminacyRelevant : F.Claim → Prop)
  (SemanticNull : F.Claim → Prop)
  (hBridgeSyn : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
    (hSyn : GroundIsSyntax g) → SyntacticGroundingInducesExhaustion F g R hGround hSyn)
  (hBridgeExt : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
    (hExt : GroundIsExternalEqualStatus g) →
      @ExternalGroundingInterpretation Ledger Ground OntologicalGround
        GroundIsExternalEqualStatus S toTheory toMeta g R hGround hExt)
  (hBridgeGhost : ∀ (g : Ground) (R : Ledger) (hGround : OntologicalGround g R),
    (hGhost : GroundIsGhost g) →
      @GhostGroundingInterpretation Ledger Ground OntologicalGround GroundIsGhost
        F.Claim OffLedger DeterminacyRelevant SemanticNull g R hGround hGhost) :
  @GroundedInAlpha Ledger Ground F.Claim OntologicalGround LedgerActuality GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost SelfActualizingLedger
    ContentOfQualia x ∧ ¬QualiaLedger.PurelySyntacticQualiaEncoding F :=
  ⟨@GroundedExistence.grounded_existence_thm Ledger Ground F.Claim OntologicalGround LedgerActuality
      GroundIsSyntax GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
      SelfActualizingLedger ContentOfQualia W F _ _ S toTheory toMeta OffLedger DeterminacyRelevant
      SemanticNull hBridgeSyn hBridgeExt hBridgeGhost R x hExists
      (ledger_represented_implies_content_of R x hExists hKnown),
   hNoSyn⟩

end QualiaAlphaGrounded
