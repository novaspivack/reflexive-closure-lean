import SemanticSelfReference.Core.SemanticNegation
import SemanticSelfReference.Core.SelfReferenceFrame
import SemanticSelfReference.Core.AntiVerdictClaims
import SemanticSelfReference.Bridge.FromSelfScoped
import SemanticSelfReference.Bridge.FromSelfReference
import SemanticSelfReference.Theorems.DirectFixedPoint
import SemanticSelfReference.Theorems.DirectNoFinalSelfTheory
import SemanticSelfReference.Theorems.DirectNoSelfErasure
import SemanticSelfReference.Theorems.ObserverCorollary

/-!
# SemanticSelfReference — Paper 52: Direct Self-Semantic Fixed Points

**Upgrade Paper 51 from reduction-to-barrier into intrinsic theorem.**

Construct explicit self-semantic anti-verdict fixed points inside the self-semantic
framework itself. The contradiction in Paper 51 arises directly from the self-semantic
framework rather than only by reduction to SelectorStrength.

## Key theorems

- `self_semantic_fixed_point_exists` — under self-ref + semantic negation, exists anti-verdict fixed point
- `direct_no_final_self_theory` — any final self-theory yields contradiction on that fixed point
- `direct_no_weak_self_erasure`, `direct_no_strong_self_erasure` — corollaries

## Dependencies

- nems-lean SemanticSelfDescription (Paper 51)
- nems-lean SelfReference (Paper 26)
- nems-lean Reflection (Paper 28)
-/
