import QualiaLedger.Core.QualiaAccess
import QualiaLedger.Core.LedgerRepresentation
import QualiaLedger.Core.DeterminacyRelevance
import QualiaLedger.Bridge.ToSyntaxSemantics
import QualiaLedger.Theorems.KnownQualiaOnLedger
import QualiaLedger.Theorems.OffLedgerQualia
import QualiaLedger.Theorems.QualiaLedgerTheorem
import QualiaLedger.Theorems.HardProblemCategoryError

/-!
# QualiaLedger — Paper 55: Qualia and the Semantic Ledger

**Known qualia must be on-ledger; on-ledger qualia cannot be merely syntactic;
hence qualia are irreducible semantic ledger content.**

Paper 55 formalizes a sharp resolution of the hard problem: if qualia are known
by a subject (reported, discriminated, remembered, self-modeled), they must be
represented in the semantic ledger. Off-ledger qualia either contradict (when
determinacy-relevant) or are explanatorily inert. On-ledger qualia cannot be
reduced to purely syntactic structure (Paper 53). The hard problem, framed as
demanding syntax/computation alone to generate qualia from outside the ledger,
is category-mistaken.

## Key definitions

- `AwareOfQuale`, `LedgerRepresented`, `QualiaOutsideLedger`
- `DeterminacyRelevant`, `ExplanatorilyInert`
- `PurelySyntacticQualiaEncoding`, `SemanticQualiaEncoding`

## Key theorems

- `aware_implies_ledger_represented` — Theorem 55.1 (Known qualia are on-ledger)
- `off_ledger_known_impossible` — Theorem 55.2
- `off_ledger_inert_or_illicit` — Theorem 55.3
- `on_ledger_qualia_not_purely_syntactic` — Theorem 55.4 (Bridge to Paper 53)
- `known_qualia_irreducible_semantic` — Theorem 55.5 (Main theorem)
- `hard_problem_category_error` — Corollary 55.6

## Dependencies

- nems-lean SemanticSelfDescription (Paper 51)
- reflexive-closure-lean SemanticSelfReference (Paper 52)
- reflexive-closure-lean SyntaxSemantics (Paper 53)
-/
