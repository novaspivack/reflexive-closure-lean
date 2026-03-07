import UnifiedPresence.Core.ManifestationAspect
import GroundManifestation.Core.AlphaManifestation
import AwarenessGround.Core.LocusOfAlphaPresence
import AwarenessGround.Core.AwarenessLocus

/-!
# UnifiedPresence.Bridge.ToAwarenessGround

**Paper 69: Bridge from manifestation aspect to Paper 67.**

Connects the manifestation aspect to awareness as locus of ground-presence.
Manifestation-in-awareness includes self-illumination (from 67.6).
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

open AwarenessGround

/--
**Manifestation aspect implies awareness locus of Alpha-presence.**

When ManifestationAspect holds, we have an awareness locus at which
Alpha-manifestation is present. This is the content of 69.3.
-/
theorem manifestation_aspect_implies_locus
  (α : Ground) (R : Ledger)
  (h : @UnifiedPresence.ManifestationAspect Ledger Ground Locus OntologicalGround LedgerActuality
    GroundIsSyntax GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger W F Subject AwareOfQuale ContentOf α R) :
  ∃ A : Locus, AwarenessLocus A ∧
    LocusOfAlphaPresence F (fun c => @GroundManifestation.AlphaManifestation Ledger Ground
      OntologicalGround LedgerActuality GroundIsSyntax GroundIsObjectLevelSemantics
      GroundIsExternalEqualStatus GroundIsGhost SelfActualizingLedger W F Subject AwareOfQuale
      ContentOf c α R) A :=
  h.2

end UnifiedPresence
