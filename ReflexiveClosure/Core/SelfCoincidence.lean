import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.SelfTheory

/-!
# ReflexiveClosure.Core.SelfCoincidence

**Self-coincidence (Paper 56).**

SelfCoinciding is the **master impossibility class**: the umbrella notion
that subsumes final self-theory, syntactic semantic exhaustion, complete
observer self-exhaustion, and qualia-as-syntactic-exhaustion. A reflexive
system is self-coinciding iff it coincides with its own complete internal
semantic image. Paper 52 proves no such state exists under diagonal capability.

The implication ladder (ImplicationLadder.lean) shows that each collapse form
implies SelfCoinciding; hence ¬SelfCoinciding unifies all earlier results.
-/

set_option autoImplicit false

namespace ReflexiveClosure

universe u

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
**SelfCoinciding (F, T)** — The internal self-theory T would make the system
self-coinciding: T is total and exact on the full self-semantic family.

This is the base definition. The master impossibility class subsumes:
- Final self-theory (direct)
- Syntactic semantic exhaustion (induces final theory, Paper 53)
- Complete observer model (is final theory, Paper 54)
- Qualia treated as purely syntactic exhaustion (Paper 55)

A self-coinciding system would have no reflexive distance—its internal
self-image would exhaust its realized semantic truth.
-/
def SelfCoinciding (T : SemanticSelfDescription.InternalSelfTheory F) : Prop :=
  SemanticSelfDescription.FinalSelfTheory T

/--
**IrreducibleReflexiveDistance** — No internal self-theory is final.

The gap between the system and its complete internal self-image cannot
be closed. Under diagonal capability, this is a theorem (Paper 52).

Theorem content: IrreducibleReflexiveDistance is equivalent to
∀ T, ¬SelfCoinciding(F, T). It implies semantic remainder (Paper 53):
no syntactic structure can exhaust realized semantic truth.
-/
def IrreducibleReflexiveDistance : Prop :=
  ∀ T : SemanticSelfDescription.InternalSelfTheory F,
    ¬ SemanticSelfDescription.FinalSelfTheory T

/--
**No self-coincidence implies irreducible reflexive distance.**

If no internal self-theory is final, then the reflexive distance
is irreducible. Under diagonal capability, the antecedent holds (Paper 52),
hence the consequent holds.
-/
theorem no_self_coincidence_implies_irreducible_reflexive_distance
    (h : ∀ T : SemanticSelfDescription.InternalSelfTheory F,
        ¬ SelfCoinciding F T) :
    IrreducibleReflexiveDistance F :=
  h

/--
**Irreducible reflexive distance implies no self-coincidence.**

The converse: if reflexive distance is irreducible, then no
self-theory is self-coinciding.
-/
theorem irreducible_reflexive_distance_implies_no_self_coincidence
    (h : IrreducibleReflexiveDistance F)
    (T : SemanticSelfDescription.InternalSelfTheory F) :
    ¬ SelfCoinciding F T :=
  h T

end ReflexiveClosure
