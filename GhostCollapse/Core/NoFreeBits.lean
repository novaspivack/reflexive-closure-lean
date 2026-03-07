/-!
# GhostCollapse.Core.NoFreeBits

**No-free-bits axiom (Paper 27 bridge).**

Off-ledger + determinacy-relevant ⇒ contradiction. This axiom does not depend
on SemanticNull; it is used by Theorem 61.1.
-/

set_option autoImplicit false

universe u

variable {Entity : Type u}
variable (OffLedger : Entity → Prop)
variable (DeterminacyRelevant : Entity → Prop)

namespace GhostCollapse

/--
**No-free-bits for off-ledger determinacy (Paper 27):** If an entity is
off-ledger and determinacy-relevant, contradiction.

Off-ledger content that affects reports, memory, adjudication, self-models, or
other determinacy-relevant structure would be a "free bit"—semantic content
affecting outcomes without ledger representation. Paper 27 excludes such content.
-/
axiom no_free_bits_off_ledger_determinacy
    (x : Entity) (hOff : OffLedger x) (hDet : DeterminacyRelevant x) : False

end GhostCollapse
