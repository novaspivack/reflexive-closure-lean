import AlphaNonNull.Core.ObjectEmpty
import AlphaNonNull.Core.Nullity
import AlphaNonNull.Core.SemanticSterility
import AlphaNonNull.Core.Inert
import GroundedExistence.Theorems.AlphaStructural

/-!
# AlphaNonNull.Theorems.AlphaNotNull

**Paper 68: Alpha Is Not Null — Theorems 68.1–68.5.**

Blocks the nihilistic interpretation of Alpha. Paper 68 is a refinement and
anti-misreading of Paper 64, using 66–67. Not a contradiction of 64.
-/

set_option autoImplicit false

universe u v

variable {Ledger : Type u} {Ground : Type v} {Entity : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}
variable (ContentOf : Entity → Ledger → Prop)
variable {LedgerActuality : Ledger → Prop}
variable {GroundIsSyntax : Ground → Prop}
variable {GroundIsObjectLevelSemantics : Ground → Prop}
variable {GroundIsExternalEqualStatus : Ground → Prop}
variable {GroundIsGhost : Ground → Prop}
variable {SelfActualizingLedger : Ledger → Prop}

namespace AlphaNonNull

open GroundedExistence

/--
**Theorem 68.1:** ObjectEmpty(α) ∧ ¬Null(α).

Alpha has no object-level content (object-empty) but is not null (not sheer
absence). From Paper 64: alpha_not_object_level gives ObjectEmpty;
alpha_not_null gives ¬Null.
-/
theorem object_empty_and_not_null (α : Ground) (R : Ledger)
  (hTerm : @AlphaTerminus Ledger Ground OntologicalGround GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger α R) :
  @ObjectEmpty Ground GroundIsSyntax GroundIsObjectLevelSemantics α ∧
  ¬@Null Ledger Ground OntologicalGround α :=
  ⟨fun hOL => alpha_not_object_level α R hTerm hOL,
   fun hNull => alpha_not_null α R hTerm hNull⟩

/--
**Theorem 68.2:** ObjectEmpty(α) ⇏ Null(α).

Object-empty does not imply null. From 68.1: we have α with ObjectEmpty ∧ ¬Null,
hence ObjectEmpty cannot imply Null.
-/
theorem object_empty_not_implies_null (α : Ground) (R : Ledger)
  (hTerm : @AlphaTerminus Ledger Ground OntologicalGround GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger α R) :
  ¬(@ObjectEmpty Ground GroundIsSyntax GroundIsObjectLevelSemantics α →
    @Null Ledger Ground OntologicalGround α) :=
  fun h => alpha_not_null α R hTerm (h (fun hOL => alpha_not_object_level α R hTerm hOL))

end AlphaNonNull
