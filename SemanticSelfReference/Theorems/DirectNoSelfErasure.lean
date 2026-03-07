import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.SelfTheory
import SemanticSelfDescription.Core.SelfErasure
import SemanticSelfDescription.Theorems.NoSelfErasure
import SemanticSelfReference.Theorems.DirectNoFinalSelfTheory

/-!
# SemanticSelfReference.Theorems.DirectNoSelfErasure

**Theorems 52.4–52.5: Direct no weak/strong self-erasure (Paper 52).**

Use the direct fixed-point construction to recover no_weak_self_erasure
and no_strong_self_erasure directly, without going through SelectorStrength.
-/

set_option autoImplicit false

namespace SemanticSelfReference

universe u v

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)
variable [SemanticNegation F]
variable [SelfReferenceFrame F]

/--
**Theorem 52.4**: No weak self-erasure, direct route.

Weak self-erasing implies final self-theory (Paper 51). The direct theorem
rules out final self-theory. Hence no weak self-erasure.
-/
theorem direct_no_weak_self_erasure
    (yesClaimFor : ∀ T c, YesClaimData F T c)
    (T : SemanticSelfDescription.InternalSelfTheory F)
    (hWeak : SemanticSelfDescription.WeakSelfErasing F T) :
    False := by
  obtain ⟨w⟩ := hWeak
  exact direct_no_final_self_theory F T (yesClaimFor T) w.final

/--
**Theorem 52.5**: No strong self-erasure, direct route.

Strong self-erasing implies final self-theory (Paper 51). Same argument.
-/
theorem direct_no_strong_self_erasure
    (yesClaimFor : ∀ T c, YesClaimData F T c)
    (T : SemanticSelfDescription.InternalSelfTheory F)
    (hStrong : SemanticSelfDescription.StrongSelfErasing F T) :
    False := by
  obtain ⟨s⟩ := hStrong
  exact direct_no_final_self_theory F T (yesClaimFor T) s.closure.final

end SemanticSelfReference
