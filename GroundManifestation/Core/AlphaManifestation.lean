import GroundManifestation.Core.PhenomenalPresence
import GroundManifestation.Core.GroundMode

/-!
# GroundManifestation.Core.AlphaManifestation

**Paper 66: Alpha-manifestation — ground-mode with phenomenal presence.**

AlphaManifestation(x) := GroundMode(x,α) ∧ PhenomenalPresence(x).

Since GroundMode already includes PhenomenalPresence, this definition makes explicit
that manifestation has phenomenal presence built into its type. Theorem 66.4
(definitional consequence): AlphaManifestation(x) ⇒ PhenomenalPresence(x).
-/

set_option autoImplicit false

namespace GroundManifestation

universe u v w

variable {Ledger : Type u} {Ground : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}
variable {LedgerActuality : Ledger → Prop}
variable {GroundIsSyntax : Ground → Prop}
variable {GroundIsObjectLevelSemantics : Ground → Prop}
variable {GroundIsExternalEqualStatus : Ground → Prop}
variable {GroundIsGhost : Ground → Prop}
variable {SelfActualizingLedger : Ledger → Prop}

variable {W : Type w} (F : SemanticSelfDescription.SelfSemanticFrame W)
variable (Subject : Type v)
variable (AwareOfQuale : Subject → F.Claim → Prop)
variable (ContentOf : F.Claim → Ledger → Prop)

/--
**AlphaManifestation (x) (α) (R)** — Content x is an Alpha-manifestation when
it is in ground-mode with phenomenal presence.

Definition: GroundMode(x,α,R) ∧ PhenomenalPresence(x).
Makes explicit that manifestation has phenomenal presence built into its type.
-/
def AlphaManifestation (x : F.Claim) (α : Ground) (R : Ledger) : Prop :=
  @GroundMode Ledger Ground OntologicalGround LedgerActuality GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger W F Subject AwareOfQuale ContentOf x α R ∧
  PhenomenalPresence F Subject AwareOfQuale x

/--
**Theorem 66.4 (definitional consequence):** Alpha-manifestation implies
phenomenal presence. Immediate from the definition.
-/
theorem alpha_manifestation_implies_phenomenal_presence
  (x : F.Claim) (α : Ground) (R : Ledger)
  (h : @AlphaManifestation Ledger Ground OntologicalGround LedgerActuality GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger W F Subject AwareOfQuale ContentOf x α R) :
  PhenomenalPresence F Subject AwareOfQuale x :=
  h.2

/--
**Theorem (Paper 68):** Alpha-manifestation implies α grounds R and R is actual.
Derived from GroundMode: AlphaManifestation gives GroundMode, which requires
GroundedInAlphaWitnessed x α R, yielding NecessaryGround α R ∧ LedgerActuality R.
-/
theorem alpha_manifestation_implies_grounding
  (x : F.Claim) (α : Ground) (R : Ledger)
  (h : @AlphaManifestation Ledger Ground OntologicalGround LedgerActuality GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger W F Subject AwareOfQuale ContentOf x α R) :
  OntologicalGround α R ∧ LedgerActuality R := by
  have hGM := h.1
  have hWit := hGM.2.1
  exact ⟨hWit.1.1, hWit.2.2⟩

end GroundManifestation
