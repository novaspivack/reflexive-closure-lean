import GhostCollapse.Core.OffLedger
import GhostCollapse.Core.DeterminacyRelevance
import GhostCollapse.Core.SemanticNullity
import GhostCollapse.Core.Principles
import GhostCollapse.Theorems.OffLedgerDeterminacy
import GhostCollapse.Theorems.SemanticNullity
import GhostCollapse.Theorems.GhostCollapse
import GhostCollapse.Bridge.ToNoFreeBits

/-!
# GhostCollapse — Paper 61: Ghost Collapse and Ledger Finality

**Off-ledger being is either illicit or null.**

Paper 61 proves that any purported off-ledger entity is either determinacy-relevant
(hence illicit under no-free-bits) or semantically inert (hence theory-null).
This kills the "ghost ontology" escape hatch: maybe the real ground is some
ghostly off-ledger thing.

## Key definitions

- `OffLedger` — entity not represented in the semantic ledger
- `DeterminacyRelevant` — affects reports, memory, adjudication, self-models
- `SemanticNull` — contributes no usable content to the theory
- `Ghost` — off-ledger and purportedly exists (exposition)

## Key theorems

- `off_ledger_determinacy_implies_illicit` — Theorem 61.1: off-ledger + determinacy ⇒ ⊥
- `off_ledger_nondeterminacy_implies_semantic_null` — Theorem 61.2: off-ledger + ¬determinacy ⇒ SemanticNull
- `ghost_collapse` — Theorem 61.3: OffLedger ⇒ (DeterminacyRelevant ⇒ ⊥) ∨ SemanticNull
- `no_viable_ghost_ontology` — Corollary 61.4: no viable ghost ontology survives

## Dependencies

- Paper 27 (no-free-bits)
- Paper 55 (QualiaLedger)
- Paper 54 (observer models) — helpful
-/
