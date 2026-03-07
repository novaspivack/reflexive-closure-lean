import ReflexiveUnfolding.Core.Frontier
import ReflexiveUnfolding.Core.TerminalCompletion
import ReflexiveUnfolding.Theorems.NoTerminalCompletion
import RefinementFlow.Core.RefinementFlow
import RecordEntropy.Theorems.Monotonicity
import RefinementFlow.Core.RefinementFlow
import RecordEntropy.Theorems.Monotonicity
import RefinementFlow.Core.RefinementFlow
import RecordEntropy.Theorems.Monotonicity
import RefinementFlow.Core.RefinementFlow
import RecordEntropy.Theorems.Monotonicity
import RefinementFlow.Core.RefinementFlow
import RecordEntropy.Theorems.Monotonicity

/-!
# ReflexiveUnfolding.Bridge.ToRefinementFlow

**Conceptual bridge from Paper 57 to Papers 41–42.**

Paper 41 (RefinementFlow) defines world-type refinement over time: `forgetFromTo`,
coherence, naturality. Paper 42 (RecordEntropy) proves record entropy monotonicity
(`recordEntropy_monotone`) and strict growth under refinement (`recordEntropy_strict`).

**Conceptual connection:** Reflexive remainder (Paper 56) prevents terminal refinement
collapse. When semantic remainder exists, no frontier can be final—hence the refinement
flow has no globally closed endpoint. Record entropy monotonicity is a manifestation
of non-halting unfolding: new distinguishability (new frontier) corresponds to
strict entropy growth when refinement is strict.

A full formal bridge would require a structure that is both a SelfSemanticFrame
(Paper 51) and carries a RecordFiltration (Paper 36), with a compatibility condition
linking articulated frontier growth to record-stage refinement. This module documents
the conceptual link; the formal compatibility is left for future work.
-/
