import AwarenessGround.Core.LocusOfAlphaPresence

/-!
# AwarenessGround.Core.RealizedAwareness

**Paper 67: Realized awareness (67.6a).**

RealizedAwareness(A) — There is lived Alpha-manifestation present at locus A.
Equivalent to LocusOfAlphaPresence; defined as such so that 67.6a is immediate
and the derivation chain (67.6a → 67.6b → 67.6c → 67.6) has a clear first step.
-/

set_option autoImplicit false

namespace AwarenessGround

universe u v w

variable {Ledger : Type u} {Ground : Type v}
variable {W : Type w} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
**RealizedAwareness (HasAlphaManifestation) (A)** — Locus A has realized awareness:
there is Alpha-manifestation present there as lived content.

Definitional equivalent of LocusOfAlphaPresence. Used in the 67.6 derivation chain.
-/
def RealizedAwareness {Locus : Type v} (HasAlphaManifestation : F.Claim → Prop) (A : Locus) : Prop :=
  LocusOfAlphaPresence F HasAlphaManifestation A

/--
**67.6a:** LocusOfAlphaPresence(A) ⇒ RealizedAwareness(A).

Immediate from the definition.
-/
theorem locus_of_alpha_presence_implies_realized_awareness
  {Locus : Type v} (HasAlphaManifestation : F.Claim → Prop) (A : Locus)
  (h : LocusOfAlphaPresence F HasAlphaManifestation A) :
  RealizedAwareness F HasAlphaManifestation A :=
  h

end AwarenessGround
