import LedgerGround.Core.OntologicalGround
import LedgerGround.Core.GroundCategories
import GhostCollapse.Theorems.GhostCollapse

set_option autoImplicit false

namespace LedgerGround

universe u v

variable {Ledger : Type u} {Ground : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}
variable {GroundIsGhost : Ground → Prop}

variable {Entity : Type v}
variable (OffLedger : Entity → Prop)
variable (DeterminacyRelevant : Entity → Prop)
variable (SemanticNull : Entity → Prop)

/--
**Bridge hypothesis:** Interpretation of LedgerGround's ghost grounding
in GhostCollapse's Entity/OffLedger/DeterminacyRelevant framework.

- `toEntity` embeds Ground into Entity
- Ghost grounds are off-ledger
- Ontological grounding implies determinacy-relevance (the ground affects the ledger)
- A semantically null entity cannot be the full sufficient ontological ground
-/
structure GhostGroundingInterpretation (g : Ground) (R : Ledger)
  (hGround : OntologicalGround g R) (hGhost : GroundIsGhost g) where
  toEntity : Ground → Entity
  ghost_iff_off : OffLedger (toEntity g)
  grounding_implies_det : DeterminacyRelevant (toEntity g)
  grounding_excludes_null : SemanticNull (toEntity g) → False

/--
**Theorem (Paper 61 bridge):** Under the bridge hypothesis, ghost grounding
yields contradiction. Derives from Paper 61's ghost_collapse.
-/
theorem no_ghost_ground_from_paper61
  (g : Ground) (R : Ledger) (hGround : OntologicalGround g R) (hGhost : GroundIsGhost g)
  (hBridge : @GhostGroundingInterpretation Ledger Ground OntologicalGround GroundIsGhost Entity
    OffLedger DeterminacyRelevant SemanticNull g R hGround hGhost) :
  False := by
  obtain ⟨toEntity, hOff, hDet, hNull⟩ := hBridge
  exact (GhostCollapse.ghost_collapse OffLedger DeterminacyRelevant SemanticNull
    (toEntity g) hOff).elim (fun h => h hDet) hNull

end LedgerGround
