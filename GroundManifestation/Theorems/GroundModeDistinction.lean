import GroundManifestation.Core.AlphaManifestation

/-!
# GroundManifestation.Theorems.GroundModeDistinction

**Theorem 66.4: Alpha-manifestation implies phenomenal presence (definitional consequence).**

AlphaManifestation(x) ⇒ PhenomenalPresence(x). Immediate from the definition.
Re-exported from AlphaManifestation.alpha_manifestation_implies_phenomenal_presence.
-/

set_option autoImplicit false

namespace GroundManifestation

-- Re-export Theorem 66.4 (definitional consequence)
theorem ground_mode_distinction
  {Ledger : Type _} {Ground : Type _}
  {OntologicalGround : Ground → Ledger → Prop}
  {LedgerActuality : Ledger → Prop}
  {GroundIsSyntax : Ground → Prop}
  {GroundIsObjectLevelSemantics : Ground → Prop}
  {GroundIsExternalEqualStatus : Ground → Prop}
  {GroundIsGhost : Ground → Prop}
  {SelfActualizingLedger : Ledger → Prop}
  {W : Type _} (F : SemanticSelfDescription.SelfSemanticFrame W)
  (Subject : Type _) (AwareOfQuale : Subject → F.Claim → Prop)
  (ContentOf : F.Claim → Ledger → Prop)
  (x : F.Claim) (α : Ground) (R : Ledger)
  (h : AlphaManifestation F Subject AwareOfQuale ContentOf x α R) :
  PhenomenalPresence F Subject AwareOfQuale x :=
  alpha_manifestation_implies_phenomenal_presence x α R h

end GroundManifestation
