import AwarenessGround.Core.RealizedAwareness
import AwarenessGround.Core.RequiresSameLevelObserver

/-!
# AwarenessGround.Core.SelfIllumination

**Paper 67: Self-illumination of realized awareness (67.6–67.8).**

SelfIlluminating(A) — A is present in a way that includes intrinsic self-givenness,
without requiring a second same-level observer.

**Definition (67.6c):** SelfIlluminating := RealizedAwareness ∧ ¬RequiresSameLevelObserver.
This makes 67.6 a derived theorem: from 67.6a (LocusOfAlphaPresence ⇒ RealizedAwareness)
and 67.6b (RealizedAwareness ⇒ ¬RequiresSameLevelObserver), we derive 67.6.
-/

set_option autoImplicit false

namespace AwarenessGround

universe u v w

variable {Ledger : Type u} {Ground : Type v}
variable {W : Type w} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
**SelfIlluminating (HasAlphaManifestation) (A)** — Locus A is self-illuminating:
realized awareness with intrinsic self-givenness, no second same-level observer required.

Definition: RealizedAwareness(HasAlphaManifestation, A) ∧ ¬RequiresSameLevelObserver(A)
Not dualistic self-representation; intrinsic reflexive presence.
67.7 (no second observer required) is built into this definition.
-/
def SelfIlluminating {Locus : Type v} (HasAlphaManifestation : F.Claim → Prop) (A : Locus) : Prop :=
  RealizedAwareness F HasAlphaManifestation A ∧ ¬RequiresSameLevelObserver A

end AwarenessGround
