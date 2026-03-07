import AlphaNonNull.Core.Nullity
import GroundManifestation.Core.AlphaManifestation

/-!
# AlphaNonNull.Bridge.ToGroundManifestation

**Paper 68: Bridge from manifestation to non-sterility and non-inertness.**

Defines SemanticallySterile and Inert in terms of manifestation/grounding structure.
Proves 68.3 (manifestation ⇒ ¬SemanticallySterile) and 68.5 (¬Inert) from
existence of Alpha-manifestation.
-/

set_option autoImplicit false

namespace AlphaNonNull

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

open GroundManifestation

/--
**SemanticallySterile (α)** — α is incapable of underwriting presence, manifestation,
or semantic actuality. Formally: α grounds no Alpha-manifestation.
-/
def SemanticallySterile (α : Ground) : Prop :=
  ¬∃ (x : F.Claim) (R : Ledger),
    @AlphaManifestation Ledger Ground OntologicalGround LedgerActuality GroundIsSyntax
      GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
      SelfActualizingLedger W F Subject AwareOfQuale ContentOf x α R

/--
**Inert (α)** — α is a passive backdrop: does not actively ground any actual ledger.
Formally: ¬(∃ R, OntologicalGround α R ∧ LedgerActuality R).
Distinct from SemanticallySterile (which is about manifestation specifically).
-/
def Inert (α : Ground) : Prop :=
  ¬∃ R : Ledger, OntologicalGround α R ∧ LedgerActuality R

/--
**Theorem:** Alpha-manifestation implies α underwrites the ledger.
Derived from GroundMode: when x is an α-manifestation in R, GroundMode requires
GroundedInAlphaWitnessed x α R, yielding OntologicalGround α R ∧ LedgerActuality R.
See GroundManifestation.alpha_manifestation_implies_grounding.
-/
theorem manifestation_implies_grounding
  (x : F.Claim) (α : Ground) (R : Ledger)
  (h : @AlphaManifestation Ledger Ground OntologicalGround LedgerActuality GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger W F Subject AwareOfQuale ContentOf x α R) :
  OntologicalGround α R ∧ LedgerActuality R :=
  GroundManifestation.alpha_manifestation_implies_grounding F Subject AwareOfQuale ContentOf x α R h

/--
**Theorem 68.3:** Manifestation implies non-sterility.
If there exists an Alpha-manifestation for α, then α is not semantically sterile.
-/
theorem manifestation_implies_not_semantically_sterile (α : Ground)
  (hManifestation : ∃ (x : F.Claim) (R : Ledger),
    @AlphaManifestation Ledger Ground OntologicalGround LedgerActuality GroundIsSyntax
      GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
      SelfActualizingLedger W F Subject AwareOfQuale ContentOf x α R) :
  ¬@SemanticallySterile Ledger Ground OntologicalGround LedgerActuality GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger W F Subject AwareOfQuale ContentOf α :=
  fun hSterile => hSterile hManifestation

/--
**Theorem 68.5:** Alpha is not inert.
When manifestation exists for α, α actively grounds an actual ledger.
-/
theorem alpha_not_inert (α : Ground)
  (hManifestation : ∃ (x : F.Claim) (R : Ledger),
    @AlphaManifestation Ledger Ground OntologicalGround LedgerActuality GroundIsSyntax
      GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
      SelfActualizingLedger W F Subject AwareOfQuale ContentOf x α R) :
  ¬@Inert Ledger Ground OntologicalGround LedgerActuality α := by
  intro hInert
  obtain ⟨x, ⟨R, hAM⟩⟩ := hManifestation
  have ⟨hOG, hLA⟩ := manifestation_implies_grounding F Subject AwareOfQuale ContentOf x α R hAM
  exact hInert ⟨R, hOG, hLA⟩

end AlphaNonNull
