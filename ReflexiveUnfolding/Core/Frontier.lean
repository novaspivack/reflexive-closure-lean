import Mathlib.Data.Set.Basic
import SemanticSelfDescription.Core.Claims

/-!
# ReflexiveUnfolding.Core.Frontier

**Frontier and articulation (Paper 57).**

A frontier is a new semantic boundary—content not previously articulated.
Articulation is the process that produces new semantic content. Every
articulation generates new frontier; hence reflexive unfolding cannot halt.
-/

set_option autoImplicit false

namespace ReflexiveUnfolding

universe u

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
**Frontier** — A new semantic boundary; claims or content not previously
articulated in the system's formal account. The frontier is the "edge"
of what has been brought into articulated form.
-/
def Frontier : Type := F.Claim

/--
**Articulation** — The process of producing new articulated semantic content.
When a system articulates, it extends the boundary of what is formally
represented; hence it generates new frontier.
-/
def Articulates (oldFrontier : Set F.Claim) (newClaim : F.Claim) : Prop :=
  newClaim ∉ oldFrontier

/--
**SelfArticulating** — The system has the capacity to produce new articulated
content. Formally: there exists a claim not yet in the current frontier.
-/
def SelfArticulating (currentFrontier : Set F.Claim) : Prop :=
  ∃ c : F.Claim, c ∉ currentFrontier

end ReflexiveUnfolding
