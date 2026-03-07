/-!
# GhostCollapse.Core.DeterminacyRelevance

**Determinacy relevance (Paper 61).**

Generalization of the Paper 55 notion: an entity is determinacy-relevant if it
affects reports, memory, adjudication, self-models, system state distinctions,
or any theory-relevant outcomes. Off-ledger + determinacy-relevant ⇒ illicit
(no-free-bits violation).
-/

set_option autoImplicit false

universe u

variable {Entity : Type u}
variable (DeterminacyRelevant : Entity → Prop)

namespace GhostCollapse

/--
**DeterminacyRelevant (x)** — Entity x affects determinacy-relevant structure.

Affects: reports, choices, memory, behavior, self-models, adjudication,
system state distinctions, or any theory-relevant outcomes.

If x is off-ledger but determinacy-relevant, it constitutes a "free bit"—
semantic content affecting outcomes without ledger representation—violating
no-free-bits (Paper 27).
-/
def DeterminacyRelevanceDoc := True

end GhostCollapse
