/-!
# GhostCollapse.Core.SemanticNullity

**Semantic nullity (Paper 61).**

An entity is semantically null if its assertion contributes no usable content
to the theory—the theory cannot distinguish "x exists" from no content at all
in any operational or semantic way. Stronger than explanatory inertness
(Paper 55): semantic nullity means complete theoretical irrelevance.
-/

set_option autoImplicit false

universe u

variable {Entity : Type u}
variable (SemanticNull : Entity → Prop)

namespace GhostCollapse

/--
**SemanticNull (x)** — Entity x contributes no usable content to the theory.

The theory cannot distinguish "x exists" from no content at all in any
operational or semantic way. Stronger than ExplanatorilyInert (Paper 55):
semantic nullity implies the entity is equivalent to nullity from the
theory's standpoint.
-/
def SemanticNullityDoc := True

end GhostCollapse
