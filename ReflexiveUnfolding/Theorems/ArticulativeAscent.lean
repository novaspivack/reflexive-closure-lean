import ReflexiveUnfolding.Core.Frontier
import ReflexiveUnfolding.Core.TerminalCompletion
import ReflexiveUnfolding.Theorems.NoTerminalCompletion

/-!
# ReflexiveUnfolding.Theorems.ArticulativeAscent

**Articulation-chain non-terminality (Paper 57).**

Every semantic remainder yields a further frontier (`SelfArticulating`); hence
no terminal reflexive completion. Iterated along `ℕ`, each stage with remainder
is non-terminal—the formal “chain of articulation” corollary of
`semantic_remainder_implies_not_terminal`.
-/

set_option autoImplicit false

namespace ReflexiveUnfolding

universe u

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

theorem every_articulation_leaves_further_frontier
    (frontier : Set F.Claim) (hRem : SemanticRemainder F frontier) :
    SelfArticulating F frontier := by
  rcases hRem with ⟨c, _, hn⟩
  exact ⟨c, hn⟩

theorem articulative_ascent_nonterminal
    (frontier : Set F.Claim) (hRem : SemanticRemainder F frontier) :
    ¬ TerminalReflexiveCompletion F frontier :=
  no_terminal_reflexive_completion F frontier hRem

theorem no_terminal_articulative_ascent_nat
    (σ : ℕ → Set F.Claim) (hEach : ∀ n, SemanticRemainder F (σ n)) :
    ∀ n, ¬ TerminalReflexiveCompletion F (σ n) :=
  fun n => no_terminal_reflexive_completion F (σ n) (hEach n)

theorem internal_ascent_does_not_close_remainder
    (frontier : Set F.Claim) (hRem : SemanticRemainder F frontier) :
    ¬ TerminalReflexiveCompletion F frontier :=
  no_terminal_reflexive_completion F frontier hRem

alias no_terminal_internal_articulation := articulative_ascent_nonterminal

alias chain_of_articulation_is_nonterminal := articulative_ascent_nonterminal

end ReflexiveUnfolding
