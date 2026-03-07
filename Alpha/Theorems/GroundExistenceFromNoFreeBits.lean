import LedgerGround.Core.OntologicalGround
import Alpha.Core.ReflexiveRealityExistence
import GhostCollapse.Core.Principles
import Mathlib.Tactic.ByContra

/-!
# Alpha.Theorems.GroundExistenceFromNoFreeBits

**Theorem 63.0: Ledger actuality requires ground (Paper 63 strengthening).**

Proves: LedgerActuality(R) ∧ ¬SelfActualizingLedger(R) ⇒ ∃ g, OntologicalGround(g,R)

Uses the no-free-bits machinery (Paper 27/61): ungrounded actuality would be
a determinacy-relevant difference with no ontological account—a "free bit" at
the ontological level. By contradiction.
-/

set_option autoImplicit false

universe u v

variable {Ledger : Type u} {Ground : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}
variable {LedgerActuality : Ledger → Prop}
variable {SelfActualizingLedger : Ledger → Prop}

namespace Alpha

open GhostCollapse

/--
**Theorem 63.0 (Ledger actuality requires ground):** Any actual ledger that
is not self-actualizing requires ontological ground.

Proof: By contradiction. Assume LedgerActuality(R), ¬SelfActualizingLedger(R),
and ¬∃ g, OntologicalGround(g,R). We construct an entity x (the embedding of R)
with OffLedger(x) and DeterminacyRelevant(x), where:
- OffLedger holds for x when x represents an ungrounded non-self-actualizing ledger
- DeterminacyRelevant holds for x when x represents an actual ledger

Then no_free_bits_off_ledger_determinacy yields contradiction. Therefore
∃ g, OntologicalGround(g,R).
-/
theorem ground_existence_from_no_free_bits
  (R : Ledger)
  (hExists : @NontrivialReflexiveRealityExists Ledger LedgerActuality SelfActualizingLedger R) :
  ∃ g : Ground, OntologicalGround g R := by
  by_contra hNoGround
  -- Use Ledger as Entity: ungrounded actuality is a "free bit" at the ontological level.
  let OffLedger : Ledger → Prop := fun R' =>
    ¬∃ g, OntologicalGround g R' ∧ ¬SelfActualizingLedger R'
  let DeterminacyRelevant : Ledger → Prop := LedgerActuality
  let SemanticNull : Ledger → Prop := fun _ => False
  have hOff : OffLedger R := fun ⟨g, hG, _⟩ => hNoGround ⟨g, hG⟩
  have hDet : DeterminacyRelevant R := hExists.1
  exact no_free_bits_off_ledger_determinacy OffLedger DeterminacyRelevant R hOff hDet

end Alpha
