import ReflexiveUnfolding.Core.Frontier
import ReflexiveUnfolding.Core.TerminalCompletion
import ReflexiveUnfolding.Core.ArticulativeStructure
import ReflexiveUnfolding.Core.LocalVsGlobal
import ReflexiveUnfolding.Theorems.NoTerminalCompletion
import ReflexiveUnfolding.Theorems.FromPaper56
import ReflexiveUnfolding.Theorems.FunctionalNonExhaustion
import ReflexiveUnfolding.Theorems.ArticulativeAscent
import ReflexiveUnfolding.Bridge.StructuredForgetting
import ReflexiveUnfolding.Bridge.ToRefinementFlow

/-!
# ReflexiveUnfolding — Paper 57: The Reflexive Unfolding Theorem

**Frontier generation and why there is change.**

Every achieved closure generates new semantic frontier; reflexive unfolding
cannot halt. The dynamic summit: semantic remainder + self-articulation ⇒
new boundary ⇒ nonterminal unfolding.

## Key definitions

- `Frontier`, `Articulates`, `SelfArticulating`
- `TerminalReflexiveCompletion`, `SemanticRemainder`

## Key theorems

- `semantic_remainder_implies_not_terminal` — Theorem 57.1
- `no_terminal_reflexive_completion` — Theorem 57.2

## Dependencies

- reflexive-closure-lean ReflexiveClosure (Paper 56)
- nems-lean SemanticSelfDescription (Paper 51)
-/
