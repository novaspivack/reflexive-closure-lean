import Mathlib.Data.Set.Basic

/-!
# ReflexiveClosure.Core.RepresentationFrame

**Minimal “representation vs frontier” interface.**

`RepSemanticRemainder` and `RepresentationExhaustive` abstract the Paper 57
pattern—realized content versus articulated frontier—on an arbitrary
`Content` type, without importing `ReflexiveUnfolding`. The equivalence with
`ReflexiveUnfolding.SemanticRemainder` for `Content = F.Claim` is proved in
`ReflexiveUnfolding.Bridge.StructuredForgetting`.
-/

set_option autoImplicit false

namespace ReflexiveClosure

universe u

variable {Content : Type u}

/-- Realized content not yet in the articulated frontier. -/
def RepSemanticRemainder (realized : Content → Prop) (articulated : Set Content) : Prop :=
  ∃ c : Content, realized c ∧ c ∉ articulated

/-- All realized content lies in the articulated frontier. -/
def RepresentationExhaustive (realized : Content → Prop) (articulated : Set Content) : Prop :=
  ∀ c : Content, realized c → c ∈ articulated

/-- Not exhaustive: some realized content lies outside the frontier. -/
def RepresentationSelective (realized : Content → Prop) (articulated : Set Content) : Prop :=
  ¬ RepresentationExhaustive realized articulated

theorem representation_selective_iff_rep_semantic_remainder (realized : Content → Prop)
    (articulated : Set Content) :
    RepresentationSelective realized articulated ↔ RepSemanticRemainder realized articulated := by
  constructor
  · intro hSel
    classical
    by_contra hN
    have hEx : RepresentationExhaustive realized articulated := by
      intro c hc
      by_contra hnin
      exact hN ⟨c, hc, hnin⟩
    exact hSel hEx
  · rintro ⟨c, hr, hn⟩ hEx
    exact hn (hEx c hr)

theorem internal_articulation_not_exhaustive_iff_remainder (realized : Content → Prop)
    (articulated : Set Content) :
    RepresentationSelective realized articulated ↔ RepSemanticRemainder realized articulated :=
  representation_selective_iff_rep_semantic_remainder realized articulated

end ReflexiveClosure
