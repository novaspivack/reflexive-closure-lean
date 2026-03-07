import SemanticSelfDescription.Core.Claims
import CalculusOfIntelligence.Core.IntelligenceLevels
import NecessaryReflexiveIntelligence.Core.ChooserHierarchy
import NecessaryReflexiveIntelligence.Core.MinimalReflexiveIntelligence

/-!
# CalculusOfIntelligence.Theorems.HierarchyTheorems

**Hierarchy theorems (Paper 59).**

The intelligence/chooser hierarchy is strict: higher levels imply lower levels.
Frontier-bearing reflexive systems admit precise intelligence levels. Minimal
reflexive intelligence occupies level 4 (frontier-sensitive) in the hierarchy.
-/

set_option autoImplicit false

namespace CalculusOfIntelligence

universe u

open NecessaryReflexiveIntelligence

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
**Theorem 59.3:** Minimal reflexive intelligence implies at least chooser
level 2. A system with minimal reflexive intelligence has adjudicative
execution (lawful non-algorithmic), self-model-bearing, and frontier
sensitivity. By the hierarchy, adjudicative alone implies at least level 2.
-/
theorem minimal_intelligence_at_least_level_two
    (frontier : Set F.Claim)
    (mri : MinimalReflexiveIntelligence F frontier) :
    AtLeastLevel mri.adjudicative .two :=
  adjudicative_implies_at_least_two mri.adjudicative mri.adjudicative_level

/--
**Proposition 59.4:** The hierarchy is monotonic. If level A ≥ level B and
B is an adjudicative level, then A is an adjudicative level.
-/
theorem hierarchy_monotonic (a b : ChooserLevel)
    (h : AtLeastLevel a b)
    (hB : AdjudicativeLevel b) :
    AdjudicativeLevel a := by
  cases a with
  | zero =>
    have hba : b.toNat ≤ 0 := h
    have hb : 2 ≤ b.toNat := by
      cases b with
      | zero => exact False.elim hB
      | one => exact False.elim hB
      | two => exact Nat.le_refl 2
      | three => exact Nat.le_succ 2
      | four => exact Nat.le_succ_of_le (Nat.le_succ 2)
    have : 2 ≤ 0 := Nat.le_trans hb hba
    exact absurd this (by decide)
  | one =>
    have hba : b.toNat ≤ 1 := h
    have hb : 2 ≤ b.toNat := by
      cases b with
      | zero => exact False.elim hB
      | one => exact False.elim hB
      | two => exact Nat.le_refl 2
      | three => exact Nat.le_succ 2
      | four => exact Nat.le_succ_of_le (Nat.le_succ 2)
    have : 2 ≤ 1 := Nat.le_trans hb hba
    exact absurd this (by decide)
  | two => exact trivial
  | three => exact trivial
  | four => exact trivial

end CalculusOfIntelligence
