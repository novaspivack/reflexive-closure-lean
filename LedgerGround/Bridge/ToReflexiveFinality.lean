import LedgerGround.Core.OntologicalGround
import LedgerGround.Core.GroundCategories
import NemS.Reflexive.FinalityTheorem

set_option autoImplicit false

namespace LedgerGround

open NemS.Reflexive NemS.Reflexive.ReflexiveTheorySpace

universe u v

variable {Ledger : Type u} {Ground : Type v}
variable {OntologicalGround : Ground → Ledger → Prop}
variable {GroundIsExternalEqualStatus : Ground → Prop}

variable (S : ReflexiveTheorySpace)
variable (toTheory : Ledger → S.Theory)
variable (toMeta : Ground → S.Theory)

/--
**Bridge hypothesis:** Interpretation of LedgerGround's external grounding
in Paper 23's ReflexiveTheorySpace.

- R as Master Loop (the ledger is PSC-optimal and self-contained)
- g as meta-explanation of R (external ground purports to explain from outside)
- Each outcome of foundational_finality contradicts full sufficient grounding
-/
structure ExternalGroundingInterpretation (g : Ground) (R : Ledger)
  (hGround : OntologicalGround g R) (hExternal : GroundIsExternalEqualStatus g) where
  h_loop : S.MasterLoop (toTheory R)
  h_meta : S.MetaExplanation (toMeta g) (toTheory R)
  fails_contra : S.FailsPSC (toMeta g) → False
  redundant_contra : S.Redundant (toMeta g) (toTheory R) → False
  isomorphic_contra : S.Isomorphic (toMeta g) (toTheory R) → False

/--
**Theorem (Paper 23 bridge):** Under the bridge hypothesis, external
grounding yields contradiction. Derives from Paper 23's foundational_finality.
-/
theorem no_external_equal_status_ground_from_paper23
  (g : Ground) (R : Ledger) (hGround : OntologicalGround g R)
  (hExternal : GroundIsExternalEqualStatus g)
  (hBridge : @ExternalGroundingInterpretation Ledger Ground OntologicalGround GroundIsExternalEqualStatus S toTheory toMeta g R hGround hExternal) :
  False := by
  obtain ⟨h_loop, h_meta, fails_c, redundant_c, iso_c⟩ := hBridge
  exact (foundational_finality S (toTheory R) h_loop (toMeta g) h_meta).elim
    fails_c (fun h => h.elim redundant_c iso_c)

end LedgerGround
