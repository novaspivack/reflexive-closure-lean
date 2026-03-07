import UnifiedPresence.Core.ArticulationAspect
import UnifiedPresence.Bridge.ToRealityAsRecursiveIntelligence

/-!
# UnifiedPresence.Theorems.ArticulationAspect

**Paper 69.2: World-process is Alpha-grounded recursive articulation.**

The articulation aspect holds when nontrivial reflexive reality exists at
a frontier and the system is recursively intelligent. From Paper 60.
-/

set_option autoImplicit false

namespace UnifiedPresence

universe u

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

open RealityAsRecursiveIntelligence

/--
**Theorem 69.2:** When nontrivial reflexive reality exists at a frontier,
the articulation aspect holds.

World-process is Alpha-grounded recursive articulation. The bridge
(ToRealityAsRecursiveIntelligence) establishes the connection.
-/
theorem world_process_is_recursive_articulation (frontier : Set F.Claim)
  (R : NontrivialReflexiveReality F frontier) :
  ArticulationAspect F frontier :=
  articulation_aspect_from_recursive_intelligence F frontier R

end UnifiedPresence
