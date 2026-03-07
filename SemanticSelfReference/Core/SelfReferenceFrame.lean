import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.SelfTheory
import SemanticSelfReference.Core.SemanticNegation

/-!
# SemanticSelfReference.Core.SelfReferenceFrame

**Code-level self-reference interface for fixed-point construction (Paper 52).**

An interface on the code space sufficient to produce fixed points for
claim transformers built from "T says yes on code c" and semantic negation.

Can bridge to SelfReference.SRI or use a specialized local interface
(quote, repr, decode, fixed-point laws).
-/

set_option autoImplicit false

namespace SemanticSelfReference

universe u v

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
A **self-reference frame** extends a self-semantic frame with
code-level machinery for fixed-point construction.

We need:
- `quote` : Code → Code (or similar) to form self-referential codes
- Sufficient laws to construct fixed points for anti-verdict claim transformers

For Paper 52, the minimal interface: given a claim transformer
φ : Code → Claim, we need to produce a code d such that decode(d) ≃ φ(d).

This can be bridged to SelfReference.SRI when Code = Claim and we have
the standard quote/run/repr interface.
-/
class SelfReferenceFrame [SemanticNegation F] where
  /-- For any claim transformer f : Code → Claim, there exists a fixed-point code -/
  fixedPointExists :
    ∀ f : F.Code → F.Claim,
    ∃ d : F.Code, F.ClaimEquiv (F.decode d) (f d)

end SemanticSelfReference
