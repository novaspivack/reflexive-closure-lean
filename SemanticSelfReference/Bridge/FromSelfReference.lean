import SelfReference.Core.Interface
import SelfReference.Core.FixedPoint
import SemanticSelfDescription.Core.Claims
import SemanticSelfReference.Core.SemanticNegation
import SemanticSelfReference.Core.SelfReferenceFrame

/-!
# SemanticSelfReference.Bridge.FromSelfReference

**Bridge: SRI yields SelfReferenceFrame (Goal B of Paper 52 strengthening).**

When the frame's Code and Claim coincide (unityped) and decode is identity,
an SRI0' structure on Code supplies the fixed-point capability. This derives
SelfReferenceFrame from the existing Paper 26 machinery rather than assuming
it as an external interface.

## Unityped case

We consider frames where Code = Claim and decode = id. Then a claim
transformer f : Code → Claim is just f : α → α, and the fixed-point
requirement decode(d) ≡ f(d) becomes d ≡ f(d). The SRI0' master
fixed-point theorem supplies exactly this.
-/

set_option autoImplicit false

namespace SemanticSelfReference

universe u v

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)

/--
**Unityped self-semantic frame**: Code = Claim and decode is identity.

This captures the case where codes and claims are the same type and
decoding is trivial. Many diagonal constructions (Gödel, Kleene) use
this setup.
-/
structure UnitypedFrame (F : SemanticSelfDescription.SelfSemanticFrame W) where
  /-- Code and Claim are the same type -/
  code_eq_claim : F.Code = F.Claim
  /-- decode is identity (transporting along the equality) -/
  decode_id : ∀ c : F.Code, F.decode c = Eq.mp code_eq_claim c
  /-- ClaimEquiv coincides with equality when restricted -/
  claimEquiv_eq : ∀ (a b : F.Claim), F.ClaimEquiv a b ↔ a = b

-- For the bridge we need to work with the equality. Lean's eq.rec makes this
-- verbose. A cleaner approach: assume we have a frame that *is* unityped
-- by construction. Let me try a different formulation.

/--
**SelfReferenceFrame from SRI0' (unityped case).**

When:
- F.Code = F.Claim (same type)
- F.decode = id (cast along the equality)
- F.ClaimEquiv = SRI0'.Equiv
- [SRI0' F.Claim F.Code]
- hQuoteId: quotation is identity (quote x = x when Code = Claim)

then we obtain SelfReferenceFrame: for any f : Code → Claim, there exists
d with decode(d) ≡ f(d).

Proof: SRI0' master_fixed_point gives p : F.Claim with p ≃ f(quote p).
With identity quotation, quote p = p (as Code), so p ≃ f(p). Use d = p as Code;
decode(d) = p and f(d) = f(p), so decode(d) ≡ f(d).
-/
theorem sri0'_supplies_fixed_point
    (hCodeEqClaim : F.Code = F.Claim)
    [sri : SelfReference.SRI0' F.Claim F.Code]
    (hDecode : ∀ c : F.Code, F.decode c = Eq.mp hCodeEqClaim c)
    (hEquiv : ∀ (a b : F.Claim), F.ClaimEquiv a b ↔ sri.Equiv a b)
    (hQuoteId : ∀ x : F.Claim, sri.quote x = Eq.mpr hCodeEqClaim x)
    (f : F.Code → F.Claim)
    (_hf : ∀ {a b : F.Claim}, sri.Equiv a b → sri.Equiv (f (Eq.mpr hCodeEqClaim a))
      (f (Eq.mpr hCodeEqClaim b))) :
    ∃ d : F.Code, F.ClaimEquiv (F.decode d) (f d) := by
  let F' : F.Code → F.Claim := fun c => f c
  obtain ⟨p, hp⟩ := SelfReference.SRI0'.master_fixed_point F'
  let d := Eq.mpr hCodeEqClaim p
  use d
  have hDecode_d : F.decode d = p := by
    rw [hDecode]
    exact Eq.rec (motive := fun FClaim h => ∀ p : FClaim, Eq.mp h (Eq.mpr h p) = p)
      (fun _ => rfl) hCodeEqClaim p
  have hQuoteId_p : sri.quote p = d := hQuoteId p
  have hp' : sri.Equiv p (f d) := by rw [← hQuoteId_p]; exact hp
  rw [hDecode_d, hEquiv]
  exact hp'

end SemanticSelfReference
