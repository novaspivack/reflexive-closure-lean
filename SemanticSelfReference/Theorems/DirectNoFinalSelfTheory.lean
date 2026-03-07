import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.SelfTheory
import SemanticSelfDescription.Theorems.NoFinalSelfTheory
import SemanticSelfReference.Core.SemanticNegation
import SemanticSelfReference.Core.SelfReferenceFrame
import SemanticSelfReference.Core.AntiVerdictClaims
import SemanticSelfReference.Theorems.DirectFixedPoint

/-!
# SemanticSelfReference.Theorems.DirectNoFinalSelfTheory

**Theorem 52.2: Direct no-final-self-theory (Paper 52).**

Any internal self-theory T that is total and exact on the full self-semantic
family yields contradiction on the fixed-point code from 52.1.

SelfRef + SemanticNegation + SelfScoped(T) + FinalST(T) ⇒ ⊥
-/

set_option autoImplicit false

namespace SemanticSelfReference

universe u v

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)
variable [SemanticNegation F]
variable [SelfReferenceFrame F]

variable (T : SemanticSelfDescription.InternalSelfTheory F)

/--
**Theorem 52.2**: If T is final and the frame has yes-claim data for all codes,
then we get contradiction via the fixed-point construction.

Case split on T(d): if yes, then decode(d) says "not yes" so contradiction;
if no, then decode(d) says "not yes" which is true, but T says no so T is wrong.
-/
theorem direct_no_final_self_theory
    (yesClaimFor : ∀ c : F.Code, YesClaimData F T c)
    (hFinal : SemanticSelfDescription.FinalSelfTheory T) :
    False := by
  obtain ⟨d, hEquiv⟩ := self_semantic_fixed_point_exists F T yesClaimFor
  -- T is total, so T.verdict d ∈ {yes, no}
  have hTotal := hFinal.2.1
  have hExact := hFinal.2.2
  have hd := hTotal d
  have hEx := hExact d
  -- decode(d) ≡ AntiYesClaim T d, so RealizedTrue(decode d) ↔ ¬(T says yes on d)
  rw [F.truth_ext hEquiv] at hEx
  rw [antiYesClaim_spec F T d (yesClaimFor d)] at hEx
  cases h : T.verdict d with
  | yes =>
    -- hEx.1 : (verdict = yes ↔ verdict ≠ yes); h gives verdict = yes, so verdict ≠ yes; contradiction
    exact (hEx.1.mp h) h
  | no =>
    -- hEx.2 : (verdict = no ↔ ¬(verdict ≠ yes)); h gives verdict = no, so ¬(verdict ≠ yes) → verdict = yes
    have hnot := hEx.2.mp h
    have heq := not_ne_iff.mp hnot
    have no_ne_yes : SemanticSelfDescription.Verdict.no ≠ SemanticSelfDescription.Verdict.yes :=
      by intro h'; cases h'
    exact no_ne_yes (h.symm.trans heq)
  | abstain =>
    exact hd h

end SemanticSelfReference
