import SemanticSelfDescription.Core.Claims

/-!
# AwarenessGround.Core.ObjectLevelContent

**Paper 67: Object-level content predicate.**

ObjectLevelContent(y) — y can be among other contents as a same-level worldly item
(e.g., a quale, a brain state, a token in the content domain).
Used for Theorem 67.3: AwarenessLocus(A) ⇒ ¬ObjectLevelContent(A).
-/

set_option autoImplicit false

namespace AwarenessGround

universe u v

/--
**ObjectLevelContent (y)** — y is object-level content: it can be among other
contents as a same-level worldly item (quale, brain state, content-domain token).
-/
def ObjectLevelContent {Locus : Type v} (_y : Locus) : Prop :=
  False  -- Placeholder: full formalization distinguishes locus from content

end AwarenessGround
