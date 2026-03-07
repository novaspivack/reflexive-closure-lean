import CalculusOfIntelligence.Core.IntelligenceLevels
import SemanticSelfDescription.Core.Claims
import ReflexiveClosure.Core.SelfCoincidence
import NecessaryReflexiveIntelligence.Core.MinimalReflexiveIntelligence

/-!
# CalculusOfIntelligence.Core.SelfModelDepth

**Self-model depth (Paper 59).**

A graded notion of self-modeling. Depth 0: no irreducible reflexive distance
(the system would be self-coinciding—excluded by Paper 56). Depth ≥ 1: irreducible
reflexive distance holds; the system bears a self-model that cannot exhaust
its complete internal semantic image.
-/

set_option autoImplicit false

namespace CalculusOfIntelligence

universe u

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
**SelfModelDepth** — A level of self-modeling capacity.
- Depth 0: Would require self-coincidence (excluded under diagonal capability).
- Depth 1: Irreducible reflexive distance; minimal self-model-bearing.
- Depth 2+: Stratified self-modeling (deeper layers of self-reference).
-/
inductive SelfModelDepth where
  | zero : SelfModelDepth  -- Excluded when diagonal-capable
  | one  : SelfModelDepth  -- Irreducible reflexive distance
  | succ : SelfModelDepth → SelfModelDepth

/--
**HasDepth** — The system has at least the given self-model depth.
Depth 1 means IrreducibleReflexiveDistance (Paper 56).
-/
def HasDepth : SelfModelDepth → Prop
  | .zero => True  -- Trivial; depth 0 is "no requirement"
  | .one  => ReflexiveClosure.IrreducibleReflexiveDistance F
  | .succ _ => ReflexiveClosure.IrreducibleReflexiveDistance F

/--
**Theorem 59.4a:** Minimal reflexive intelligence implies depth ≥ 1.

A system with minimal reflexive intelligence is self-model-bearing, hence
has irreducible reflexive distance (depth 1).
-/
theorem minimal_intelligence_implies_depth_one
    (frontier : Set F.Claim)
    (mri : NecessaryReflexiveIntelligence.MinimalReflexiveIntelligence F frontier) :
    HasDepth F .one :=
  mri.self_model_bearing

/--
**Theorem 59.4b (Self-model depth constrains attainable level):** Without
irreducible reflexive distance (depth ≥ 1), the system cannot exhibit
minimal reflexive intelligence at any frontier. Self-model depth constrains
attainable intelligence level: nonzero depth is necessary for level 2+.
-/
theorem self_model_depth_constrains_attainable_level
    (frontier : Set F.Claim)
    (h : ¬ ReflexiveClosure.IrreducibleReflexiveDistance F) :
    ¬ NontrivialIntelligence F frontier := by
  intro ⟨mri⟩
  exact h mri.self_model_bearing

end CalculusOfIntelligence
