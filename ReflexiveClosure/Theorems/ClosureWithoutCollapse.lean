import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.SelfTheory
import SemanticSelfReference.Core.SemanticNegation
import SemanticSelfReference.Core.SelfReferenceFrame
import SemanticSelfReference.Core.AntiVerdictClaims
import SemanticSelfReference.Theorems.DirectNoFinalSelfTheory
import SemanticSelfReference.Theorems.ObserverCorollary
import ReflexiveClosure.Core.SelfCoincidence
import ReflexiveClosure.Core.ImplicationLadder
import SyntaxSemantics.Core.SyntacticTheory
import SyntaxSemantics.Theorems.NoSyntacticExhaustion

/-!
# ReflexiveClosure.Theorems.ClosureWithoutCollapse

**Paper 56: The Reflexive Closure Theorem.**

A nontrivial reflexive system may close over itself, but cannot coincide
with its own complete internal semantic image. Unifies Papers 51–55.

The implication ladder (ImplicationLadder.lean) shows that syntactic
exhaustion, complete observer model, and final self-theory all imply
SelfCoinciding. Hence ¬SelfCoinciding is the master impossibility.
-/

set_option autoImplicit false

namespace ReflexiveClosure

universe u

open SemanticSelfDescription
open SemanticSelfReference

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)
variable [SemanticNegation F]
variable [SelfReferenceFrame F]

/--
**Theorem 56.1 (No self-coincidence):** Under diagonal capability, no
internal self-theory can be final. Therefore no reflexive system can
coincide with its own complete internal semantic image.

Proof: Direct from Paper 52's `direct_no_final_self_theory`.
-/
theorem no_self_coincidence
    (T : InternalSelfTheory F)
    (yesClaimFor : ∀ c : F.Code, YesClaimData F T c)
    (hCoincide : SelfCoinciding F T) :
    False :=
  direct_no_final_self_theory F T yesClaimFor hCoincide

/--
**Theorem 56.2 (Closure without collapse):** A reflexive system can close
over itself (return to itself, partial self-modeling) but cannot collapse
into self-coincidence. Any attempt at complete self-coincidence yields
contradiction.

Equivalent formulation: closure is possible; collapse is impossible.
-/
theorem closure_without_collapse
    (T : InternalSelfTheory F)
    (yesClaimFor : ∀ c : F.Code, YesClaimData F T c)
    (hCoincide : SelfCoinciding F T) :
    False :=
  no_self_coincidence F T yesClaimFor hCoincide

/--
**Corollary (Observer formulation):** No observer can be self-exhausting.
Immediate from Paper 54 via the same fixed-point barrier.
-/
theorem no_self_exhausting_observer_via_closure
    (O : ObserverSelfModel F)
    (yesClaimFor : ∀ c : F.Code, YesClaimData F O.selfModel c)
    (hComplete : CompleteObserverModel F O) :
    False :=
  no_self_exhausting_observer F O yesClaimFor hComplete

/--
**No self-coincidence via syntactic exhaustion.**

Syntactic exhaustion implies SelfCoinciding (ImplicationLadder); SelfCoinciding
yields contradiction. Hence syntactic exhaustion is impossible. This is
Paper 53's result, routed through the summit theorem.
-/
theorem no_self_coincidence_via_syntactic_exhaustion
    (S : SyntaxSemantics.SyntacticTheory F)
    (yesClaimFor : ∀ c : F.Code, YesClaimData F (SyntaxSemantics.inducedSelfTheory F S) c)
    (hRealized : S.internallyRealized)
    (hEx : SyntaxSemantics.SemanticExhaustive F S) :
    False := by
  have hCoincide := syntactic_exhaustion_implies_self_coinciding F S hRealized hEx
  exact no_self_coincidence F (SyntaxSemantics.inducedSelfTheory F S) yesClaimFor hCoincide

/--
**No self-coincidence via complete observer model.**

Complete observer model implies SelfCoinciding (ImplicationLadder); SelfCoinciding
yields contradiction. Hence no complete observer model. This is Paper 54's
result, routed through the summit theorem.
-/
theorem no_self_coincidence_via_complete_observer
    (O : ObserverSelfModel F)
    (yesClaimFor : ∀ c : F.Code, YesClaimData F O.selfModel c)
    (hComplete : CompleteObserverModel F O) :
    False :=
  no_self_exhausting_observer F O yesClaimFor hComplete

/--
**Irreducible reflexive distance under diagonal capability.**

Under diagonal capability (yes-claim data for all codes), no self-theory
is final. Hence IrreducibleReflexiveDistance holds. The reflexive distance
between system and complete self-image cannot be closed.
-/
theorem irreducible_reflexive_distance_under_diagonal
    (yesClaimFor : ∀ T : InternalSelfTheory F, ∀ c : F.Code, YesClaimData F T c) :
    IrreducibleReflexiveDistance F := by
  intro T hFinal
  have hCoincide : SelfCoinciding F T := hFinal
  exact no_self_coincidence F T (yesClaimFor T) hCoincide

end ReflexiveClosure
