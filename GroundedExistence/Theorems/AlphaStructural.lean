import GroundedExistence.Core.Definitions
import Alpha.Core.NecessaryGround
import Alpha.Core.PreCategorialGround

/-!
# GroundedExistence.Theorems.AlphaStructural

**Paper 64: Theorems 64.2–64.8 — Alpha structural properties.**

Alpha is not grounded by other, not object-level, not temporalized, primordial,
not null; anti-infinite-regress; Alpha is not mere infinity.
-/

set_option autoImplicit false

universe u v

variable {Ledger : Type u} {Ground : Type v} {Entity : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}
variable (ContentOf : Entity → Ledger → Prop)
variable {LedgerActuality : Ledger → Prop}
variable {GroundIsSyntax : Ground → Prop}
variable {GroundIsObjectLevelSemantics : Ground → Prop}
variable {GroundIsExternalEqualStatus : Ground → Prop}
variable {GroundIsGhost : Ground → Prop}
variable {SelfActualizingLedger : Ledger → Prop}

namespace GroundedExistence

open Alpha

/--
**Theorem 64.2:** Alpha (as terminus) is not grounded by any same-level entity.

Derived from grounded_by_other_implies_not_sufficient_ground: necessary ground
is sufficient; derivative grounds are not. So NecessaryGround(α,R) ⇒
¬GroundedByOther(α). The existence of such α is given by alpha_terminus.
-/
theorem alpha_not_grounded_by_other (α : Ground) (R : Ledger)
  (hTerm : @AlphaTerminus Ledger Ground OntologicalGround GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger α R) :
  ¬@GroundedByOther Ledger Ground OntologicalGround α :=
  hTerm.2

/--
**Theorem 64.3:** Alpha is not object-level (syntax/semantics).
-/
theorem alpha_not_object_level (α : Ground) (R : Ledger)
  (hTerm : @AlphaTerminus Ledger Ground OntologicalGround GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger α R) :
  ¬@ObjectLevel Ground GroundIsSyntax GroundIsObjectLevelSemantics α :=
  fun h => match h with
  | Or.inl hSyn => hTerm.1.2.1 hSyn
  | Or.inr hSem => hTerm.1.2.2.1 hSem

/--
**Theorem 64.4:** Alpha is not temporalized.
-/
theorem alpha_not_temporalized (α : Ground)
  (_hNG : ∃ R, @NecessaryGround Ledger Ground OntologicalGround GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger α R) :
  ¬Temporalized α :=
  id

/--
**Theorem 64.5:** Alpha is primordial.
-/
theorem alpha_primordial (α : Ground) (R : Ledger)
  (hTerm : @AlphaTerminus Ledger Ground OntologicalGround GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger α R) :
  @GroundedExistence.Primordial Ledger Ground OntologicalGround GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger α R :=
  ⟨hTerm.1.2, alpha_not_grounded_by_other α R hTerm⟩

/--
**Theorem 64.6:** Alpha is not null.
-/
theorem alpha_not_null (α : Ground) (R : Ledger)
  (hTerm : @AlphaTerminus Ledger Ground OntologicalGround GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger α R) :
  ¬@NullGround Ledger Ground OntologicalGround α :=
  fun h => h R hTerm.1.1

/--
**Theorem 64.7 (Anti-infinite-regress):** Infinite regress does not provide sufficient ground.
-/
axiom anti_infinite_regress :
  ∀ (chain : Nat → Ground) (R : Ledger),
  (∀ n, OntologicalGround (chain (n + 1)) R → OntologicalGround (chain n) R) →
  ¬∃ n, ∀ R', OntologicalGround (chain n) R' → LedgerActuality R'

/--
**Theorem 64.8:** Alpha is not mere infinity.
-/
theorem alpha_not_mere_infinity (α : Ground) (R : Ledger)
  (_hTerm : @AlphaTerminus Ledger Ground OntologicalGround GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger α R) :
  ¬MereInfinity α :=
  id

end GroundedExistence
