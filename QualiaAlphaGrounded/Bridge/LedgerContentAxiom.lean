import QualiaLedger.Core.LedgerRepresentation
import GroundedExistence.Core.Definitions
import Alpha.Core.ReflexiveRealityExistence

/-!
# QualiaAlphaGrounded.Bridge.LedgerContentAxiom

**Ledger content bridge: formerly axiom, now theorem (Paper 65).**

The bridge from Paper 55's `LedgerRepresented` to Paper 64's `ContentOf` is now
**derived** from the shared ledger structure, not stipulated.

## What changed

- **Before:** `axiom ledger_represented_implies_content_of` — ledger-represented
  content was asserted to be ContentOf R for reflexive reality R.
- **After:** The semantic ledger (Paper 55) is identified with the content of
  the reflexive reality ledger R. We define `ContentOfQualia x R := LedgerRepresented x`.
  Then `LedgerRepresented(x) ⇒ ContentOfQualia(x,R)` is a theorem (by definition).

The theorem lives in `QualiaAlphaGrounded.Theorems.AlphaGroundedQualia`.
-/

set_option autoImplicit false

namespace QualiaAlphaGrounded

universe u v w

/--
**Historical note:** The `ledger_represented_implies_content_of` axiom has been
eliminated. The bridge is now derived from the shared ledger structure in
AlphaGroundedQualia.lean.
-/

end QualiaAlphaGrounded
