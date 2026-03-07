import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.SelfTheory

/-!
# SyntaxSemantics.Core.SyntacticTheory

**Syntactic theory-objects (Paper 53).**

A syntactic theory is an internal structure with code-level operation
(verdict, derivability, symbolic closure) and no primitive semantic truth
field. Any connection to semantics is established by definition or theorem,
not built into the interface.
-/

set_option autoImplicit false

namespace SyntaxSemantics

universe u v

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

open SemanticSelfDescription

/--
A **syntactic theory** over a self-semantic frame.

- `verdict` : code-level operation mapping codes to verdicts (yes/no/abstain)
- `syntacticallyClosed` : closed under its own rule system or code-level operation
- `internallyRealized` : definable/realized within the world's representational resources

Key: no primitive `RealizedTrue` or semantic truth field. The structure is
purely syntactic in its interface; semantics enters only via adequacy predicates.

**Design rule (semantic blindness):** The `SyntacticTheory` structure mentions
only codes, verdicts, and syntactic closure. `RealizedTrue` appears strictly in
external predicates (`SemanticallyAdequate`, `SemanticExhaustive`), never in the
structure itself. This formal separation is essential for the theorem's bite.
-/
structure SyntacticTheory where
  verdict            : F.Code → Verdict
  syntacticallyClosed : Prop
  internallyRealized  : Prop

/--
A syntactic theory is **syntactically closed** if it is closed under its own
rule system. (Exposed as a class for use in theorem statements.)
-/
def SyntacticallyClosed (S : SyntacticTheory F) : Prop :=
  S.syntacticallyClosed

/--
**Semantically adequate**: whenever the syntactic theory assigns a verdict
to a code, that verdict matches realized semantic truth of the decoded claim.

Verdicts align with `RealizedTrue(decode(c))` wherever the theory commits.
-/
def SemanticallyAdequate (S : SyntacticTheory F) : Prop :=
  ∀ code : F.Code,
    match S.verdict code with
    | Verdict.yes     => F.RealizedTrue (F.decode code)
    | Verdict.no      => ¬ F.RealizedTrue (F.decode code)
    | Verdict.abstain => True

/--
**Semantically exhaustive**: total and exact on the full self-semantic family.

- Total: assigns a verdict to every code (no abstain)
- Exact: verdicts match realized semantic truth everywhere

This is the dangerous property we rule out: a syntactic structure that would
"do the job" of a final self-theory.
-/
def SemanticExhaustive (F : SemanticSelfDescription.SelfSemanticFrame W) (S : SyntacticTheory F) : Prop :=
  (∀ code : F.Code, S.verdict code ≠ Verdict.abstain) ∧
  (∀ code : F.Code,
    (S.verdict code = Verdict.yes ↔ F.RealizedTrue (F.decode code)) ∧
    (S.verdict code = Verdict.no  ↔ ¬ F.RealizedTrue (F.decode code)))

/--
A semantically exhaustive syntactic theory induces an internal self-theory
with the same verdict function. The induced theory is total and exact.
-/
def inducedSelfTheory (S : SyntacticTheory F) : InternalSelfTheory F where
  verdict := S.verdict
  internallyRealized := S.internallyRealized

/--
**Theorem 53.1 (Reduction lemma):** If a syntactic theory is semantically
exhaustive and internally realized, then the induced internal self-theory is final.
-/
theorem semanticExhaustive_induces_final
    (S : SyntacticTheory F) (hRealized : S.internallyRealized) (hEx : SemanticExhaustive F S) :
    FinalSelfTheory (inducedSelfTheory F S) := by
  obtain ⟨hTotal, hExact⟩ := hEx
  constructor
  · exact hRealized
  · constructor
    · intro code
      exact hTotal code
    · exact hExact

end SyntaxSemantics
