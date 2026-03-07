import SemanticSelfDescription.Core.Claims
import ReflexiveUnfolding.Core.Frontier
import ReflexiveUnfolding.Core.TerminalCompletion

/-!
# ReflexiveUnfolding.Core.ArticulativeStructure

**Articulative closure structure (Paper 57).**

A structural property that makes semantic remainder *generative* rather than
static residue. The system has the capacity to extend its frontier when
remainder exists—not by definition, but by virtue of its closure structure
(decoding, code formation, self-reference). This is the nontrivial bridge
from "there remains something" to "articulation can continue."
-/

set_option autoImplicit false

namespace ReflexiveUnfolding

universe u

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
**ArticulativeClosureStructure** — The system has structural capacity to
articulate realized content into its frontier.

When semantic remainder exists (∃ c, RealizedTrue c ∧ c ∉ frontier), the
system's closure structure (codes, decoding, self-reference) permits
admissible further articulation. The remainder is *generative*: it can
be brought into articulated form. This is not definitional—it requires
the system to have decoding, code-formation, and the capacity to extend
its representational boundary. Paper 51's self-semantic frame provides
this structure.
-/
class ArticulativeClosureStructure where
  /-- When remainder exists, admissible articulation exists: the system
  can extend its frontier with realized content. -/
  remainder_generative :
    ∀ frontier : Set F.Claim,
    SemanticRemainder F frontier →
    SelfArticulating F frontier

end ReflexiveUnfolding
