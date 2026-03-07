import QualiaLedger.Core.QualiaAccess
import QualiaLedger.Core.LedgerRepresentation

/-!
# QualiaLedger.Theorems.KnownQualiaOnLedger

**Theorem 55.1: Known qualia are on-ledger (Paper 55).**

Re-exports and documents the flagship theorem from LedgerRepresentation.
-/

set_option autoImplicit false

namespace QualiaLedger

/--
**Theorem 55.1 (Known Qualia Ledger Theorem):** If a subject is aware of
qualitative content x, then x is ledger-represented.

This is the flagship theorem of Paper 55. The proof is definitional: we
define LedgerRepresented as ∃ S, AwareOfQuale(S,x). The substantive content
is that this is the right definition—awareness, report, discrimination,
memory, and self-modeling are ledger-level states.
-/
theorem known_qualia_on_ledger
    {W : Type*} {F : SemanticSelfDescription.SelfSemanticFrame W}
    {Subject : Type*} {AwareOfQuale : Subject → QualiaContent → Prop}
    (S : Subject) (x : QualiaContent) (h : AwareOfQuale S x) :
    LedgerRepresented F Subject AwareOfQuale x :=
  LedgerRepresentation.aware_implies_ledger_represented F Subject AwareOfQuale S x h

end QualiaLedger
