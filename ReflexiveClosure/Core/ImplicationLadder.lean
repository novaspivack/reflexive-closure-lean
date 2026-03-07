/-!
# ReflexiveClosure.Core.ImplicationLadder

**Implication ladder: collapse forms ⇒ SelfCoinciding (Paper 56).**

SelfCoinciding is the master impossibility class. These theorems show that
various collapse forms from Papers 51–55 all imply SelfCoinciding. Hence
the summit theorem (¬SelfCoinciding) unifies all earlier impossibilities.

- SyntacticExhaustive ⇒ SelfCoinciding (via induced final theory)
- CompleteObserverModel ⇒ SelfCoinciding (observer self-model = internal theory)
- Qualia-as-syntax exhaustion would also imply SelfCoinciding (Paper 55)
-/

import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.SelfTheory
import SemanticSelfReference.Theorems.ObserverCorollary
import SyntaxSemantics.Core.SyntacticTheory
import ReflexiveClosure.Core.SelfCoincidence

set_option autoImplicit false

namespace ReflexiveClosure

universe u

open SemanticSelfDescription
open SemanticSelfReference
open SyntaxSemantics

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
**Complete observer model ⇒ SelfCoinciding.**

A complete observer self-model is total and exact on the full self-semantic
family—i.e., it is a final internal self-theory. Hence it implies SelfCoinciding.
-/
theorem complete_observer_model_implies_self_coinciding
    (O : ObserverSelfModel F) (hComplete : CompleteObserverModel F O) :
    SelfCoinciding F O.selfModel :=
  hComplete

/--
**Syntactic semantic exhaustion ⇒ SelfCoinciding.**

If a syntactic theory is semantically exhaustive and internally realized,
the induced internal self-theory is final (Paper 53, Theorem 53.1). Hence
syntactic exhaustion implies SelfCoinciding.
-/
theorem syntactic_exhaustion_implies_self_coinciding
    (S : SyntacticTheory F)
    (hRealized : S.internallyRealized)
    (hEx : SemanticExhaustive F S) :
    SelfCoinciding F (inducedSelfTheory F S) :=
  semanticExhaustive_induces_final F S hRealized hEx

/--
**Final self-theory ⇒ SelfCoinciding.**

The base case: a final internal self-theory is the direct instantiation
of SelfCoinciding.
-/
theorem final_self_theory_implies_self_coinciding
    (T : InternalSelfTheory F) (hFinal : FinalSelfTheory T) :
    SelfCoinciding F T :=
  hFinal

end ReflexiveClosure
