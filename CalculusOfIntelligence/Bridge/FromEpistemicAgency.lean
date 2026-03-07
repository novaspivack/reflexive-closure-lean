/-!
# CalculusOfIntelligence.Bridge.FromEpistemicAgency

**Bridge from Paper 31: Distributed plurality amplifies intelligence (Theorem 59.5).**

Paper 31 (Epistemic Agency Under Diagonal Constraints) proves that distributed
diverse frontier-sensitive adjudication yields strictly greater certified
intelligence coverage than any isolated adjudicator. This is the formal
instantiation of Theorem 59.5: plurality and role diversity amplify
intelligence/coverage.

**Formal statement (Theorem 59.5):** Distributed diverse frontier-sensitive
adjudication yields strictly greater certified intelligence coverage than any
isolated adjudicator.

**Paper 31 instantiation (nems-lean EpistemicAgency library):**
- `protocol_strict_improvement`: society can certify strictly more than any individual
- `diversity_necessary`: homogeneous societies cannot strictly improve; role
  diversity is necessary for strict improvement
- `diversity_strict_improvement`: two verifiers with incomparable covers yield
  strict improvement under the union protocol

Together these establish the theorem. When EpistemicAgency is available in the
build, this bridge can import `EpistemicAgency.Theorems.ProtocolStrictImprovement`
and `EpistemicAgency.Theorems.Diversity` to re-export the formal proofs.
-/
