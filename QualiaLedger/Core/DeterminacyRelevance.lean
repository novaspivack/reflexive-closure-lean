import SemanticSelfDescription.Core.Claims
import QualiaLedger.Core.QualiaAccess
import QualiaLedger.Core.LedgerRepresentation

/-!
# QualiaLedger.Core.DeterminacyRelevance

**Determinacy relevance and explanatory inertness (Paper 55).**

Theorem 55.3: Off-ledger qualia are either inert or illicit. If qualia are
not ledger-represented, then either (a) they are determinacy-relevant, in
which case they violate no-free-bits/internality (illicit), or (b) they are
not determinacy-relevant, in which case they are explanatorily inert.
-/

set_option autoImplicit false

namespace QualiaLedger

universe u v

variable {W : Type u} {F : SemanticSelfDescription.SelfSemanticFrame W}
variable {Subject : Type v}
variable {AwareOfQuale : Subject → F.Claim → Prop}
variable {DeterminacyRelevant : F.Claim → Prop}

/--
**ExplanatorilyInert (x)** — Qualitative content x makes no difference to any
formally accounted-for system structure.

Off-ledger qualia that are not determinacy-relevant are inert: they do no
explanatory work.
-/
def ExplanatorilyInert (x : F.Claim) : Prop :=
  ¬ DeterminacyRelevant x

/--
**No-free-bits for off-ledger determinacy (Paper 27 bridge):** If qualia are
off-ledger and determinacy-relevant, contradiction.
-/
axiom off_ledger_determinacy_illicit
    (x : F.Claim)
    (hOutside : QualiaOutsideLedger F Subject AwareOfQuale x)
    (hDet : DeterminacyRelevant x) : False

/--
**Theorem 55.3 (Off-ledger qualia: inert or illicit):** If qualia are not
ledger-represented, then either they are determinacy-relevant (hence illicit
by no-free-bits) or they are not determinacy-relevant (hence explanatorily inert).
-/
theorem off_ledger_inert_or_illicit
    (x : F.Claim)
    (hOutside : QualiaOutsideLedger F Subject AwareOfQuale x) :
    (DeterminacyRelevant x → False) ∨ ExplanatorilyInert x := by
  by_cases h : DeterminacyRelevant x
  · left
    exact fun hD => off_ledger_determinacy_illicit x hOutside hD
  · right
    exact h

end QualiaLedger
