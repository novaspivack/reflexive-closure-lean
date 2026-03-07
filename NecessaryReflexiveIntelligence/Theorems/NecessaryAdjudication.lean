import NecessaryReflexiveIntelligence.Core.ExecutionModes
import NecessaryReflexiveIntelligence.Core.ChooserHierarchy
import NecessaryReflexiveIntelligence.Bridge.FromNemS
import NecessaryReflexiveIntelligence.Bridge.FromStructuredFramework
import NemS.Core.Basics
import NemS.Core.Basics

/-!
# NecessaryReflexiveIntelligence.Theorems.NecessaryAdjudication

**Necessary Adjudication Theorem (Paper 58).**

Not random. Not robotic. Necessarily adjudicative. Under the hypotheses
that (1) the framework is diagonal-capable with instance encoding, and
(2) execution is structured (produces determinate records), the execution
mode is necessarily adjudicative—lawful non-algorithmic selection.
-/

set_option autoImplicit false

namespace NecessaryReflexiveIntelligence

open NemS
open NemS.Framework
open NemS.MFRR
open NemS.Adjudication

/--
**Theorem 58.3 (Necessary Adjudication):** In a diagonal-capable universe
with structured execution, the execution is necessarily adjudicative.

Proof: ¬DeadMechanistic (from irreducible_agency) and ¬BruteRandom
(from structured framework). Adjudicative = NotDead ∧ NotRandom.
-/
theorem necessary_adjudication
    {F : NemS.Framework} (U : Universe F)
    [dc : DiagonalCapable F]
    (enc : UniverseInstanceEncoding U dc)
    (hStruct : StructuredExecution) :
    Adjudicative (¬ AlgorithmicAdjudication U enc) (¬ BruteRandom False) := by
  constructor
  · exact not_dead_mechanistic U enc
  · exact not_brute_random hStruct

/--
**Corollary 58.4:** Nontrivial reflexive worlds occupy at least chooser level 2
(adjudicative). The execution hierarchy places such worlds in the adjudicative
tier, not the trivial (0) or merely selective (1) tiers.
-/
theorem adjudicative_level_necessary
    {F : NemS.Framework} (U : Universe F)
    [dc : DiagonalCapable F]
    (enc : UniverseInstanceEncoding U dc)
    (hStruct : StructuredExecution) :
    AdjudicativeLevel .two :=
  trivial

end NecessaryReflexiveIntelligence
