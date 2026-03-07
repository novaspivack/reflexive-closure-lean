/-!
# GhostCollapse.Core.OffLedger

**Off-ledger predicate (Paper 61).**

An entity is off-ledger if it is not represented in the semantic ledger—the
canonical record of semantic content in the system. Paper 61 proves that any
off-ledger entity is either determinacy-relevant (hence illicit under no-free-bits)
or semantically null (hence theory-null).

This generalizes beyond qualia (Paper 55) to any purported entity.
-/

set_option autoImplicit false

universe u

variable {Entity : Type u}
variable (OffLedger : Entity → Prop)

namespace GhostCollapse

/--
**Ghost (x)** — Optional convenience predicate: x is off-ledger and purportedly exists.

Used for exposition. A "ghost" is an entity asserted to exist but not
represented in the ledger. The ghost collapse theorem shows no viable
ghost ontology survives.
-/
def Ghost (x : Entity) : Prop := OffLedger x

end GhostCollapse
