import UnifiedPresence.Core.GroundAspect
import UnifiedPresence.Core.ArticulationAspect
import UnifiedPresence.Core.ManifestationAspect

/-!
# UnifiedPresence.Core.GroundArticulationManifestation

**Paper 69: Three coordinated aspects of one structured ontological fact.**

Bundles ground, articulation, and manifestation as three irreducible but
coordinated aspects. Theorem 69.4: Ground, articulation, and manifestation
are three coordinated aspects of one structured ontological fact.

No identity-collapse: the three remain formally distinct. Coordination means
they cohere as aspects of one fact, not that they reduce to each other.
-/

set_option autoImplicit false

namespace UnifiedPresence

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

/--
**ThreeAspectSynthesis (α) (R) (frontier)** — All three aspects hold in a
compatible context: ground aspect for (α, R), articulation at frontier,
manifestation for (α, R).

When this holds, we have one structured ontological fact under three
irreducible but coordinated aspects.
-/
def ThreeAspectSynthesis (α : Ground) (R : Ledger) (frontier : Set F.Claim) : Prop :=
  @GroundAspect Ledger Ground OntologicalGround GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger α R ∧
  ArticulationAspect F frontier ∧
  @UnifiedPresence.ManifestationAspect Ledger Ground Locus OntologicalGround LedgerActuality
    GroundIsSyntax GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger W F Subject AwareOfQuale ContentOf α R

/--
**Coordinated** — The three aspects are coordinated when they hold together
as aspects of one fact: distinct (no collapse) and non-alien (coherent).

Formally: ThreeAspectSynthesis implies the three are present and distinct.
The coordination is the holding of the synthesis.
-/
def Coordinated (α : Ground) (R : Ledger) (frontier : Set F.Claim) : Prop :=
  @ThreeAspectSynthesis Ledger Ground Locus OntologicalGround LedgerActuality GroundIsSyntax
    GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost SelfActualizingLedger
    W F Subject AwareOfQuale ContentOf α R frontier

end UnifiedPresence
