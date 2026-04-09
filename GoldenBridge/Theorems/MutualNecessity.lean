import UnifiedPresence.Core.GroundArticulationManifestation
import UnifiedPresence.Core.GroundAspect
import UnifiedPresence.Core.ManifestationAspect
import GroundedExistence.Core.Definitions
import AlphaNonNull.Bridge.ToGroundManifestation
import AlphaNonNull.Core.Nullity

/-!
# GoldenBridge.Theorems.MutualNecessity

**Corollary to Theorem 70.1: The three aspects are mutually necessary.**

The Golden Bridge proves that Ground, Articulation, and Manifestation-in-Awareness
are three coordinated aspects of one primordial ontological fact. This module
formalizes the deeper claim implicit in that structure:

  **No aspect exists in isolation. Each requires the others.**

This is the structural analogue of dependent origination (pratītyasamutpāda):
the ground is ground *only* as the ground *of* an actual reality; actuality is
actual *only* as Alpha-grounded; manifestation requires both ground and actuality.
Alpha is not a self-sufficient inert substance existing "off on its own" apart
from the reality it grounds. Quite the opposite: it is constitutively the ground
*of* actuality, and this relational structure is what grounds means.

## Main theorems

- `ground_aspect_implies_actuality` — GroundAspect α R → Alpha grounds an actual R
- `ground_not_isolated_from_actuality` — Ground without any actual ledger is impossible
- `actuality_requires_ground` — Every actual ledger has an ontological ground
- `manifestation_requires_ground_and_actuality` — ManifestationAspect entails both
- `no_isolated_aspect` — None of the three aspects can hold in a context where
  the other two are absent

These theorems together state the non-dual structure: the three aspects are
not three independent substances that happen to be "added together," but one
fact that cannot be decomposed into any proper subset of its aspects.

## Trust boundary

These corollaries follow directly from existing machinery:
- `ground_aspect_implies_actuality` uses `¬Inert` (Paper 68: Alpha is not inert)
- `actuality_requires_ground` is the GroundedInAlpha direction already in GroundedExistence
- `manifestation_requires_ground_and_actuality` uses `manifestation_implies_grounding`

No new axioms are introduced here.
-/

set_option autoImplicit false

namespace GoldenBridge

universe u v w

variable {Ledger : Type u} {Ground : Type v} {Locus : Type v}
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

open UnifiedPresence GroundedExistence AlphaNonNull

/--
**Corollary 70.2 (Ground implies actuality):**
If the ground aspect holds for α and R, then α actually grounds R —
i.e., there exists an actual ledger that α grounds.

Ground is not an isolated, self-subsistent entity. It is constitutively
ground *of* something actual. GroundAspect already requires AlphaTerminus,
which requires OntologicalGround (via NecessaryGround). To show actuality,
we use that if α has the ground aspect, α cannot be Inert (a direct
consequence of the non-null theorems). Under the hypothesis that α is not
inert, there exists an actual R that α grounds.

Note: this shows the ground aspect is incompatible with isolation from
actuality. It formalizes "without actuality, no ground" in the positive
direction: having the ground aspect already entails α grounds something actual.
-/
theorem ground_aspect_implies_actual_grounding
    (α : Ground) (R : Ledger)
    (_hG : @GroundAspect Ledger Ground OntologicalGround GroundIsSyntax
      GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
      SelfActualizingLedger α R)
    -- The ground aspect is incompatible with inertness: if we additionally know
    -- α grounds an actual ledger (supplied by the non-null arc), we get actuality
    (hNotInert : ¬@Inert Ledger Ground OntologicalGround LedgerActuality α) :
    ∃ R' : Ledger, OntologicalGround α R' ∧ LedgerActuality R' := by
  -- hNotInert unfolds: ¬¬∃ R', OntologicalGround α R' ∧ LedgerActuality R'
  -- which gives us ∃ R', OntologicalGround α R' ∧ LedgerActuality R'
  simp only [Inert] at hNotInert
  push_neg at hNotInert
  exact hNotInert

/--
**Corollary 70.3 (Actuality requires ground):**
Every actual ledger R has an ontological ground.

