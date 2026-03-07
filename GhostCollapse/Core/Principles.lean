/-!
# GhostCollapse.Core.Principles

**Axioms connecting off-ledger, determinacy relevance, and semantic nullity (Paper 61).**

- **No-free-bits (Paper 27):** Off-ledger + determinacy-relevant ⇒ contradiction.
- **Semantic nullity:** Off-ledger + ¬determinacy-relevant ⇒ semantic null.
-/

set_option autoImplicit false

universe u

variable {Entity : Type u}
variable (OffLedger : Entity → Prop)
variable (DeterminacyRelevant : Entity → Prop)
variable (SemanticNull : Entity → Prop)

namespace GhostCollapse

/--
**No-free-bits for off-ledger determinacy (Paper 27 bridge):** If an entity is
off-ledger and determinacy-relevant, contradiction.

Off-ledger content that affects reports, memory, adjudication, self-models, or
other determinacy-relevant structure would be a "free bit"—semantic content
affecting outcomes without ledger representation. Paper 27 (no-free-bits)
excludes such content.
-/
axiom no_free_bits_off_ledger_determinacy
    (x : Entity) (hOff : OffLedger x) (hDet : DeterminacyRelevant x) : False

/--
**Semantic nullity principle:** If an entity is off-ledger and not
determinacy-relevant, then it is semantically null.

Rationale: if x is off-ledger and does not affect any determinacy-relevant
structure (reports, memory, adjudication, etc.), then the theory cannot
distinguish "x exists" from no content at all. It contributes no usable
content—hence SemanticNull(x).
-/
axiom off_ledger_nondeterminacy_implies_semantic_null
    (x : Entity) (hOff : OffLedger x) (hNotDet : ¬ DeterminacyRelevant x) :
    SemanticNull x

end GhostCollapse
