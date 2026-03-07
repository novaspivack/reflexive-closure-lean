import NecessaryReflexiveIntelligence.Core.ExecutionModes

/-!
# NecessaryReflexiveIntelligence.Core.ChooserHierarchy

**Chooser hierarchy (Paper 58).**

Levels of chooserhood—the capacity to select among continuations—form a
hierarchy. Level 0: no choice. Level 1: simple selection. Level 2: adjudicative
(lawful non-algorithmic). Level 3: self-model-bearing. Level 4: frontier-sensitive.
Paper 58 establishes that nontrivial reflexive worlds necessarily occupy Level 2+.
-/

set_option autoImplicit false

namespace NecessaryReflexiveIntelligence

/--
**ChooserLevel** — A level in the execution/chooser hierarchy.
- Level 0: No choice (trivial or deterministic)
- Level 1: Simple selection (may be algorithmic)
- Level 2: Adjudicative (lawful non-algorithmic—excludes dead mechanism)
- Level 3: Self-model-bearing (adjudication with internal self-model)
- Level 4: Frontier-sensitive (adjudication over live semantic frontier)
-/
inductive ChooserLevel where
  | zero   : ChooserLevel  -- No choice
  | one    : ChooserLevel  -- Simple selection
  | two    : ChooserLevel  -- Adjudicative
  | three  : ChooserLevel  -- Self-model-bearing
  | four   : ChooserLevel  -- Frontier-sensitive

/-- Numeric encoding of chooser levels for comparison. -/
def ChooserLevel.toNat : ChooserLevel → Nat
  | .zero   => 0
  | .one    => 1
  | .two    => 2
  | .three  => 3
  | .four   => 4

/--
**AtLeastLevel** — A level is at least as high as another in the hierarchy.
-/
def AtLeastLevel (a b : ChooserLevel) : Prop :=
  a.toNat ≥ b.toNat

/--
**AdjudicativeLevel** — Level 2 and above are adjudicative levels.
-/
def AdjudicativeLevel : ChooserLevel → Prop
  | .zero  => False
  | .one   => False
  | .two   => True
  | .three => True
  | .four  => True

theorem level_two_at_least_two : AtLeastLevel .two .two := Nat.le_refl 2
theorem level_three_at_least_two : AtLeastLevel .three .two :=
  Nat.le_succ 2
theorem level_four_at_least_two : AtLeastLevel .four .two :=
  Nat.le_succ_of_le (Nat.le_succ 2)

/--
**Proposition 58.H1:** Adjudicative execution ⇒ at least chooser level 2.
-/
theorem adjudicative_implies_at_least_two (L : ChooserLevel)
    (h : AdjudicativeLevel L) : AtLeastLevel L .two := by
  cases L with
  | zero => exact False.elim h
  | one => exact False.elim h
  | two => exact Nat.le_refl 2
  | three => exact Nat.le_succ 2
  | four => exact Nat.le_succ_of_le (Nat.le_succ 2)

/--
**Proposition 58.H2:** Adjudicative + self-model-bearing ⇒ at least level 3.
Level 3 is the first level that adds self-model-bearing to adjudicative.
-/
theorem adjudicative_self_model_implies_at_least_three (L : ChooserLevel)
    (h : AdjudicativeLevel L) (hThree : L = .three ∨ L = .four) :
    AtLeastLevel L .three := by
  cases hThree with
  | inl heq => rw [heq]; exact Nat.le_refl 3
  | inr heq => rw [heq]; exact Nat.le_succ 3

/--
**Proposition 58.H3:** Adjudicative + self-model-bearing + frontier-sensitive ⇒
at least level 4. Level 4 is the highest tier.
-/
theorem adjudicative_self_model_frontier_implies_at_least_four (L : ChooserLevel)
    (h : L = .four) : AtLeastLevel L .four := by
  rw [h]; exact Nat.le_refl 4

end NecessaryReflexiveIntelligence
