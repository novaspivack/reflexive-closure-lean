import QualiaLedger.Core.LedgerRepresentation
import QualiaLedger.Core.DeterminacyRelevance

/-!
# QualiaLedger.Theorems.OffLedgerQualia

**Theorems 55.2 and 55.3: Off-ledger qualia (Paper 55).**

- Theorem 55.2: Off-ledger but known qualia are impossible.
- Theorem 55.3: Off-ledger qualia are either inert or illicit.
-/

set_option autoImplicit false

namespace QualiaLedger

universe u v

/--
**Theorem 55.2:** Off-ledger but known qualia are impossible.

If qualia are off-ledger (¬LedgerRepresented) but some subject is aware of
them, we have contradiction.
-/
theorem off_ledger_known_impossible
    {W : Type u} {F : SemanticSelfDescription.SelfSemanticFrame W}
    {Subject : Type v} {AwareOfQuale : Subject → QualiaContent → Prop}
    (x : QualiaContent)
    (hOutside : QualiaOutsideLedger F Subject AwareOfQuale x)
    (S : Subject) (hAware : AwareOfQuale S x) :
    False :=
  LedgerRepresentation.off_ledger_known_impossible F Subject AwareOfQuale x hOutside S hAware

end QualiaLedger
