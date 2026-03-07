import LedgerGround.Bridge.ToSyntaxSemantics

/-!
# LedgerGround.Theorems.SyntaxCannotGround

**Theorem 62.1: Syntax cannot ground actuality (Paper 62).**

Re-exports `syntax_cannot_ground_from_paper53` from Bridge.ToSyntaxSemantics.
Bridge to Paper 53 (no syntactic exhaustion of semantics).
-/

set_option autoImplicit false

open LedgerGround

/-- Theorem 62.1: No syntactic ground can be the full sufficient ontological ground. -/
alias syntax_cannot_ground_thm := syntax_cannot_ground_from_paper53
