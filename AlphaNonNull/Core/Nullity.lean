import GroundedExistence.Core.Definitions

/-!
# AlphaNonNull.Core.Nullity

**Paper 68: Null — sheer absence / non-being style nullity.**

Null(α) means α is sheer absence, non-being, the nihilistic void. This is
distinct from ObjectEmpty: Alpha can be object-empty (not a worldly thing)
without being null (not sheer absence). Alpha grounds; nullity does not.

Bridge: Paper 64's NullGround captures "vacuous or fails to ground any
actuality." We use NullGround as our Null for the refinement.
-/

set_option autoImplicit false

universe u v

variable {Ledger : Type u} {Ground : Type v} {Entity : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}

namespace AlphaNonNull

/--
**Null (α)** — Ground α is sheer absence, non-being, the nihilistic void.

Uses Paper 64's NullGround: α fails to ground any actuality. Null(α) :=
NullGround(α). Alpha is not null: it grounds; the nihilistic reading is false.
-/
def Null (α : Ground) : Prop :=
  @GroundedExistence.NullGround Ledger Ground OntologicalGround α

end AlphaNonNull
