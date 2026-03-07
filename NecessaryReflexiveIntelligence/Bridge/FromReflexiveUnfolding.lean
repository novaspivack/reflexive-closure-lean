import NecessaryReflexiveIntelligence.Core.MinimalReflexiveIntelligence
import ReflexiveUnfolding.Core.Frontier
import ReflexiveUnfolding.Core.TerminalCompletion
import ReflexiveUnfolding.Theorems.NoTerminalCompletion

/-!
# NecessaryReflexiveIntelligence.Bridge.FromReflexiveUnfolding

**Bridge from Paper 57: Frontier sensitivity.**

When semantic remainder exists, the system is self-articulating (frontier-sensitive).
Paper 57 establishes that under diagonal capability, no terminal reflexive
completion—hence frontier sensitivity holds for any theory-induced frontier
with remainder.
-/

set_option autoImplicit false

namespace NecessaryReflexiveIntelligence

universe u

open ReflexiveUnfolding
open SemanticSelfDescription

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
**Semantic remainder implies frontier sensitivity.**

When there is semantic content not in the frontier, the system can
articulate it—hence it is frontier-sensitive (self-articulating).
-/
theorem remainder_implies_frontier_sensitive
    (frontier : Set F.Claim)
    (hRem : SemanticRemainder F frontier) :
    FrontierSensitive F frontier := by
  unfold FrontierSensitive
  unfold ReflexiveUnfolding.SelfArticulating
  unfold SemanticRemainder at hRem
  obtain ⟨c, _, hNotIn⟩ := hRem
  exact ⟨c, hNotIn⟩

/--
**No terminal completion implies frontier sensitivity for remainder frontiers.**

Under the conditions of Paper 57, when remainder exists we have no terminal
completion; the system remains frontier-sensitive.
-/
theorem no_terminal_implies_frontier_sensitive
    (frontier : Set F.Claim)
    (hRem : SemanticRemainder F frontier) :
    FrontierSensitive F frontier :=
  remainder_implies_frontier_sensitive F frontier hRem

end NecessaryReflexiveIntelligence
