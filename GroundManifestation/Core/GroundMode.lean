import SemanticSelfDescription.Core.Claims
import GroundManifestation.Core.PhenomenalPresence
import GroundedExistence.Core.Definitions
import QualiaLedger.Bridge.ToSyntaxSemantics

/-!
# GroundManifestation.Core.GroundMode

**Paper 66: Ground-mode — the actuality of x is present as lived semantic
presentation of its Alpha-grounded status.**

GroundMode(x,α) := PhenomenalPresence(x) ∧ AlphaGrounded(x) ∧ IrreducibleSemantic(x).

Proof dependency: GroundMode must be usable before AlphaManifestation.
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
**GroundMode (x) (α) (R)** — Content x is in ground-mode with respect to α when
the actuality of x is present not merely as downstream causal effect but as lived
semantic presentation of its Alpha-grounded status.

Formally: PhenomenalPresence(x) ∧ GroundedInAlphaWitnessed(x,α,R) ∧ IrreducibleSemantic.
The witnessed form ties (α,R) to the grounding: α grounds R, x is content of R, R is actual.
This enables derivation of manifestation_implies_grounding (Paper 68).
-/
def GroundMode (x : F.Claim) (α : Ground) (R : Ledger) : Prop :=
  PhenomenalPresence F Subject AwareOfQuale x ∧
  @GroundedExistence.GroundedInAlphaWitnessed Ledger Ground F.Claim OntologicalGround LedgerActuality
    GroundIsSyntax GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger ContentOf x α R ∧
  ¬QualiaLedger.PurelySyntacticQualiaEncoding F

end GroundManifestation
