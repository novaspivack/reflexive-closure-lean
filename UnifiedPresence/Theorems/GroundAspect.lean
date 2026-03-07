import UnifiedPresence.Core.GroundAspect
import AlphaNonNull.Theorems.AlphaNotNull
import GroundedExistence.Core.Definitions

/-!
# UnifiedPresence.Theorems.GroundAspect

**Paper 69.1: Reality is Alpha-grounded.**

When Alpha is the primordial terminus for R, the ground aspect holds.
From Papers 64, 68.
-/

set_option autoImplicit false

namespace UnifiedPresence

universe u v

variable {Ledger : Type u} {Ground : Type v} {Entity : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}
variable {LedgerActuality : Ledger → Prop}
variable {GroundIsSyntax : Ground → Prop}
variable {GroundIsObjectLevelSemantics : Ground → Prop}
variable {GroundIsExternalEqualStatus : Ground → Prop}
variable {GroundIsGhost : Ground → Prop}
variable {SelfActualizingLedger : Ledger → Prop}
variable (ContentOf : Entity → Ledger → Prop)

open GroundedExistence

/--
**Theorem 69.1:** Reality is Alpha-grounded.

When AlphaTerminus α R holds, the ground aspect holds: α is primordial,
object-empty, and not null.
-/
theorem reality_is_alpha_grounded (α : Ground) (R : Ledger)
  (hTerm : @AlphaTerminus Ledger Ground OntologicalGround GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger α R) :
  @GroundAspect Ledger Ground OntologicalGround GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger α R :=
  ⟨hTerm, (AlphaNonNull.object_empty_and_not_null α R hTerm).1,
    (AlphaNonNull.object_empty_and_not_null α R hTerm).2⟩

end UnifiedPresence
