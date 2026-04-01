import SemanticSelfDescription.Core.Claims
import ReflexiveClosure.Core.RepresentationFrame
import ReflexiveUnfolding.Core.TerminalCompletion

/-!
# ReflexiveUnfolding.Bridge.StructuredForgetting

**Bridge:** Paper 57 `SemanticRemainder` coincides with `ReflexiveClosure.RepSemanticRemainder`
specialized to `F.RealizedTrue`. This is definitional—it wires the minimal representation
interface to the reflexive unfolding vocabulary without new axioms.
-/

set_option autoImplicit false

namespace ReflexiveUnfolding

universe u

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

theorem semantic_remainder_eq_rep_semantic_remainder (fr : Set F.Claim) :
    SemanticRemainder F fr = ReflexiveClosure.RepSemanticRemainder F.RealizedTrue fr :=
  rfl

theorem semantic_remainder_iff_rep_semantic_remainder (fr : Set F.Claim) :
    SemanticRemainder F fr ↔ ReflexiveClosure.RepSemanticRemainder F.RealizedTrue fr :=
  Iff.rfl

end ReflexiveUnfolding
