import GhostCollapse.Core.OffLedger
import GhostCollapse.Core.DeterminacyRelevance
import GhostCollapse.Core.NoFreeBits

set_option autoImplicit false

universe u
variable {Entity : Type u}
variable (OffLedger : Entity → Prop)
variable (DeterminacyRelevant : Entity → Prop)

namespace GhostCollapse

/--
**Theorem 61.1:** Off-ledger + determinacy-relevant ⇒ ⊥.

If an entity is off-ledger but determinacy-relevant, it violates no-free-bits
(Paper 27). Bridge to Paper 27 and Paper 55.
-/
theorem off_ledger_determinacy_implies_illicit
    (x : Entity) (hOff : OffLedger x) (hDet : DeterminacyRelevant x) :
    False :=
  no_free_bits_off_ledger_determinacy OffLedger DeterminacyRelevant x hOff hDet

end GhostCollapse
