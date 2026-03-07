import GhostCollapse.Core.OffLedger
import GhostCollapse.Core.DeterminacyRelevance
import GhostCollapse.Core.SemanticNullity
import GhostCollapse.Core.Principles
import GhostCollapse.Theorems.OffLedgerDeterminacy
import GhostCollapse.Theorems.SemanticNullity

set_option autoImplicit false

universe u
variable {Entity : Type u}
variable (OffLedger : Entity → Prop)
variable (DeterminacyRelevant : Entity → Prop)
variable (SemanticNull : Entity → Prop)

namespace GhostCollapse

/--
**Theorem 61.3 (Ghost collapse theorem):** OffLedger(x) ⇒
(DeterminacyRelevant(x) ⇒ ⊥) ∨ SemanticNull(x).

Any off-ledger entity is either determinacy-relevant (hence illicit) or
semantically null. This is the flagship theorem of Paper 61.
-/
theorem ghost_collapse
    (x : Entity) (hOff : OffLedger x) :
    (DeterminacyRelevant x → False) ∨ SemanticNull x := by
  by_cases h : DeterminacyRelevant x
  · left
    exact fun _ => off_ledger_determinacy_implies_illicit OffLedger DeterminacyRelevant x hOff h
  · right
    exact off_ledger_nondeterminacy_semantic_null OffLedger DeterminacyRelevant SemanticNull x hOff h

/--
**Corollary 61.4 (No viable ghost ontology):** No viable ontology of
real-but-off-ledger ghost entities survives.

If they matter (determinacy-relevant), they are illicit.
If they do not matter (not determinacy-relevant), they are null.
-/
theorem no_viable_ghost_ontology
    (x : Entity) (hOff : OffLedger x) :
    (DeterminacyRelevant x → False) ∨ SemanticNull x :=
  ghost_collapse OffLedger DeterminacyRelevant SemanticNull x hOff

end GhostCollapse
