/-!
# Alpha.Core.PreCategorialGround

**Pre-categorial ground (Paper 63).**

A ground g is pre-categorial relative to the ledger's categories if g is not
in any of the excluded categories: syntax, object-level semantics, equal-status
externality, ghost residue, or self-actualizing ledger.
-/

set_option autoImplicit false

universe u v

variable {Ledger : Type u} {Ground : Type v}
variable {GroundIsSyntax : Ground → Prop}
variable {GroundIsObjectLevelSemantics : Ground → Prop}
variable {GroundIsExternalEqualStatus : Ground → Prop}
variable {GroundIsGhost : Ground → Prop}
variable {SelfActualizingLedger : Ledger → Prop}

namespace Alpha

/--
**PreCategorial** — A ground g is pre-categorial for ledger R if g is not
in any excluded category: not syntax, not object-level semantics, not
equal-status external, not ghost; and R is not self-actualizing.

This is the structural characterization of Alpha: the necessary ontological
ground lies outside all excluded categories.
-/
def PreCategorial (g : Ground) (R : Ledger) : Prop :=
  ¬GroundIsSyntax g ∧
  ¬GroundIsObjectLevelSemantics g ∧
  ¬GroundIsExternalEqualStatus g ∧
  ¬GroundIsGhost g ∧
  ¬SelfActualizingLedger R

end Alpha
