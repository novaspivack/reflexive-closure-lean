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

/--
**Theorem 55.2:** Off-ledger but known qualia are impossible.

If qualia are off-ledger (¬LedgerRepresented) but some subject is aware of
them, we have contradiction.
-/
theorem off_ledger_known_impossible
    {W : Type*} {F : SemanticSelfDescription.SelfSemanticFrame W}
    {Subject : Type*} {AwareOfQuale : Subject → QualiaContent → Prop}
    (x : QualiaContent)
    (hOutside : QualiaOutsideLedger F Subject AwareOfQuale x)
    (S : Subject) (hAware : AwareOfQuale S x) :
    False :=
  LedgerRepresentation.off_ledger_known_impossible F Subject AwareOfQuale x hOutside S hAware

/--
**Theorem 55.3:** Off-ledger qualia are either inert or illicit.

If qualia are not ledger-represented, then either they are determinacy-relevant
(hence illicit by no-free-bits) or they are not determinacy-relevant (hence
explanatorily inert).
-/
theorem off_ledger_inert_or_illicit
    {W : Type*} {F : SemanticSelfDescription.SelfSemanticFrame W}
    {Subject : Type*} {AwareOfQuale : Subject → QualiaContent → Prop}
    {DeterminacyRelevant : QualiaContent → Prop}
    (x : QualiaContent)
    (hOutside : QualiaOutsideLedger F Subject AwareOfQuale x) :
    (DeterminacyRelevant x → False) ∨ DeterminacyRelevance.ExplanatorilyInert DeterminacyRelevant x :=
  DeterminacyRelevance.off_ledger_inert_or_illicit F Subject AwareOfQuale DeterminacyRelevant x hOutside

end QualiaLedger
