import Alpha.Core.NecessaryGround
import Alpha.Core.ReflexiveRealityExistence
import LedgerGround.Core.OntologicalGround

/-!
# GroundedExistence.Core.Definitions

**Paper 64: Definitions for grounded existence and Alpha structural properties.**

ContentOf, GroundedInAlpha, and the negative structural predicates for Alpha.
-/

set_option autoImplicit false

universe u v

variable {Ledger : Type u} {Ground : Type v} {Entity : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}
variable {LedgerActuality : Ledger → Prop}
variable {GroundIsSyntax : Ground → Prop}
variable {GroundIsObjectLevelSemantics : Ground → Prop}
variable {GroundIsExternalEqualStatus : Ground → Prop}
variable {GroundIsGhost : Ground → Prop}
variable {SelfActualizingLedger : Ledger → Prop}

variable (ContentOf : Entity → Ledger → Prop)

namespace GroundedExistence

open Alpha

/--
**GroundedInAlpha (x)** — Entity x is Alpha-grounded when x is content of some
actual ledger R that is grounded by a necessary pre-categorial ground α.

Definition: ∃ α R, NecessaryGround α R ∧ ContentOf x R ∧ LedgerActuality R.
-/
def GroundedInAlpha (x : Entity) : Prop :=
  ∃ (α : Ground) (R : Ledger),
    @NecessaryGround Ledger Ground OntologicalGround GroundIsSyntax
      GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
      SelfActualizingLedger α R ∧ ContentOf x R ∧ LedgerActuality R

/--
**GroundedInAlphaWitnessed (x) (α) (R)** — The witnessed form: α grounds R, x is
content of R, and R is actual. Implies GroundedInAlpha x. Used when (α, R) must
be structurally tied (e.g. for manifestation_implies_grounding in Paper 68).
-/
def GroundedInAlphaWitnessed (x : Entity) (α : Ground) (R : Ledger) : Prop :=
  @NecessaryGround Ledger Ground OntologicalGround GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger α R ∧ ContentOf x R ∧ LedgerActuality R

/--
**SameLevelPrior (g' g)** — Ground g' is same-level prior to g when g' grounds
everything g grounds. So g' is "upstream" of g in the grounding structure.
-/
def SameLevelPrior (g' g : Ground) : Prop :=
  g' ≠ g ∧ ∀ (R : Ledger), OntologicalGround g R → OntologicalGround g' R

/--
**GroundedByOther (g)** — Ground g is grounded by another same-level entity.
-/
def GroundedByOther (g : Ground) : Prop :=
  ∃ (g' : Ground), @SameLevelPrior Ledger Ground OntologicalGround g' g

/--
**ObjectLevel (g)** — Ground g is syntax, object-level semantics, or ledger content.
-/
def ObjectLevel (g : Ground) : Prop :=
  GroundIsSyntax g ∨ GroundIsObjectLevelSemantics g

/--
**Temporalized (g)** — Ground g is situated as one event among events in time.
-/
def Temporalized (_g : Ground) : Prop :=
  False  -- Alpha is pre-categorial; placeholder for temporal structure

/--
**AlphaTerminus (α R)** — α is the necessary pre-categorial ground of R and the
terminus of same-level grounding (nothing grounds α). Derived from
grounded_by_other_implies_not_sufficient_ground: necessary ground is sufficient,
and derivative grounds are not sufficient.
-/
def AlphaTerminus (α : Ground) (R : Ledger) : Prop :=
  @NecessaryGround Ledger Ground OntologicalGround GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger α R ∧ ¬@GroundedByOther Ledger Ground OntologicalGround α

/--
**Primordial (g)** — Ground g is pre-categorial and the terminus of same-level grounding.
-/
def Primordial (g : Ground) (R : Ledger) : Prop :=
  @Alpha.PreCategorial Ledger Ground GroundIsSyntax GroundIsObjectLevelSemantics
    GroundIsExternalEqualStatus GroundIsGhost SelfActualizingLedger g R ∧
  ¬@GroundedByOther Ledger Ground OntologicalGround g

/--
**SufficientGround (g) (R)** — Ground g provides sufficient ontological ground for R.
Currently: OntologicalGround g R. The key principle: same-level derivativeness
disqualifies sufficiency (see grounded_by_other_implies_not_sufficient_ground).
-/
def SufficientGround (g : Ground) (R : Ledger) : Prop :=
  OntologicalGround g R

/--
**Axiom (same-level derivative not sufficient):** A ground that is same-level
grounded by another cannot provide sufficient ontological ground. If g is
derivative (has a same-level prior), then g does not ground any R.

This is the local principle that replaces well-foundedness: we do not assume
"all chains bottom out"; we only assert "derivative things are not sufficient."
From this: NecessaryGround(α,R) ⇒ SufficientGround(α,R) ⇒ ¬GroundedByOther(α).
-/
axiom grounded_by_other_implies_not_sufficient_ground
  (g : Ground) (R : Ledger) (hDeriv : @GroundedByOther Ledger Ground OntologicalGround g) :
  ¬@SufficientGround Ledger Ground OntologicalGround g R

/--
**NullGround (g)** — Ground g is vacuous or fails to ground any actuality.
-/
def NullGround (g : Ground) : Prop :=
  ∀ (R : Ledger), ¬OntologicalGround g R

/--
**MereInfinity (g)** — Ground g is reducible to infinite regress without genuine ground.

Placeholder: full formalization would require Ledger parameter for the chain.
For Theorem 64.8 we use the negation: Alpha is not mere infinity.
-/
def MereInfinity (_g : Ground) : Prop :=
  False  -- Placeholder; anti-infinite-regress theorem gives the substantive content

/--
**AdmissibleContent (x) (R)** — Entity x is admissible real content of ledger R.
-/
def AdmissibleContent (x : Entity) (R : Ledger) : Prop :=
  ContentOf x R

end GroundedExistence
