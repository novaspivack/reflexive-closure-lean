import LedgerGround.Bridge.ToReflexiveFinality

/-!
# LedgerGround.Theorems.NoExternalEqualGround

**Theorem 62.3: No equal-status external ground (Paper 62).**

Re-exports `no_external_equal_status_ground_from_paper23` from Bridge.ToReflexiveFinality.
Bridge to Paper 23 (Foundational Finality).
-/

set_option autoImplicit false

open LedgerGround

/-- Theorem 62.3: No equal-status external ground can be the full sufficient ontological ground. -/
alias no_external_equal_status_ground_thm := no_external_equal_status_ground_from_paper23
