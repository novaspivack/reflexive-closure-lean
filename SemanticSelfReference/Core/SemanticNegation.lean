import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.SelfTheory

/-!
# SemanticSelfReference.Core.SemanticNegation

**Semantic negation on claims (Paper 52).**

A claim-level operator ¬_sem : Claim → Claim such that
  RealizedTrue(¬_sem φ) ↔ ¬ RealizedTrue(φ).

This is stronger than syntactic negation: it is a semantic truth-flipping
operation on the self-semantic frame.
-/

set_option autoImplicit false

namespace SemanticSelfReference

universe u v

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
A **semantic negation** class extends a self-semantic frame with
a negation operator on claims that flips realized truth.
-/
class SemanticNegation (F : SemanticSelfDescription.SelfSemanticFrame W) where
  /-- Negation operator on claims -/
  neg : F.Claim → F.Claim
  /-- Negation correctness: ¬φ is true iff φ is false -/
  neg_spec : ∀ φ : F.Claim, (F.RealizedTrue (neg φ) ↔ ¬ F.RealizedTrue φ)

/--
When the frame has semantic negation, we can form the negation of
the decoded claim for any code.
-/
def negCode [SemanticNegation F] (code : F.Code) : F.Claim :=
  (SemanticNegation.neg (F := F)) (F.decode code)

theorem negCode_spec [SemanticNegation F] (code : F.Code) :
    F.RealizedTrue (negCode F code) ↔ ¬ F.selfSemanticTruth code := by
  unfold negCode SemanticSelfDescription.SelfSemanticFrame.selfSemanticTruth
  exact SemanticNegation.neg_spec (F.decode code)

end SemanticSelfReference
