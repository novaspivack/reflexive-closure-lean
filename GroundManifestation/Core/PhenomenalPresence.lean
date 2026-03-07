import QualiaLedger.Core.LedgerRepresentation

/-!
# GroundManifestation.Core.PhenomenalPresence

**Paper 66: Phenomenal presence — defined independently of GroundMode and AlphaManifestation.**

Content x has phenomenal presence when it is present as lived semantic content:
available under awareness-level access and not merely as encoded or causal downstream.
Formally: ledger-represented content under the access conditions of Paper 55.

Proof dependency: PhenomenalPresence must be usable before GroundMode.
-/

set_option autoImplicit false

namespace GroundManifestation

universe u v

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)
variable (Subject : Type v)
variable (AwareOfQuale : Subject → F.Claim → Prop)

/--
**PhenomenalPresence (x)** — Content x has phenomenal presence when it is present
as lived semantic content: available under awareness-level access.

Definition: LedgerRepresented(x). Content that is the object of awareness is
present in the semantic sense. Defined independently of GroundMode and AlphaManifestation.
-/
def PhenomenalPresence (x : F.Claim) : Prop :=
  QualiaLedger.LedgerRepresented F Subject AwareOfQuale x

end GroundManifestation
