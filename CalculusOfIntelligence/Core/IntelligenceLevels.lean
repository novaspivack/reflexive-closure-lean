import NecessaryReflexiveIntelligence.Core.ChooserHierarchy
import NecessaryReflexiveIntelligence.Core.MinimalReflexiveIntelligence
import ReflexiveUnfolding.Core.Frontier
import ReflexiveUnfolding.Core.TerminalCompletion

/-!
# CalculusOfIntelligence.Core.IntelligenceLevels

**Intelligence levels (Paper 59).**

Intelligence levels coincide with the chooser hierarchy (Paper 58): level 0
(no choice) through level 4 (frontier-sensitive). Nontrivial intelligence
requires a live frontier—without frontier, there is no frontier-sensitive
adjudication, hence no minimal reflexive intelligence.
-/

set_option autoImplicit false

namespace CalculusOfIntelligence

universe u

open ReflexiveUnfolding
open SemanticSelfDescription

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
**IntelligenceLevel** — Alias for ChooserLevel. Intelligence in the
structural sense (Paper 58) is chooserhood over live frontier; the levels
are the same.
-/
abbrev IntelligenceLevel := NecessaryReflexiveIntelligence.ChooserLevel

/--
**NontrivialIntelligence** — The system exhibits at least minimal reflexive
intelligence at the given frontier. This requires frontier sensitivity
(self-articulating), hence a live frontier.
-/
def NontrivialIntelligence (frontier : Set F.Claim) : Prop :=
  Nonempty (NecessaryReflexiveIntelligence.MinimalReflexiveIntelligence F frontier)

/--
**Theorem 59.1 (No intelligence without frontier):** When a frontier has
reached terminal reflexive completion (no new frontier can be generated),
the system cannot exhibit minimal reflexive intelligence at that frontier.

Proof: MinimalReflexiveIntelligence requires FrontierSensitive, which
equals SelfArticulating. TerminalReflexiveCompletion is ¬SelfArticulating.
Hence the two are contradictory.
-/
theorem no_intelligence_without_frontier
    (frontier : Set F.Claim)
    (hTerm : TerminalReflexiveCompletion F frontier)
    (mri : NecessaryReflexiveIntelligence.MinimalReflexiveIntelligence F frontier) :
    False :=
  hTerm mri.frontier_sensitive

/--
**Corollary 59.2:** Terminal completion implies no nontrivial intelligence.
-/
theorem terminal_implies_no_nontrivial_intelligence
    (frontier : Set F.Claim)
    (hTerm : TerminalReflexiveCompletion F frontier) :
    ¬ NontrivialIntelligence F frontier := by
  intro ⟨mri⟩
  exact no_intelligence_without_frontier F frontier hTerm mri

/--
**Live frontier implies frontier-sensitive.** When semantic remainder exists,
the system is self-articulating (Paper 57). So "live frontier" (remainder)
is the precondition for frontier-sensitive intelligence.
-/
theorem live_frontier_iff_self_articulating (frontier : Set F.Claim) :
    SemanticRemainder F frontier → SelfArticulating F frontier := by
  intro hRem
  obtain ⟨c, _, hNotIn⟩ := hRem
  exact ⟨c, hNotIn⟩

/--
**Theorem 59.2 (Frontier-bearing admits levels):** When a frontier has semantic
remainder and the system has irreducible reflexive distance plus adjudicative
execution (from Paper 58), the system exhibits nontrivial intelligence at that
frontier. Frontier-bearing is the precondition for positive intelligence
level attainment.

Formally: remainder + frontier_sensitive (from remainder) + self_model_bearing
+ adjudicative_level ⇒ NontrivialIntelligence. The key step is that remainder
implies frontier_sensitive (live_frontier_iff_self_articulating).
-/
theorem frontier_bearing_admits_intelligence
    (frontier : Set F.Claim)
    (hRem : SemanticRemainder F frontier)
    (hIrr : ReflexiveClosure.IrreducibleReflexiveDistance F)
    (level : NecessaryReflexiveIntelligence.ChooserLevel)
    (hLevel : NecessaryReflexiveIntelligence.AdjudicativeLevel level) :
    NontrivialIntelligence F frontier := by
  have hFS := live_frontier_iff_self_articulating F frontier hRem
  exact ⟨{
    adjudicative := level
    adjudicative_level := hLevel
    frontier_sensitive := hFS
    self_model_bearing := hIrr
  }⟩

end CalculusOfIntelligence
