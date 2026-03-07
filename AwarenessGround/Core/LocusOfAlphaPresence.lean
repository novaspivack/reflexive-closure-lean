import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.Claims
import AwarenessGround.Core.PresenceAt

/-!
# AwarenessGround.Core.LocusOfAlphaPresence

**Paper 67: Locus of Alpha-presence.**

LocusOfAlphaPresence(A) :⟺ ∃x.(AlphaManifestation(x) ∧ PresentAt(x,A))

States that Alpha-manifestation is present at locus A.
Takes HasAlphaManifestation as parameter; Bridge connects to GroundManifestation.
-/

set_option autoImplicit false

namespace AwarenessGround

universe u v w

variable {Ledger : Type u} {Ground : Type v}
variable {W : Type w} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
**LocusOfAlphaPresence (A)** — Locus A is a site at which Alpha-manifestation is present.

Definition: ∃x.(HasAlphaManifestation(x) ∧ PresentAt(x,A))
Bridge module instantiates HasAlphaManifestation from GroundManifestation.
-/
def LocusOfAlphaPresence {Locus : Type v} (HasAlphaManifestation : F.Claim → Prop) (A : Locus) : Prop :=
  ∃ x : F.Claim, HasAlphaManifestation x ∧ PresentAt F x A

end AwarenessGround
