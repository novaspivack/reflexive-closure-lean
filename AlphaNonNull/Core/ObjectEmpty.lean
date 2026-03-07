import GroundedExistence.Core.Definitions

/-!
# AlphaNonNull.Core.ObjectEmpty

**Paper 68: Object-empty — Alpha has no object-level content.**

ObjectEmpty(α) means α is not a thing among things; it has no object-level
content. For Alpha (as primordial ground), this is equivalent to
¬ObjectLevel(α) from Paper 64: Alpha is pre-categorial, not syntax or
object-level semantics.

Bridge connects to GroundedExistence.alpha_not_object_level.
-/

set_option autoImplicit false

universe u v

variable {Ledger : Type u} {Ground : Type v} {Entity : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}
variable {GroundIsSyntax : Ground → Prop}
variable {GroundIsObjectLevelSemantics : Ground → Prop}

namespace AlphaNonNull

/--
**ObjectEmpty (α)** — Ground α has no object-level content.

α is not a thing among things; it is pre-categorial. For Alpha as terminus,
ObjectEmpty(α) := ¬ObjectLevel(α). Alpha is not syntax, not object-level
semantics, not ledger content.
-/
def ObjectEmpty (α : Ground) : Prop :=
  ¬@GroundedExistence.ObjectLevel Ground GroundIsSyntax GroundIsObjectLevelSemantics α

end AlphaNonNull
