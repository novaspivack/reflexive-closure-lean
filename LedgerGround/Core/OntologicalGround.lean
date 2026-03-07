/-!
# LedgerGround.Core.OntologicalGround

**Ontological grounding (Paper 62).**

A candidate ground g ontologically grounds a ledger/reality R if g serves as
the full sufficient ontological ground of R's actuality. Paper 62 proves that
syntax, object-level semantics, equal-status external completion, and
self-actualizing ledger cannot fill this role.
-/

set_option autoImplicit false

universe u v

variable {Ledger : Type u} {Ground : Type v}
variable (OntologicalGround : Ground → Ledger → Prop)
variable (LedgerActuality : Ledger → Prop)

namespace LedgerGround

/-- Placeholder for module structure. -/
def OntologicalGroundDoc := True

end LedgerGround
