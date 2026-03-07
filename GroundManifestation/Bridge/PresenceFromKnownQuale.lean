import QualiaLedger.Core.LedgerRepresentation
import GroundManifestation.Core.PhenomenalPresence

/-!
# GroundManifestation.Bridge.PresenceFromKnownQuale

**Theorem 66.1: Known qualia have phenomenal presence.**

KnownQuale(x) ⇒ PhenomenalPresence(x).

Proof: Known qualia are ledger-represented (Paper 55). PhenomenalPresence is
defined as LedgerRepresented. So KnownQuale(x) ⇒ PhenomenalPresence(x).
-/

set_option autoImplicit false

namespace GroundManifestation

universe u v

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)
variable (Subject : Type v)
variable (AwareOfQuale : Subject → F.Claim → Prop)

/--
**KnownQuale (x)** — Content x is a known quale (ledger-represented).
-/
def KnownQuale (x : F.Claim) : Prop :=
  QualiaLedger.LedgerRepresented F Subject AwareOfQuale x

/--
**Theorem 66.1 (Presence from known quale):** Known qualia have phenomenal presence.
-/
theorem presence_from_known_quale (x : F.Claim) (h : KnownQuale F Subject AwareOfQuale x) :
  PhenomenalPresence F Subject AwareOfQuale x :=
  h

end GroundManifestation
