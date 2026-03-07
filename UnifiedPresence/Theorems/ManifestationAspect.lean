import UnifiedPresence.Core.ManifestationAspect
import UnifiedPresence.Bridge.ToGroundManifestation

/-!
# UnifiedPresence.Theorems.ManifestationAspect

**Paper 69.3: Qualia and awareness are Alpha-grounded manifestation/presence.**

The manifestation aspect holds when Alpha-manifestation exists and there
is an awareness locus of Alpha-presence. From Papers 66, 67.
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
**Theorem 69.3:** When Alpha-manifestation exists and there exists an
awareness locus of Alpha-presence, the manifestation aspect holds.

Qualia and awareness are Alpha-grounded manifestation/presence.
-/
theorem qualia_and_awareness_are_manifestation (α : Ground) (R : Ledger)
  (hManifestation : ∃ x : F.Claim,
    @GroundManifestation.AlphaManifestation Ledger Ground OntologicalGround LedgerActuality
      GroundIsSyntax GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
      SelfActualizingLedger W F Subject AwareOfQuale ContentOf x α R)
  (hLocus : ∃ A : Locus, AwarenessGround.AwarenessLocus A ∧
    AwarenessGround.LocusOfAlphaPresence F
      (fun x => @GroundManifestation.AlphaManifestation Ledger Ground OntologicalGround
        LedgerActuality GroundIsSyntax GroundIsObjectLevelSemantics GroundIsExternalEqualStatus
        GroundIsGhost SelfActualizingLedger W F Subject AwareOfQuale ContentOf x α R) A) :
  @UnifiedPresence.ManifestationAspect Ledger Ground Locus OntologicalGround LedgerActuality
    GroundIsSyntax GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger W F Subject AwareOfQuale ContentOf α R :=
  manifestation_aspect_from_awareness_locus F Subject AwareOfQuale ContentOf α R hManifestation hLocus

end UnifiedPresence
