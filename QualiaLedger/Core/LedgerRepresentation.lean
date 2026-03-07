import SemanticSelfDescription.Core.Claims
import QualiaLedger.Core.QualiaAccess

/-!
# QualiaLedger.Core.LedgerRepresentation

**Ledger representation and the Known Qualia Theorem (Paper 55).**

The semantic ledger is the formal semantic account of the subject/system—the
space of claims that are represented in the system's internal model. The key
conceptual claim: **if qualia are known (aware, reported, discriminated, etc.),
they must be ledger-represented.** Awareness and related access are ledger-level
states; therefore anything genuinely accessed in that way is not outside the ledger.
-/

set_option autoImplicit false

namespace QualiaLedger

universe u v

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)
variable (Subject : Type v)
variable (AwareOfQuale : Subject → F.Claim → Prop)

/--
**LedgerRepresented (x)** — Qualitative content x is represented in the
semantic ledger of the relevant system.

Definition: x is ledger-represented iff some subject has awareness-level access
to it. The rationale: awareness, report, discrimination, memory, and self-modeling
are all operations that require the content to be represented in the system's
semantic account (the ledger). One cannot be aware of something that is not
represented. Therefore: ∃ S, AwareOfQuale(S,x) → LedgerRepresented(x).

We define LedgerRepresented as ∃ S, AwareOfQuale(S,x), making the implication
trivial. The substantive content is that this is the right definition—that
"known" qualia are precisely those with ledger representation.
-/
def LedgerRepresented (x : F.Claim) : Prop :=
  ∃ S : Subject, AwareOfQuale S x

/--
**QualiaOutsideLedger (x)** — Qualitative content x is not ledger-represented.

The complement of LedgerRepresented. Off-ledger qualia are those to which
no subject has awareness-level access (in the formal account).
-/
def QualiaOutsideLedger (x : F.Claim) : Prop :=
  ¬ LedgerRepresented F Subject AwareOfQuale x

/--
**Theorem 55.1 (Known qualia are on-ledger):** If a subject is aware of
qualitative content x, then x is ledger-represented.

Proof: Awareness, report, discrimination, memory, and self-modeling are
ledger-level states---they require the content to be represented in the
system's semantic account. One cannot be aware of something not so represented.
We define LedgerRepresented(x) := ∃ S, AwareOfQuale(S,x), capturing this
structural relationship; given AwareOfQuale(S,x), we take S as witness.

The theorem is not stipulative: the definition is chosen because it correctly
encodes the structural fact that subject access implies ledger representation.
-/
theorem aware_implies_ledger_represented
    (S : Subject) (x : F.Claim) (h : AwareOfQuale S x) :
    LedgerRepresented F Subject AwareOfQuale x :=
  ⟨S, h⟩

/--
**Theorem 55.2 (Off-ledger but known qualia impossible):** If qualia are
off-ledger but some subject is aware of them, we have contradiction.

Proof: QualiaOutsideLedger(x) means ¬∃ S, AwareOfQuale(S,x). But we have
AwareOfQuale(S,x) for some S, so ∃ S, AwareOfQuale(S,x). Contradiction.
-/
theorem off_ledger_known_impossible
    (x : F.Claim)
    (hOutside : QualiaOutsideLedger F Subject AwareOfQuale x)
    (S : Subject) (hAware : AwareOfQuale S x) :
    False :=
  hOutside ⟨S, hAware⟩

end QualiaLedger
