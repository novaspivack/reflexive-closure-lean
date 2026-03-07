import ReflexiveUnfolding.Core.Frontier
import ReflexiveUnfolding.Core.TerminalCompletion

/-!
# ReflexiveUnfolding.Theorems.NoTerminalCompletion

**Paper 57: No terminal reflexive completion.**

Under diagonal capability, semantic remainder exists (Paper 56, Paper 53).
Semantic remainder implies the system can articulate (there is content
not yet in the frontier). Hence terminal reflexive completion is impossible.
-/

set_option autoImplicit false

namespace ReflexiveUnfolding

universe u

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
**Theorem 57.1:** Semantic remainder implies no terminal completion.

If there is semantic content not in the frontier, then the system is
self-articulating (can add that content). Hence it is not terminally
complete.
-/
theorem semantic_remainder_implies_not_terminal
    (frontier : Set F.Claim)
    (hRem : SemanticRemainder F frontier) :
    ¬ TerminalReflexiveCompletion F frontier := by
  intro hTerm
  obtain ⟨c, hReal, hNotIn⟩ := hRem
  unfold TerminalReflexiveCompletion at hTerm
  unfold SelfArticulating at hTerm
  exact hTerm ⟨c, hNotIn⟩

/--
**Theorem 57.2 (No terminal reflexive completion):** Under diagonal capability,
a reflexive system with semantic remainder cannot reach terminal completion.

Proof: Paper 56 establishes irreducible reflexive distance ⇒ semantic remainder.
Semantic remainder ⇒ not terminal (Theorem 57.1). Hence no terminal completion.
-/
theorem no_terminal_reflexive_completion
    (frontier : Set F.Claim)
    (hRem : SemanticRemainder F frontier) :
    ¬ TerminalReflexiveCompletion F frontier :=
  semantic_remainder_implies_not_terminal F frontier hRem

end ReflexiveUnfolding
