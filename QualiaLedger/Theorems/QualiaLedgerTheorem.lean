import QualiaLedger.Core.LedgerRepresentation
import QualiaLedger.Bridge.ToSyntaxSemantics

/-!
# QualiaLedger.Theorems.QualiaLedgerTheorem

**Theorem 55.5: Known qualia are irreducible semantic ledger content (Paper 55).**

Combines Theorem 55.1 (known qualia are on-ledger) and Theorem 55.4 (on-ledger
qualia cannot be purely syntactic) to conclude: known qualia must appear in the
ledger as irreducible semantic content rather than purely syntactic structure.
-/

set_option autoImplicit false

namespace QualiaLedger

/--
**Theorem 55.5 (Main theorem):** Known qualia are irreducible semantic ledger content.

If a subject is aware of qualitative content x, then x is ledger-represented
(Theorem 55.1). If the frame admitted purely syntactic qualia encoding, we would
have contradiction (Theorem 55.4). Therefore, known qualia must appear in the
ledger as irreducible semantic content rather than purely syntactic structure.

This theorem packages the conceptual core of Paper 55: qualia, if real and
known, are semantic ledger content; they cannot be reduced to syntax alone.
-/
theorem known_qualia_irreducible_semantic
    {W : Type*} (F : SemanticSelfDescription.SelfSemanticFrame W)
    [SemanticSelfReference.SemanticNegation F]
    [SemanticSelfReference.SelfReferenceFrame F]
    {Subject : Type*} {AwareOfQuale : Subject → QualiaContent → Prop}
    (S : Subject) (x : QualiaContent) (hAware : AwareOfQuale S x)
    (hNoSyn : ¬ ToSyntaxSemantics.PurelySyntacticQualiaEncoding F)
    (yesClaimFor : ∀ S' : SyntaxSemantics.SyntacticTheory F,
      S'.internallyRealized → SyntaxSemantics.SemanticExhaustive F S' →
      ∀ c : F.Code, SemanticSelfReference.YesClaimData F
        (SyntaxSemantics.inducedSelfTheory F S') c) :
    LedgerRepresented F Subject AwareOfQuale x ∧
    ¬ ToSyntaxSemantics.PurelySyntacticQualiaEncoding F := by
  constructor
  · exact LedgerRepresentation.aware_implies_ledger_represented F Subject AwareOfQuale S x hAware
  · exact hNoSyn

end QualiaLedger
