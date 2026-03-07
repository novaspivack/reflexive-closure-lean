import SemanticSelfDescription.Core.Claims
import SemanticSelfDescription.Core.SelfTheory
import SemanticSelfDescription.Core.SelfScope
import SemanticSelfReference.Core.AntiVerdictClaims

/-!
# SemanticSelfReference.Bridge.FromSelfScoped

**Bridge: SelfScoped yields YesClaimData (Goal A of Paper 52 strengthening).**

When a theory T is self-scoped, the frame can encode "T says yes on c" for every
code c. This derives YesClaimData from the existing Paper 51 notion rather than
assuming it as an external interface.
-/

set_option autoImplicit false

namespace SemanticSelfReference

universe u v

variable {W : Type u} (F : SemanticSelfDescription.SelfSemanticFrame W)
variable (T : SemanticSelfDescription.InternalSelfTheory F)

open SemanticSelfDescription

/--
**Theorem 52.1 (strengthened):** SelfScoped implies YesClaimData for all codes.

When T is self-scoped, we obtain yes-claim data from the SaysYesClaim and
saysYes_correct fields. No external assumption needed.
-/
def selfScoped_to_yesClaimData (scope : SelfScoped F T) (c : F.Code) :
    YesClaimData F T c where
  claim := scope.SaysYesClaim c
  spec := scope.saysYes_correct c

/--
**Corollary:** Under SelfScoped, every code has yes-claim data.
-/
def selfScoped_implies_yesClaimData (scope : SelfScoped F T) (c : F.Code) :
    YesClaimData F T c :=
  selfScoped_to_yesClaimData F T scope c

end SemanticSelfReference
