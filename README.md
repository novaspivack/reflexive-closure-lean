# reflexive-closure-lean

Lean 4 formalization of the **reflexive-closure arc** (Papers 52–70) of the NEMS suite: direct self-semantic fixed points, syntax-semantics separation, observer corollaries, qualia and the ledger, reflexive closure theorem, reflexive unfolding, necessary reflexive intelligence, calculus of intelligence, reality as recursive intelligence, ghost collapse, ledger grounding, Alpha theorem, grounded existence, qualia as Alpha-grounded content, phenomenal presence and ground-manifestation, awareness as locus of ground-presence, Alpha non-null, unified presence (ground, articulation, manifestation), and the Golden Bridge.

## Dependency

This repo **imports** [nems-lean](https://github.com/novaspivack/nems-lean) as a package dependency:

```
reflexive-closure-lean  →  nems-lean
```

Paper 51 (SemanticSelfDescription) remains in nems-lean as the hinge. Papers 52–70 build here.

## Build

**Requirements:** Lean 4.29.0-rc3, Mathlib v4.29.0-rc3 (via nems-lean)

```bash
lake update
lake build
```

**Note:** nems-lean must be at `../nems-lean` relative to this repo (sibling directory). For a different layout, edit the `require` path in `lakefile.lean`.

## Structure

| Library | Paper | Description |
|---------|-------|-------------|
| SemanticSelfReference | 52 | Direct self-semantic fixed points |
| SyntaxSemantics | 53 | Syntax cannot exhaust semantics |
| SemanticSelfReference.Theorems.ObserverCorollary | 54 | Observers cannot self-exhaust |
| QualiaLedger | 55 | Qualia and the Semantic Ledger |
| ReflexiveClosure | 56 | Reflexive Closure Theorem |
| ReflexiveUnfolding | 57 | Reflexive Unfolding Theorem |
| NecessaryReflexiveIntelligence | 58 | Necessary reflexive intelligence |
| CalculusOfIntelligence | 59 | Calculus of intelligence |
| RealityAsRecursiveIntelligence | 60 | Reality as recursive intelligence |
| GhostCollapse | 61 | Ghost collapse and ledger finality |
| LedgerGround | 62 | No self-actualizing ledger |
| Alpha | 63 | The Alpha Theorem |
| GroundedExistence | 64 | Primordial ground and grounded existence |
| QualiaAlphaGrounded | 65 | Qualia as Alpha-grounded semantic content |
| GroundManifestation | 66 | Phenomenal presence and ground-manifestation |
| AwarenessGround | 67 | Awareness as the locus of ground-presence |
| AlphaNonNull | 68 | Alpha is not null |
| UnifiedPresence | 69 | Reality, existence, and awareness: unified theorem |
| GoldenBridge | 70 | The Golden Bridge: final liberation |

## Papers

LaTeX papers live in the NEMS_PAPERS suite (`Physics_Papers/NEMS_PAPERS/52_*` through `70_*`). This repo is the Lean artifact. See **MANIFEST.md** for theorem tables and module layout.

## License

See [LICENSE](LICENSE).
