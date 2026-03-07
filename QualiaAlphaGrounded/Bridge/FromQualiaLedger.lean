import QualiaLedger.Core.QualiaAccess
import QualiaLedger.Core.LedgerRepresentation
import GroundedExistence.Core.Definitions
import GroundedExistence.Theorems.GroundedExistenceThm
import Alpha.Core.ReflexiveRealityExistence
import LedgerGround.Bridge.ToSyntaxSemantics
import LedgerGround.Bridge.ToReflexiveFinality
import LedgerGround.Bridge.ToGhostCollapse

/-!
# QualiaAlphaGrounded.Bridge.FromQualiaLedger

**Bridge from Paper 55 (QualiaLedger) to Paper 64 (GroundedExistence).**

Known qualia are ledger-represented (Paper 55). The reflexive reality ledger R
contains the semantic account of the system. We assume: ledger-represented
content is content of R. Then grounded existence (Theorem 64.1) yields
Alpha-groundedness.
-/

set_option autoImplicit false

namespace QualiaAlphaGrounded

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
variable (ContentOf : F.Claim → Ledger → Prop)

end QualiaAlphaGrounded
