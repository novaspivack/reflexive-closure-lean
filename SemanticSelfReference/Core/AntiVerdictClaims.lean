import Mathlib.Logic.Basic
import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.SelfTheory
import SemanticSelfReference.Core.SemanticNegation

/-!
# SemanticSelfReference.Core.AntiVerdictClaims

**Anti-verdict claims (Paper 52).**

For a theory T and code c, construct claims of the form:
- "T says yes on c" (decoded to a claim about T's verdict)
- "T is wrong on c" = ¬(T says yes on c) when c is actually false, etc.

The key constructor: AntiYesClaim T c = ¬_sem("T says yes on c")
-/

set_option autoImplicit false

namespace SemanticSelfReference

universe u v

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

variable [SemanticNegation F]

/--
**Yes-claim**: the claim that theory T asserts "yes" on code c.

In a full development, this would be a decoded claim whose realized truth
holds iff T.verdict c = yes. For the minimal setup, we axiomatize the
existence of such a claim constructor when the frame has self-scope.
-/
-- Placeholder: in full development, this connects to SelfScoped
-- and builds "T says yes on c" as a claim. For now we state the interface.
structure YesClaimData (T : SemanticSelfDescription.InternalSelfTheory F) (c : F.Code) where
  claim : F.Claim
  /-- The claim is true iff T says yes on c -/
  spec : F.RealizedTrue claim ↔ T.verdict c = SemanticSelfDescription.Verdict.yes

/--
**Anti-yes claim**: the semantic negation of "T says yes on c".

So AntiYesClaim T c is true iff T does NOT say yes on c.
-/
def AntiYesClaim (T : SemanticSelfDescription.InternalSelfTheory F) (c : F.Code)
    (yesData : YesClaimData F T c) : F.Claim :=
  SemanticNegation.neg yesData.claim

theorem antiYesClaim_spec (T : SemanticSelfDescription.InternalSelfTheory F) (c : F.Code)
    (yesData : YesClaimData F T c) :
    F.RealizedTrue (AntiYesClaim F T c yesData) ↔ T.verdict c ≠ SemanticSelfDescription.Verdict.yes := by
  unfold AntiYesClaim
  rw [SemanticNegation.neg_spec, Iff.not yesData.spec, ← ne_eq]

end SemanticSelfReference
