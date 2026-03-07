import ReflexiveClosure.Core.SelfCoincidence
import ReflexiveClosure.Theorems.ClosureWithoutCollapse

/-!
# ReflexiveClosure — Paper 56: The Reflexive Closure Theorem

**Closure without collapse.** A nontrivial reflexive system may close over
itself, but cannot coincide with its own complete internal semantic image.

This library unifies the static summit (Papers 51–55):
- Paper 51: no final internal self-theory
- Paper 52: intrinsic anti-verdict contradiction
- Paper 53: no syntactic exhaustion of semantics
- Paper 54: no self-exhausting observer
- Paper 55: known qualia must be on-ledger

## Key definitions

- `SelfCoinciding` — system possesses final internal self-theory
- `IrreducibleReflexiveDistance` — no self-coincidence

## Key theorems

- `no_self_coincidence` — Theorem 56.1
- `closure_without_collapse` — Theorem 56.2 (unified statement)
- `no_self_exhausting_observer_via_closure` — Corollary (Paper 54)

## Dependencies

- reflexive-closure-lean SemanticSelfReference (Paper 52)
- reflexive-closure-lean SyntaxSemantics (Paper 53)
- reflexive-closure-lean QualiaLedger (Paper 55)
-/
