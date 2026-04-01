import Mathlib.Data.Set.Basic
import Mathlib.Logic.Function.Basic
import ReflexiveClosure.Core.MapForgetting

/-!
# ReflexiveClosure.Core.FamilyConservation

**Class-level (family) invariance — a minimal “conservation law” interface.**

Single-map forgetting asks which distinctions collapse under one map `f`.  A
*conservation law* in this package is an observable `I` that satisfies
`I ∘ f = I` for every map `f` in a chosen *admissible* class.  This is the
formal backbone of the slogan “conservation is class-level memory”: what survives
every admissible transformation is exactly what no map in the class can erase
from the perspective of `I`.

This module is intentionally tiny: no physics, no dynamics, only abstract types
and functions.  It composes with `MapForgetting` to relate local fiber collapse
to class-wide invariance.
-/

set_option autoImplicit false

namespace ReflexiveClosure

universe u

variable {α ι : Type u}

/-- Observing after applying `f` agrees with observing before — pointwise
`I (f a) = I a`, packaged as equality of functions `I ∘ f = I`. -/
def InvariantUnder (I : α → ι) (f : α → α) : Prop :=
  I ∘ f = I

/-- `I` is a **class invariant** for maps in `adm` if every admissible
endomorphism conserves `I`. This is one formal reading of “conservation law”. -/
def ClassInvariant (I : α → ι) (adm : Set (α → α)) : Prop :=
  ∀ f, f ∈ adm → InvariantUnder I f

/-- Same as `ClassInvariant`, but with an admissibility predicate instead of a set. -/
def ClassInvariantPred (I : α → ι) (Admissible : (α → α) → Prop) : Prop :=
  ∀ f, Admissible f → InvariantUnder I f

theorem classInvariant_iff_pred (I : α → ι) (adm : Set (α → α)) :
    ClassInvariant I adm ↔ ClassInvariantPred I (fun f => f ∈ adm) := by
  rfl

theorem invariantUnder_iff_pointwise (I : α → ι) (f : α → α) :
    InvariantUnder I f ↔ ∀ a, I (f a) = I a := by
  unfold InvariantUnder
  rw [funext_iff]
  simp_rw [Function.comp_apply]

/-- A conserved observable agrees on points identified by `f` (constant on fibers of `f`). -/
theorem invariant_agrees_on_fiber (I : α → ι) (f : α → α) (hI : InvariantUnder I f) {a₁ a₂ : α}
    (heq : f a₁ = f a₂) : I a₁ = I a₂ :=
  calc
    I a₁ = I (f a₁) := (congr_fun hI a₁).symm
    _ = I (f a₂) := congr_arg I heq
    _ = I a₂ := congr_fun hI a₂

/-- **Local duality:** anything invariant under `f` cannot distinguish a pair of
points that `f` collapses — the “unforgotten remainder” from the perspective of
`I` is blind to whatever the single map forgets. -/
theorem invariant_identifies_forgotten_distinctions (I : α → ι) (f : α → α)
    (hI : InvariantUnder I f) {a₁ a₂ : α} (hf : ForgetsDistinction f a₁ a₂) :
    I a₁ = I a₂ := by
  exact invariant_agrees_on_fiber I f hI hf.2

theorem class_invariant_agrees_on_fiber (I : α → ι) (adm : Set (α → α)) (h : ClassInvariant I adm)
    {f : α → α} (hf : f ∈ adm) {a₁ a₂ : α} (heq : f a₁ = f a₂) : I a₁ = I a₂ :=
  invariant_agrees_on_fiber I f (h f hf) heq

/-- Paper-facing alias: class-level conservation / “memory” under an admissible family. -/
abbrev ConservationLaw (I : α → ι) (adm : Set (α → α)) : Prop :=
  ClassInvariant I adm

/-- Wrapper: conservation laws are exactly `ClassInvariant`. -/
theorem conservation_law_is_class_invariant (I : α → ι) (adm : Set (α → α)) :
    ConservationLaw I adm ↔ ClassInvariant I adm :=
  Iff.rfl

/-- Wrapper: single-map conservation forbids detecting forgotten distinctions. -/
theorem conservation_complement_single_map_forgetting (I : α → ι) (f : α → α)
    (hI : InvariantUnder I f) {a₁ a₂ : α} (hf : ForgetsDistinction f a₁ a₂) :
    I a₁ = I a₂ :=
  invariant_identifies_forgotten_distinctions I f hI hf

/-- Memorable paper name: class invariants are blind to any distinction a conserving map merges. -/
theorem class_level_memory_vs_local_forgetting (I : α → ι) (f : α → α) (hI : InvariantUnder I f)
    {a₁ a₂ : α} (hf : ForgetsDistinction f a₁ a₂) : I a₁ = I a₂ :=
  conservation_complement_single_map_forgetting I f hI hf

end ReflexiveClosure
