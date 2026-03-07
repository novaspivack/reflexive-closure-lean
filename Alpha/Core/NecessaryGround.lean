import LedgerGround.Core.OntologicalGround
import Alpha.Core.PreCategorialGround

/-!
# Alpha.Core.NecessaryGround

**Necessary ontological ground (Paper 63).**

A ground g is a necessary ground for ledger R when g ontologically grounds R
and the existence of such a ground is required by the structure of reflexive
reality—not optional or contingent.
-/

set_option autoImplicit false

universe u v

variable {Ledger : Type u} {Ground : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}
variable {GroundIsSyntax : Ground → Prop}
variable {GroundIsObjectLevelSemantics : Ground → Prop}
variable {GroundIsExternalEqualStatus : Ground → Prop}
variable {GroundIsGhost : Ground → Prop}
variable {SelfActualizingLedger : Ledger → Prop}

namespace Alpha

/--
**NecessaryGround** — g is a necessary pre-categorial ontological ground
for R when g ontologically grounds R and g is pre-categorial (outside all
excluded categories).

This is the characterization of Alpha: the ground whose existence is forced
by the squeeze, and which must be pre-categorial.
-/
def NecessaryGround (g : Ground) (R : Ledger) : Prop :=
  OntologicalGround g R ∧ @PreCategorial Ledger Ground GroundIsSyntax GroundIsObjectLevelSemantics
    GroundIsExternalEqualStatus GroundIsGhost SelfActualizingLedger g R

end Alpha
