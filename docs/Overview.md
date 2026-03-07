# reflexive-closure-lean — Overview

This document describes the structure and usage of the reflexive-closure-lean library, which formalizes Papers 52–65 of the NEMS suite (the reflexive-closure arc).

## Dependency

reflexive-closure-lean **imports** nems-lean as a package dependency. Paper 51 (SemanticSelfDescription) remains in nems-lean as the hinge; Papers 52–65 build here.

```
reflexive-closure-lean  →  nems-lean
```

nems-lean must be at `../nems-lean` relative to this repo (sibling directory). Edit the `require` path in `lakefile.lean` for a different layout.

## Library Structure

| Library | Paper | Depends on |
|---------|-------|------------|
| SemanticSelfReference | 52 | nems-lean (SelfReference, SemanticSelfDescription) |
| SyntaxSemantics | 53 | SemanticSelfReference |
| SemanticSelfReference.Theorems.ObserverCorollary | 54 | SemanticSelfReference; connects to nems-lean SelfAwareness |
| QualiaLedger | 55 | SemanticSelfReference, SyntaxSemantics |
| ReflexiveClosure | 56 | SemanticSelfReference, SyntaxSemantics, QualiaLedger |
| ReflexiveUnfolding | 57 | ReflexiveClosure; bridges to nems-lean RefinementFlow, RecordEntropy |
| NecessaryReflexiveIntelligence | 58 | ReflexiveUnfolding, ReflexiveClosure; bridges to nems-lean NemS.Adjudication |
| CalculusOfIntelligence | 59 | NecessaryReflexiveIntelligence |
| RealityAsRecursiveIntelligence | 60 | ReflexiveClosure, ReflexiveUnfolding, NecessaryReflexiveIntelligence, CalculusOfIntelligence |
| GhostCollapse | 61 | QualiaLedger; bridges to nems-lean Closure (no-free-bits) |
| LedgerGround | 62 | GhostCollapse, SyntaxSemantics; bridges to Paper 23 |
| Alpha | 63 | GhostCollapse, LedgerGround; bridges to nems-lean Closure |
| GroundedExistence | 64 | Alpha |
| QualiaAlphaGrounded | 65 | SyntaxSemantics, QualiaLedger, Alpha, GroundedExistence |

## Thematic Arc

1. **Self-semantic fixed points (52–54):** Direct construction of the no-final-self-theory contradiction; syntax cannot exhaust semantics; observers cannot self-exhaust.

2. **Qualia and ledger (55):** Known qualia must be on the semantic ledger and are irreducible to syntax.

3. **Reflexive closure (56–57):** Closure without collapse; reflexive unfolding cannot halt; no terminal completion.

4. **Intelligence (58–60):** Necessary adjudication; calculus of intelligence; reality as recursively intelligent.

5. **Grounding (61–65):** Ghost collapse; no self-actualizing ledger; Alpha theorem; grounded existence; qualia as Alpha-grounded content.

## Build

```bash
cd ~/reflexive-closure-lean   # or via NEMS_PAPERS/reflexive-closure-lean symlink
lake update
lake build
```

## Further Reading

- **MANIFEST.md** — Theorem tables, file layout, paper correspondence
- **README.md** — Quick start, structure table
- **0.1_PAPER_SUMMARIES.md** (in outer repo) — One-paragraph summaries of each paper
- **nems-lean/MANIFEST.md** — Papers 01–51, companion papers, theorem spine
