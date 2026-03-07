import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.SelfTheory
import SemanticSelfDescription.Core.SelfScope
import SemanticSelfReference.Core.SemanticNegation
import SemanticSelfReference.Core.SelfReferenceFrame
import SemanticSelfReference.Core.AntiVerdictClaims
import SemanticSelfReference.Bridge.FromSelfScoped

/-!
# SemanticSelfReference.Theorems.DirectFixedPoint

**Theorem 52.1: Self-semantic fixed-point existence (Paper 52).**

Under self-reference interface + self-scope + semantic negation,
there exists a code d such that decode(d) is semantically equivalent
to the anti-verdict claim built from d.

I.e. ∃ d, decode(d) ≡_sem ¬("T says yes on d")
-/

set_option autoImplicit false

namespace SemanticSelfReference

universe u v

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)
variable [SemanticNegation F]
variable [SelfReferenceFrame F]

variable (T : SemanticSelfDescription.InternalSelfTheory F)

/--
**Theorem 52.1**: Under the self-reference frame and semantic negation,
for any theory T with yes-claim data, there exists a fixed-point code d
such that decode(d) is equivalent to the anti-yes claim for T on d.

Requires that the frame can construct yes-claims for self-referential codes.
The full proof needs the SelfReferenceFrame.fixedPointExists applied to
the transformer that maps c ↦ AntiYesClaim T c (built from c).
-/
theorem self_semantic_fixed_point_exists
    (yesClaimFor : ∀ c : F.Code, YesClaimData F T c) :
    ∃ d : F.Code,
      F.ClaimEquiv (F.decode d)
        (AntiYesClaim F T d (yesClaimFor d)) := by
  let f : F.Code → F.Claim := fun c => AntiYesClaim F T c (yesClaimFor c)
  obtain ⟨d, hd⟩ := SelfReferenceFrame.fixedPointExists f
  exact ⟨d, hd⟩

/--
**Theorem 52.1 (strengthened):** Self-semantic fixed point from SelfScoped.

When T is self-scoped, YesClaimData is derived from scope (Goal A). No external
yesClaimFor assumption needed.
-/
theorem self_semantic_fixed_point_exists_from_self_scoped
    (scope : SemanticSelfDescription.SelfScoped F T) :
    ∃ d : F.Code,
      F.ClaimEquiv (F.decode d)
        (AntiYesClaim F T d (selfScoped_implies_yesClaimData F T scope d)) :=
  self_semantic_fixed_point_exists F T (selfScoped_implies_yesClaimData F T scope)

end SemanticSelfReference
