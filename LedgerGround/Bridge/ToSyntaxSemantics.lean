import SemanticSelfDescription.Core.SelfTheory
import SyntaxSemantics.Core.SyntacticTheory
import SyntaxSemantics.Theorems.NoSyntacticExhaustion

set_option autoImplicit false

namespace LedgerGround

open SyntaxSemantics

universe u v w

variable {Ledger : Type u} {Ground : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}
variable {GroundIsSyntax : Ground → Prop}

variable {W : Type w} (F : SemanticSelfDescription.SelfSemanticFrame W)
variable [SemanticSelfReference.SemanticNegation F]
variable [SemanticSelfReference.SelfReferenceFrame F]

/--
**Bridge hypothesis:** A syntactic ground g that ontologically grounds R
induces a semantically exhaustive syntactic theory over F.

This is the interpretation: "syntax grounding R's actuality" means
a syntactic theory would exhaust the semantics of the ledger.
-/
structure SyntacticGroundingInducesExhaustion (F : SemanticSelfDescription.SelfSemanticFrame W)
  (g : Ground) (R : Ledger) (hGround : OntologicalGround g R) (hSyntax : GroundIsSyntax g) where
  S : SyntacticTheory F
  hRealized : S.internallyRealized
  hExhaustive : SemanticExhaustive F S
  yesClaimFor : ∀ c : F.Code, SemanticSelfReference.YesClaimData F
    (inducedSelfTheory F S) c

/--
**Theorem (Paper 53 bridge):** Under the bridge hypothesis, syntactic
grounding yields contradiction. Derives from Paper 53's no_syntactic_semantic_exhaustion.
-/
theorem syntax_cannot_ground_from_paper53
  (g : Ground) (R : Ledger) (hGround : OntologicalGround g R) (hSyntax : GroundIsSyntax g)
  (hBridge : SyntacticGroundingInducesExhaustion F g R hGround hSyntax) :
  False := by
  obtain ⟨S, hRealized, hEx, yesClaimFor⟩ := hBridge
  exact no_syntactic_semantic_exhaustion F S yesClaimFor hRealized hEx

end LedgerGround
