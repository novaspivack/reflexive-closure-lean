import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.SelfTheory
import QualiaLedger.Core.QualiaAccess
import QualiaLedger.Core.LedgerRepresentation
import SyntaxSemantics.Core.SyntacticTheory
import SyntaxSemantics.Theorems.NoSyntacticExhaustion

/-!
# QualiaLedger.Bridge.ToSyntaxSemantics

**Bridge to Paper 53: Syntax Cannot Exhaust Semantics.**

If qualia are represented in the ledger as purely syntactic content, the account
collapses into the forbidden syntax-exhausts-semantics regime of Paper 53.

Theorem 55.4: LedgerRepresented(x) ∧ PurelySyntacticQualiaEncoding → ⊥

We define PurelySyntacticQualiaEncoding as the existence of a semantically
exhaustive syntactic theory. Paper 53 proves no such theory exists.
-/

set_option autoImplicit false

namespace QualiaLedger

universe u v

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)
variable [SemanticSelfReference.SemanticNegation F]
variable [SemanticSelfReference.SelfReferenceFrame F]
variable (Subject : Type v)
variable (AwareOfQuale : Subject → F.Claim → Prop)

/--
**Purely syntactic qualia encoding**: qualia would be represented only as
syntax/structure—no irreducible semantic content.

We formalize this as: there exists a semantically exhaustive syntactic theory.
Such a theory would encode all semantic content (including qualia) purely
syntactically. Paper 53 proves no such theory exists.
-/
def PurelySyntacticQualiaEncoding : Prop :=
  ∃ S : SyntaxSemantics.SyntacticTheory F,
    S.internallyRealized ∧ SyntaxSemantics.SemanticExhaustive F S

/--
**Theorem 55.4:** On-ledger qualia cannot be merely syntactic.

If there existed a purely syntactic encoding (semantically exhaustive syntactic
theory), we get contradiction via Paper 53.
-/
theorem on_ledger_qualia_not_purely_syntactic
    (hSyn : PurelySyntacticQualiaEncoding F)
    (yesClaimFor : ∀ S : SyntaxSemantics.SyntacticTheory F,
      S.internallyRealized → SyntaxSemantics.SemanticExhaustive F S →
      ∀ c : F.Code, SemanticSelfReference.YesClaimData F
        (SyntaxSemantics.inducedSelfTheory F S) c) :
    False := by
  obtain ⟨S, hRealized, hEx⟩ := hSyn
  exact SyntaxSemantics.no_syntactic_semantic_exhaustion F S
    (yesClaimFor S hRealized hEx) hRealized hEx

end QualiaLedger