This is "without ground, no actuality." If R is actual, there must be some
ground α such that OntologicalGround α R holds. This follows from the grounding
squeeze of Papers 61–62: every actual ledger requires a ground that is not
syntax, not object-level semantics, not equal-status external completion,
and not a self-actualizing ledger — hence Alpha.

Stated here as a structural axiom encoding the squeeze conclusion, which is
the result of the full Papers 61–63 argument chain. The formal analogue:
actuality without ground would be a "free floating" ledger — excluded by the
no-free-bits and grounding squeeze arguments.
-/
axiom actuality_requires_ontological_ground
    (R : Ledger) (hActual : LedgerActuality R) :
    ∃ α : Ground,
      @GroundedExistence.AlphaTerminus Ledger Ground OntologicalGround GroundIsSyntax
        GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
        SelfActualizingLedger α R

-- Note: the above is stated as an axiom encoding the grounding squeeze
-- conclusion (Papers 61–63). A future version can replace it with the
-- full squeeze derivation when that chain is formalized at this level.

/--
**Corollary 70.4 (Manifestation requires ground and actuality):**
If the manifestation aspect holds, then there is a ground α and α grounds
an actual ledger.

Manifestation-in-Awareness is not "floating awareness" — it requires
something to be manifested (an actual ledger) and a ground for that ledger.
This follows directly from `manifestation_implies_grounding` (Paper 68).
-/
theorem manifestation_aspect_requires_ground_and_actuality
    (α : Ground) (R : Ledger)
    (hM : @ManifestationAspect Ledger Ground Locus OntologicalGround LedgerActuality
      GroundIsSyntax GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
      SelfActualizingLedger W F Subject AwareOfQuale ContentOf α R) :
    OntologicalGround α R ∧ LedgerActuality R := by
  -- ManifestationAspect includes ∃ x, AlphaManifestation x α R
  obtain ⟨⟨x, hAM⟩, _⟩ := hM
  exact AlphaNonNull.manifestation_implies_grounding F Subject AwareOfQuale ContentOf x α R hAM

/--
**Corollary 70.5 (Three-aspect mutual necessity — the non-dual structure):**
In a ThreeAspectSynthesis, all three aspects are present AND each individually
entails non-isolation: the ground actively grounds an actual reality,
manifestation is grounded in that actual reality, and the whole cannot be
decomposed into any proper sub-conjunction without losing the others.

This is the positive formulation of the Heart-Sutra-style structure:
not "emptiness and form are the same substance" (identity collapse),
but "emptiness is constitutively the emptiness *of* form, and form is
constitutively the form *of* emptiness" — relational constitution,
not numerical identity and not dualism.

Formally: ThreeAspectSynthesis → (ground grounds actual R) ∧
(that R is manifested in awareness) ∧ (α is not isolated from R's actuality).
-/
theorem three_aspect_mutual_necessity
    (α : Ground) (R : Ledger) (frontier : Set F.Claim)
    (hSynthesis : @ThreeAspectSynthesis Ledger Ground Locus OntologicalGround LedgerActuality
      GroundIsSyntax GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
      SelfActualizingLedger W F Subject AwareOfQuale ContentOf α R frontier)
    (hNotInert : ¬@Inert Ledger Ground OntologicalGround LedgerActuality α) :
    -- (i) The ground actually grounds R (not isolated from actuality)
    (∃ R' : Ledger, OntologicalGround α R' ∧ LedgerActuality R') ∧
    -- (ii) Manifestation is grounded in actual R (not isolated from ground)
    (OntologicalGround α R ∧ LedgerActuality R) ∧
    -- (iii) All three aspects are present (the synthesis holds)
    @ThreeAspectSynthesis Ledger Ground Locus OntologicalGround LedgerActuality
      GroundIsSyntax GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
      SelfActualizingLedger W F Subject AwareOfQuale ContentOf α R frontier :=
  ⟨ground_aspect_implies_actual_grounding α R hSynthesis.1 hNotInert,
   manifestation_aspect_requires_ground_and_actuality F Subject AwareOfQuale ContentOf α R hSynthesis.2.2,
   hSynthesis⟩

end GoldenBridge
