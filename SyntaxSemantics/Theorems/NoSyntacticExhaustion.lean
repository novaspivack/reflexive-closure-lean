import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.SelfTheory
import SemanticSelfReference.Core.SemanticNegation
import SemanticSelfReference.Core.SelfReferenceFrame
import SemanticSelfReference.Core.AntiVerdictClaims
import SemanticSelfReference.Bridge.FromSelfScoped
import SemanticSelfReference.Theorems.DirectNoFinalSelfTheory
import SyntaxSemantics.Core.SyntacticTheory

/-!
# SyntaxSemantics.Theorems.NoSyntacticExhaustion

**Theorem 53.2: No syntactic semantic exhaustion (Paper 53).**

In a diagonally capable reflexive system, no purely syntactic internal
structure can be semantically exhaustive over the full self-semantic family.

Proof: semantic exhaustion would induce a final self-theory (Theorem 53.1);
Paper 52 proves no final self-theory exists. Contradiction.
-/

set_option autoImplicit false

namespace SyntaxSemantics

universe u v

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)
variable [SemanticSelfReference.SemanticNegation F]
variable [SemanticSelfReference.SelfReferenceFrame F]

variable (S : SyntacticTheory F)

/--
**Theorem 53.2:** No syntactic semantic exhaustion.

Under diagonal capability (SelfRef + SemanticNegation + SelfReferenceFrame),
if the syntactic theory is self-scoped (yes-claim data for all codes) and
semantically exhaustive, we get contradiction.

The proof reduces to Paper 52's `direct_no_final_self_theory`.
-/
theorem no_syntactic_semantic_exhaustion
    (yesClaimFor : ∀ c : F.Code, SemanticSelfReference.YesClaimData F (inducedSelfTheory F S) c)
    (hRealized : S.internallyRealized)
    (hEx : SemanticExhaustive F S) :
    False := by
  have hFinal := semanticExhaustive_induces_final F S hRealized hEx
  exact SemanticSelfReference.direct_no_final_self_theory F (inducedSelfTheory F S) yesClaimFor hFinal

end SyntaxSemantics
