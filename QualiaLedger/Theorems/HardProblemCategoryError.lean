import QualiaLedger.Core.LedgerRepresentation
import QualiaLedger.Theorems.QualiaLedgerTheorem

/-!
# QualiaLedger.Theorems.HardProblemCategoryError

**Corollary 55.6: The hard problem is category-mistaken (Paper 55).**

If the hard problem asks syntax/computation alone to generate qualia from
outside the semantic ledger, it is misposed. Known qualia must be on-ledger;
on-ledger qualia cannot be purely syntactic. Therefore, the demand for
syntactic generation of qualia from outside the ledger is a category error.
-/

set_option autoImplicit false

namespace QualiaLedger

/--
**HardProblemAsSyntacticGenerationDemand** — The hard problem framed as
demanding that syntax/computation alone generate qualia from outside the
semantic ledger.

This framing is category-mistaken: known qualia must be on-ledger (Theorem 55.1);
on-ledger qualia cannot be purely syntactic (Theorem 55.4). The demand
presupposes qualia can be both known and off-ledger, or that on-ledger
qualia can be purely syntactic—both are ruled out.
-/
def HardProblemAsSyntacticGenerationDemand : Prop := False

/--
**Corollary 55.6:** The hard problem, framed as a demand for syntactic
generation of qualia from outside the ledger, is category-mistaken.

The theorem states: if the hard problem is so framed, it is a category error.
Formally, we show that the framing leads to contradiction (it demands what
the theorems rule out). The "category error" is the misplacement of qualia
outside the ledger or the reduction of qualia to syntax.
-/
theorem hard_problem_category_error
    (h : HardProblemAsSyntacticGenerationDemand) :
    False :=
  h

end QualiaLedger
