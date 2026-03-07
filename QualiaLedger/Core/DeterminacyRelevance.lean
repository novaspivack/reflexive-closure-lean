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

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)
variable (Subject : Type v)
variable (AwareOfQuale : Subject → QualiaContent → Prop)

/--
**DeterminacyRelevant (x)** — Qualitative content x affects determinacy-relevant
system structure: reports, memory, behavior, discrimination, self-models, or
other truth-relevant structure.

If x is off-ledger but determinacy-relevant, it would constitute a "free bit"
that affects outcomes without being represented—violating no-free-bits (Paper 27).
-/
variable (DeterminacyRelevant : QualiaContent → Prop)

/--
**ExplanatorilyInert (x)** — Qualitative content x makes no difference to any
formally accounted-for system structure.

Off-ledger qualia that are not determinacy-relevant are inert: they do no
explanatory work. They are the "ghost branch" left over after the known-qualia
argument—formally irrelevant.
-/
def ExplanatorilyInert (x : QualiaContent) : Prop :=
  ¬ DeterminacyRelevant x

/--
**No-free-bits for off-ledger determinacy (Paper 27 bridge):** If qualia are
off-ledger and determinacy-relevant, contradiction. Off-ledger content that
affects reports, memory, behavior, etc. would be a "free bit" not represented
in the ledger—violating the internality requirement of Paper 27.
-/
axiom off_ledger_determinacy_illicit
    (x : QualiaContent)
    (hOutside : QualiaOutsideLedger x)
    (hDet : DeterminacyRelevant x) : False

/--
**Theorem 55.3 (Off-ledger qualia: inert or illicit):** If qualia are not
ledger-represented, then either they are determinacy-relevant (hence illicit
by no-free-bits) or they are not determinacy-relevant (hence explanatorily inert).
-/
theorem off_ledger_inert_or_illicit
    (x : QualiaContent)
    (hOutside : QualiaOutsideLedger x) :
    (DeterminacyRelevant x → False) ∨ ExplanatorilyInert x := by
  by_cases h : DeterminacyRelevant x
  · left
    exact fun hD => off_ledger_determinacy_illicit x hOutside hD
  · right
    exact h

end QualiaLedger
