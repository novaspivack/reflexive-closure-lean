import Mathlib.Logic.Function.Basic

/-!
# ReflexiveClosure.Core.MapForgetting

**Local map-level forgetting (bridge to universal “what maps forget”).**

Abstract definitions on arbitrary types: a map *forgets a distinction* when it
identifies two distinct inputs. This packages standard set-theoretic facts used
in the summit-2 interpretive section as named theorem surfaces, without
depending on `SemanticSelfDescription` Papers 51–57.
-/

set_option autoImplicit false

namespace ReflexiveClosure

universe u

variable {α β : Type u}

/-- Distinct source points identified in the image: map-level forgetting. -/
def ForgetsDistinction (f : α → β) (a₁ a₂ : α) : Prop :=
  a₁ ≠ a₂ ∧ f a₁ = f a₂

/-- The map collapses some distinction (non-injective witness). -/
def HasForgetting (f : α → β) : Prop :=
  ∃ a₁ a₂, ForgetsDistinction f a₁ a₂

/-- Paper phrasing: “map remainder” / forgotten witness exists. -/
abbrev MapRemainderNonempty (f : α → β) : Prop := HasForgetting f

theorem hasForgetting_iff_not_injective (f : α → β) :
    HasForgetting f ↔ ¬ Function.Injective f := by
  constructor
  · rintro ⟨a₁, a₂, hne, heq⟩ hinj
    exact hne (hinj heq)
  · intro h
    rcases Function.not_injective_iff.1 h with ⟨a₁, a₂, heq, hne⟩
    exact ⟨a₁, a₂, hne, heq⟩

theorem injective_iff_no_forgotten_distinction (f : α → β) :
    Function.Injective f ↔ ∀ a₁ a₂, ¬ ForgetsDistinction f a₁ a₂ := by
  constructor
  · intro hinj a₁ a₂ ⟨hne, heq⟩
    exact hne (hinj heq)
  · intro h a₁ a₂ heq
    by_contra hne
    exact h a₁ a₂ ⟨hne, heq⟩

theorem map_remainder_nonempty_iff_not_injective (f : α → β) :
    MapRemainderNonempty f ↔ ¬ Function.Injective f :=
  hasForgetting_iff_not_injective f

/-- Paper-facing alias: forgetting of distinctions ↔ non-injectivity. -/
theorem representation_forgetting_theorem (f : α → β) :
    HasForgetting f ↔ ¬ Function.Injective f :=
  hasForgetting_iff_not_injective f

end ReflexiveClosure
