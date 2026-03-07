import GhostCollapse.Core.OffLedger
import GhostCollapse.Core.DeterminacyRelevance
import GhostCollapse.Core.SemanticNullity
import GhostCollapse.Core.Principles

set_option autoImplicit false

universe u
variable {Entity : Type u}
variable (OffLedger : Entity → Prop)
variable (DeterminacyRelevant : Entity → Prop)
variable (SemanticNull : Entity → Prop)

namespace GhostCollapse

/--
**Theorem 61.2:** Off-ledger + ¬determinacy-relevant ⇒ SemanticNull(x).

If an entity is off-ledger and does not affect determinacy-relevant structure,
it contributes no usable content to the theory—semantically null. Stronger than
explanatory inertness (Paper 55). This is the semantic nullity axiom from
Core.Principles.
-/
theorem off_ledger_nondeterminacy_semantic_null
    (x : Entity) (hOff : OffLedger x) (hNotDet : ¬ DeterminacyRelevant x) :
    SemanticNull x :=
  @GhostCollapse.off_ledger_nondeterminacy_implies_semantic_null Entity OffLedger DeterminacyRelevant SemanticNull x hOff hNotDet

end GhostCollapse
