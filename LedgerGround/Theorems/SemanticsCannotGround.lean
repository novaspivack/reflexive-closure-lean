import LedgerGround.Core.Principles

/-!
# LedgerGround.Theorems.SemanticsCannotGround

**Theorem 62.2: Object-level semantics cannot ground actuality (Paper 62).**

Re-exports `object_level_semantics_cannot_ground` from Principles.
-/

set_option autoImplicit false

universe u v
variable {Ledger : Type u} {Ground : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}
variable {LedgerActuality : Ledger → Prop}
variable {GroundIsSyntax : Ground → Prop}
variable {GroundIsObjectLevelSemantics : Ground → Prop}
variable {GroundIsExternalEqualStatus : Ground → Prop}
variable {GroundIsGhost : Ground → Prop}
variable {SelfActualizingLedger : Ledger → Prop}

open LedgerGround

/-- Theorem 62.2: No object-level semantic ground can be the full sufficient ontological ground. -/
def object_level_semantics_cannot_ground_thm :=
  @LedgerGround.object_level_semantics_cannot_ground Ledger Ground OntologicalGround
    GroundIsObjectLevelSemantics
