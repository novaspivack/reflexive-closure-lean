import QualiaLedger.Core.LedgerRepresentation
import QualiaLedger.Core.DeterminacyRelevance

/-!
# GhostCollapse.Bridge.ToQualiaLedger

**Bridge to Paper 55 (Qualia and the Semantic Ledger).**

Paper 61 generalizes the off-ledger analysis from qualia (Paper 55) to any
entity. When we specialize to qualia content:

- OffLedger ↔ QualiaOutsideLedger
- DeterminacyRelevant ↔ DeterminacyRelevant (same notion, generalized)
- SemanticNull ⇒ ExplanatorilyInert (semantic nullity is stronger)

Theorem 55.3 (off-ledger qualia: inert or illicit) is the qualia-specific
instance of the ghost collapse theorem (61.3). The QualiaLedger development
uses the same no-free-bits axiom for the determinacy-relevant case.

## Specialization

For Entity := QualiaContent F:
- OffLedger := QualiaOutsideLedger
- DeterminacyRelevant := DeterminacyRelevant (from QualiaLedger)
- SemanticNull := ExplanatorilyInert (weaker; SemanticNull implies ExplanatorilyInert)

The ghost collapse theorem 61.3 specializes to Theorem 55.3.
-/
