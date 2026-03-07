import GroundManifestation.Core.AlphaManifestation
import AwarenessGround.Core.LocusOfAlphaPresence
import AwarenessGround.Core.AwarenessLocus

/-!
# UnifiedPresence.Core.ManifestationAspect

**Paper 69: Manifestation aspect — qualia and awareness as Alpha-grounded presence.**

The manifestation aspect: Alpha-manifestation exists and is present at
awareness-loci. From Papers 66, 67. Qualia are Alpha-manifestations;
awareness is the locus at which such manifestation is present. Includes
self-illumination (from 67): manifestation-in-awareness is intrinsically
self-illuminating.
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

open GroundManifestation

/--
**ManifestationAspect (α) (R)** — The manifestation aspect holds when
Alpha-manifestation exists and there is an awareness locus of Alpha-presence.

Theorem 69.3: Qualia and awareness are Alpha-grounded manifestation/presence.
-/
def ManifestationAspect (α : Ground) (R : Ledger) : Prop :=
  (∃ (x : F.Claim), @AlphaManifestation Ledger Ground OntologicalGround LedgerActuality
    GroundIsSyntax GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
    SelfActualizingLedger W F Subject AwareOfQuale ContentOf x α R) ∧
  (∃ (A : Locus), AwarenessGround.AwarenessLocus A ∧
    AwarenessGround.LocusOfAlphaPresence F
      (fun c => @GroundManifestation.AlphaManifestation Ledger Ground OntologicalGround LedgerActuality
        GroundIsSyntax GroundIsObjectLevelSemantics GroundIsExternalEqualStatus GroundIsGhost
        SelfActualizingLedger W F Subject AwareOfQuale ContentOf c α R) A)

end UnifiedPresence
