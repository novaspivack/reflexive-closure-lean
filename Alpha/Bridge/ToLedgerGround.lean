import LedgerGround.Core.OntologicalGround
import LedgerGround.Core.GroundCategories
import LedgerGround.Core.Principles
import LedgerGround.Theorems.SyntaxCannotGround
import LedgerGround.Theorems.SemanticsCannotGround
import LedgerGround.Theorems.NoExternalEqualGround
import LedgerGround.Theorems.NoSelfActualizingLedger

/-!
# Alpha.Bridge.ToLedgerGround

**Bridge to Paper 62 (LedgerGround).**

Re-exports LedgerGround's definitions and theorems for use in the Alpha
theorem. Paper 63 builds on Paper 62's grounding squeeze and no-self-
actualizing-ledger theorem.

## Paper 62 results used by Paper 63

- `OntologicalGround`, `LedgerActuality`, ground categories
- `no_self_actualizing_ledger_thm` — Theorem 62.4
- `grounding_squeeze` — Corollary 62.5 (any adequate ground must be
  outside excluded categories)
-/
