import NecessaryReflexiveIntelligence.Core.ExecutionModes
import NemS.Core.Basics
import NemS.Adjudication.IrreducibleAgency

/-!
# NecessaryReflexiveIntelligence.Bridge.FromNemS

**Bridge from nems-lean: ¬DeadMechanistic (Paper 58).**

In a diagonal-capable framework with instance encoding, the internal adjudication
cannot operate via a total computable function. Execution is not dead mechanistic.
This is Theorem 22.1 (Irreducible Agency) from nems-lean.
-/

set_option autoImplicit false

namespace NecessaryReflexiveIntelligence

open NemS
open NemS.Framework
open NemS.MFRR
open NemS.Adjudication

/--
**Theorem 58.1 (From Paper 22):** In a diagonal-capable universe with instance
encoding, execution is not dead mechanistic. No static algorithm can emulate
the internal adjudication on diagonal instances.
-/
theorem not_dead_mechanistic
    {F : NemS.Framework} (U : Universe F)
    [dc : DiagonalCapable F]
    (enc : UniverseInstanceEncoding U dc) :
    ¬ DeadMechanistic (AlgorithmicAdjudication U enc) :=
  irreducible_agency U enc

end NecessaryReflexiveIntelligence
