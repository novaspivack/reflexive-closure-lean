import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.SelfTheory
import ReflexiveClosure.Core.SelfCoincidence
import ReflexiveUnfolding.Core.Frontier
import ReflexiveUnfolding.Core.TerminalCompletion
import ReflexiveUnfolding.Theorems.NoTerminalCompletion

/-!
# ReflexiveUnfolding.Theorems.FromPaper56

**Bridge from Paper 56 to Paper 57.**

IrreducibleReflexiveDistance (Paper 56) implies no internal self-theory is final.
For any theory-induced frontier, when the theory leaves remainder in the form of
a false negative (realized claim not asserted), we obtain frontier semantic
remainder and hence no terminal completion. This makes the step from "remainder
exists" to "articulation continues" explicit and theorem-grade.
-/

set_option autoImplicit false

namespace ReflexiveUnfolding

universe u

open SemanticSelfDescription

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
**Frontier induced by a theory** — The set of claims the theory asserts as true.
When the theory leaves remainder (fails to match realized truth somewhere), this
frontier omits at least one realized claim.
-/
def frontierFromTheory (T : InternalSelfTheory F) : Set F.Claim :=
  { c | ∃ code : F.Code, F.decode code = c ∧ T.verdict code = Verdict.yes }

/--
**DecodeInjective** — Each code decodes to a unique claim. Many self-referential
frames satisfy this (e.g. Gödel numbering). Needed for the theory-to-frontier
remainder bridge when multiple codes can decode to the same claim.
-/
class DecodeInjective (F : SemanticSelfDescription.SelfSemanticFrame W) : Prop where
  injective : Function.Injective F.decode

/--
**Theorem 57 (Bridge from Paper 56):** When a theory leaves remainder in the
form of a false negative (realized claim not asserted), the induced frontier
has semantic remainder. Requires decode injectivity so the remainder code
uniquely determines the omitted claim.
-/
theorem theory_remainder_implies_frontier_remainder
    (T : InternalSelfTheory F)
    [DecodeInjective F]
    (hRem : ∃ code : F.Code, F.RealizedTrue (F.decode code) ∧ T.verdict code ≠ Verdict.yes) :
    SemanticRemainder F (frontierFromTheory F T) := by
  obtain ⟨code, hReal, hNe⟩ := hRem
  use F.decode code
  constructor
  · exact hReal
  · intro hIn
    obtain ⟨code', hDec, hYes⟩ := hIn
    have heq : code' = code := DecodeInjective.injective hDec
    subst heq
    exact hNe hYes

/--
**Theorem 57.3 (Irreducible reflexive distance ⇒ no terminal completion):**
Under diagonal capability, Paper 56 establishes IrreducibleReflexiveDistance.
For any theory-induced frontier, when the theory leaves remainder (which
IrreducibleReflexiveDistance guarantees for non-final theories), we obtain
no terminal completion.
-/
theorem irreducible_distance_implies_no_terminal_for_theory_frontier
    (T : InternalSelfTheory F)
    [DecodeInjective F]
    (_hIrr : ReflexiveClosure.IrreducibleReflexiveDistance F)
    (hRem : ∃ code : F.Code, F.RealizedTrue (F.decode code) ∧ T.verdict code ≠ Verdict.yes) :
    ¬ TerminalReflexiveCompletion F (frontierFromTheory F T) :=
  no_terminal_reflexive_completion F (frontierFromTheory F T)
    (theory_remainder_implies_frontier_remainder F T hRem)

end ReflexiveUnfolding
