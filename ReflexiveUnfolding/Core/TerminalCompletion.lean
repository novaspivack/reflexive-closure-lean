import SemanticSelfDescription.Core.Claims
import ReflexiveUnfolding.Core.Frontier

/-!
# ReflexiveUnfolding.Core.TerminalCompletion

**Terminal reflexive completion (Paper 57).**

A system has reached terminal reflexive completion if no new frontier
can be generated—i.e., all semantic content has been articulated.
This would contradict Paper 56's semantic remainder.
-/

set_option autoImplicit false

namespace ReflexiveUnfolding

universe u

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
**TerminalReflexiveCompletion** — The system has reached a state where
no new frontier is generated. All semantic content would be articulated;
no semantic remainder. This is the "halting" state for reflexive unfolding.
-/
def TerminalReflexiveCompletion (frontier : Set F.Claim) : Prop :=
  ¬ SelfArticulating F frontier

/--
**SemanticRemainder** — There exists semantic content not captured by
the current frontier. Paper 56 (via Paper 53) establishes that semantic
remainder is necessary under diagonal capability.
-/
def SemanticRemainder (frontier : Set F.Claim) : Prop :=
  ∃ c : F.Claim, F.RealizedTrue c ∧ c ∉ frontier

end ReflexiveUnfolding
