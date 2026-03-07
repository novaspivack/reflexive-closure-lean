import AlphaNonNull.Core.ObjectEmpty
import AlphaNonNull.Core.Nullity
import GroundedExistence.Core.Definitions

/-!
# UnifiedPresence.Core.GroundAspect

**Paper 69: Ground aspect — reality is Alpha-grounded.**

The ground aspect: Alpha as primordial, non-null terminus. From Papers 64, 68.
Reality is Alpha-grounded in the sense that actuality derives from necessary
pre-categorial ground that is object-empty but not null, not sterile, not inert.
-/

set_option autoImplicit false

namespace UnifiedPresence

universe u v

variable {Ledger : Type u} {Ground : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}
variable {LedgerActuality : Ledger → Prop}
variable {GroundIsSyntax : Ground → Prop}
variable {GroundIsObjectLevelSemantics : Ground → Prop}
variable {GroundIsExternalEqualStatus : Ground → Prop}
variable {GroundIsGhost : Ground → Prop}
variable {SelfActualizingLedger : Ledger → Prop}

open GroundedExistence

/--
**GroundAspect (α) (R)** — The ground aspect holds for α and R when α is
the primordial terminus for R: necessary ground, not null, object-empty.

Theorem 69.1: Reality is Alpha-grounded. When AlphaTerminus α R holds,
we have the ground aspect.
-/
def GroundAspect (α : Ground) (R : Ledger) : Prop :=
  @AlphaTerminus Ledger Ground OntologicalGround GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger α R ∧
  @AlphaNonNull.ObjectEmpty Ground GroundIsSyntax GroundIsObjectLevelSemantics α ∧
  ¬@AlphaNonNull.Null Ledger Ground OntologicalGround α

end UnifiedPresence
