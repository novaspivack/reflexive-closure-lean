import LedgerGround.Core.OntologicalGround
import LedgerGround.Core.GroundCategories
import LedgerGround.Core.Principles
import LedgerGround.Theorems.SyntaxCannotGround
import LedgerGround.Theorems.SemanticsCannotGround
import LedgerGround.Theorems.NoExternalEqualGround
import LedgerGround.Theorems.GroundingSqueeze

/-!
# LedgerGround.Theorems.NoSelfActualizingLedger

**Theorem 62.4 and Corollary 62.5 (Paper 62).**

Re-exports from Principles:
- Theorem 62.4: `no_self_actualizing_ledger_thm` — No articulated ledger can be its own
  full sufficient ontological ground.

Re-exports from GroundingSqueeze (bridge theorems):
- Corollary 62.5: `grounding_squeeze` — Any adequate ground must be of a different
  category from syntax, object-level semantics, same-level external completion,
  and ghost residue.
-/
