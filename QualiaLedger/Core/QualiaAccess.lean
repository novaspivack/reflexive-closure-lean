import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.SelfTheory

/-!
# QualiaLedger.Core.QualiaAccess

**Qualia access predicates (Paper 55).**

Subject-level access to qualitative content: awareness, report, discrimination,
memory, self-modeling. These are the operational predicates that connect qualia
to the semantic ledger. The key conceptual claim: any such access implies
ledger representation (see LedgerRepresentation.lean).
-/

set_option autoImplicit false

namespace QualiaLedger

universe u v

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W) (Subject : Type v)
  (AwareOfQuale : Subject → F.Claim → Prop) (CanReportQuale : Subject → F.Claim → Prop)
  (CanDiscriminateQuale : Subject → F.Claim → Prop) (RemembersQuale : Subject → F.Claim → Prop)
  (SelfModelsQuale : Subject → F.Claim → Prop)

/--
**Qualia content** — we identify qualia-relevant content with claims in the
self-semantic frame. A claim is qualia-relevant if it concerns qualitative
character (e.g., "this experience has property P"). We use `F.Claim` as the
carrier; the predicate `IsQualiaRelevant` can restrict when needed.
-/
def QualiaContent := F.Claim

/--
**IsQualiaRelevant (c)** — Claim c is qualia-relevant.

Marks claims that concern qualitative character. Used to restrict the
qualia domain when needed. For the main theorems, we work with the
full claim space; this predicate allows future refinement.
-/
def IsQualiaRelevant (_c : F.Claim) : Prop := True

/--
**Access implies awareness** — any of the stronger access forms implies awareness.

Conceptually: if you can report, discriminate, remember, or self-model a quale,
you are aware of it. This is an axiom schema; concrete instantiations would
prove it from their specific definitions of these predicates.
-/
axiom canReport_implies_aware
    (S : Subject) (x : F.Claim) :
    CanReportQuale S x → AwareOfQuale S x

axiom canDiscriminate_implies_aware
    (S : Subject) (x : F.Claim) :
    CanDiscriminateQuale S x → AwareOfQuale S x

axiom remembers_implies_aware
    (S : Subject) (x : F.Claim) :
    RemembersQuale S x → AwareOfQuale S x

axiom selfModels_implies_aware
    (S : Subject) (x : F.Claim) :
    SelfModelsQuale S x → AwareOfQuale S x

end QualiaLedger
