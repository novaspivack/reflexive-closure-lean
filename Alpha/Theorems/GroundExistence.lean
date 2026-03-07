import LedgerGround.Core.OntologicalGround
import LedgerGround.Core.GroundCategories
import Alpha.Core.ReflexiveRealityExistence
import Alpha.Theorems.GroundExistenceFromNoFreeBits

/-!
# Alpha.Theorems.GroundExistence

**Theorem 63.2: Ground existence (Paper 63).**

If nontrivial reflexive reality exists, then some ontological ground must exist.
The ledger cannot ground itself (Paper 62); therefore some ground g must
ontologically ground R.

**Theorem 63.0** (GroundExistenceFromNoFreeBits) proves this from the no-free-bits
machinery: ungrounded actuality would be a determinacy-relevant "free bit" at
the ontological level. No ground_necessity axiom.
-/

set_option autoImplicit false

universe u v

variable {Ledger : Type u} {Ground : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}
variable {LedgerActuality : Ledger → Prop}
variable {SelfActualizingLedger : Ledger → Prop}

namespace Alpha

/--
**Theorem 63.2 (Ground existence):** If nontrivial reflexive reality exists,
some ontological ground must exist.

Proved from Theorem 63.0 (ledger actuality requires ground), which derives
from the no-free-bits machinery (Paper 27/61): actual-but-ungrounded-and-not-
self-actualizing ledger would violate the anti-free-bits pattern.
-/
theorem ground_existence_thm
  (R : Ledger)
  (hExists : @NontrivialReflexiveRealityExists Ledger LedgerActuality SelfActualizingLedger R) :
  ∃ g : Ground, OntologicalGround g R :=
  ground_existence_from_no_free_bits R hExists

end Alpha
