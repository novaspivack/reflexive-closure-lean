import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.SelfTheory
import ReflexiveClosure.Core.SelfCoincidence
import ReflexiveUnfolding.Core.TerminalCompletion
import ReflexiveUnfolding.Theorems.FromPaper56
import ReflexiveUnfolding.Theorems.NoTerminalCompletion

/-!
# ReflexiveUnfolding.Theorems.FunctionalNonExhaustion

**Function-as-internal-representation bridge (Paper 56–57).**

An `InternalSelfTheory` is treated as the minimal “internal transform” generating
an articulated frontier (`frontierFromTheory`). Semantic exhaustiveness of such
a transform is `FinalSelfTheory`. Paper 56’s `IrreducibleReflexiveDistance` is
precisely “no functionally final internal theory.”

Downstream of a false-negative remainder witness, `no_terminal_functional_completion`
packages `irreducible_distance_implies_no_terminal_for_theory_frontier`.
-/

set_option autoImplicit false

namespace ReflexiveUnfolding

universe u

open SemanticSelfDescription

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

/-- Minimal encoding of “internal transform”: an internal self-theory. -/
abbrev InternalTransform := InternalSelfTheory F

/-- Articulated frontier induced by the transform (alias for theory-induced frontier). -/
abbrev FunctionFrontier (T : InternalSelfTheory F) : Set F.Claim :=
  frontierFromTheory F T

/-- “Functionally” semantically exhaustive := final internal self-theory. -/
abbrev FunctionSemanticallyExhaustive (T : InternalSelfTheory F) : Prop :=
  FinalSelfTheory T

/-- Theory leaves a false-negative remainder (realized claim not asserted yes). -/
def FunctionLeavesRemainder (T : InternalSelfTheory F) : Prop :=
  ∃ code : F.Code, F.RealizedTrue (F.decode code) ∧ T.verdict code ≠ Verdict.yes

theorem function_frontier_of_internal_transform (T : InternalSelfTheory F) :
    FunctionFrontier F T = frontierFromTheory F T :=
  rfl

theorem irreducible_distance_implies_not_functionally_exhaustive
    (h : ReflexiveClosure.IrreducibleReflexiveDistance F) (T : InternalSelfTheory F) :
    ¬ FunctionSemanticallyExhaustive F T :=
  h T

/-- Paper-facing name: irreducible distance ⇒ no final functional self-image. -/
theorem functional_non_exhaustion_theorem
    (h : ReflexiveClosure.IrreducibleReflexiveDistance F) (T : InternalSelfTheory F) :
    ¬ FunctionSemanticallyExhaustive F T :=
  irreducible_distance_implies_not_functionally_exhaustive F h T

alias no_functional_self_exhaustion := irreducible_distance_implies_not_functionally_exhaustive

theorem no_terminal_functional_completion
    (T : InternalSelfTheory F) [DecodeInjective F]
    (hIrr : ReflexiveClosure.IrreducibleReflexiveDistance F)
    (hRem : FunctionLeavesRemainder F T) :
    ¬ TerminalReflexiveCompletion F (FunctionFrontier F T) :=
  irreducible_distance_implies_no_terminal_for_theory_frontier F T hIrr hRem

theorem no_terminal_functional_completion_from_remainder
    (T : InternalSelfTheory F) [DecodeInjective F]
    (hIrr : ReflexiveClosure.IrreducibleReflexiveDistance F)
    (hRem : ∃ code : F.Code, F.RealizedTrue (F.decode code) ∧ T.verdict code ≠ Verdict.yes) :
    ¬ TerminalReflexiveCompletion F (FunctionFrontier F T) :=
  no_terminal_functional_completion F T hIrr hRem

end ReflexiveUnfolding
