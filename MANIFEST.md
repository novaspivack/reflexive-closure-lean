# reflexive-closure-lean — Artifact Manifest

Lean 4 formalization of the **reflexive-closure arc** (Papers 52–70) of the NEMS suite: direct self-semantic fixed points, syntax-semantics separation, observer corollaries, qualia and the ledger, reflexive closure theorem, reflexive unfolding, necessary reflexive intelligence, calculus of intelligence, reality as recursive intelligence, ghost collapse, ledger grounding, Alpha theorem, grounded existence, qualia as Alpha-grounded content, phenomenal presence and ground-manifestation, awareness as locus of ground-presence, Alpha non-null, unified presence (ground, articulation, manifestation), and the Golden Bridge.

## Dependency

This repo **imports** [nems-lean](https://github.com/novaspivack/nems-lean) as a package dependency:

```
reflexive-closure-lean  →  nems-lean
```

Paper 51 (SemanticSelfDescription) remains in nems-lean as the hinge. Papers 52–70 build here.

## Build

**Build result:** Current clean build succeeds with the pinned toolchain. See the reproduction section for the exact current build outcome, and see the theorem tables below for current theorem coverage and sorry-status.

**Requirements:** Lean 4.29.0-rc3, Mathlib v4.29.0-rc3 (via nems-lean)

```bash
lake update
lake build
```

**Note:** nems-lean must be at `../nems-lean` relative to this repo (sibling directory). For a different layout, edit the `require` path in `lakefile.lean`.

---

## Library–Paper Correspondence

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
| UnifiedPresence | 69 | Reality, existence, and awareness: unified theorem of ground, articulation, manifestation |
| GoldenBridge | 70 | The Golden Bridge: final liberation of ground, being, and awareness |

---

## Theorem Tables

### SemanticSelfReference (Paper 52)

| File | Theorem | Statement |
|------|---------|-----------|
| `SemanticSelfReference/Theorems/DirectFixedPoint.lean` | `self_semantic_fixed_point_exists` | Fixed-point code d such that Decode(d) ≡ anti-yes claim for T on d |
| `SemanticSelfReference/Theorems/DirectFixedPoint.lean` | `self_semantic_fixed_point_exists_from_self_scoped` | Same from SelfScoped premise |
| `SemanticSelfReference/Theorems/DirectNoFinalSelfTheory.lean` | `direct_no_final_self_theory` | No final internal self-theory |
| `SemanticSelfReference/Theorems/DirectNoSelfErasure.lean` | `direct_no_weak_self_erasure` | No weak self-erasure |
| `SemanticSelfReference/Theorems/DirectNoSelfErasure.lean` | `direct_no_strong_self_erasure` | No strong self-erasure |
| `SemanticSelfReference/Bridge/FromSelfReference.lean` | `sri0'_supplies_fixed_point` | Bridge from SelfReference |

### SemanticSelfReference.Theorems.ObserverCorollary (Paper 54)

| File | Theorem | Statement |
|------|---------|-----------|
| `SemanticSelfReference/Theorems/ObserverCorollary.lean` | `no_self_exhausting_observer` | No reflexive observer can internally exhaust itself |
| `SemanticSelfReference/Theorems/ObserverCorollary.lean` | `no_self_exhausting_observer'` | Variant |
| `SemanticSelfReference/Theorems/ObserverCorollary.lean` | `stratified_observer_model_empty` | Nontrivial stratified observer model exists (non-vacuity) |
| `SemanticSelfReference/Theorems/ObserverCorollary.lean` | `complete_observer_model_implies_barrier_violation` | Complete observer model implies barrier violation |

### SyntaxSemantics (Paper 53)

| File | Theorem | Statement |
|------|---------|-----------|
| `SyntaxSemantics/Theorems/NoSyntacticExhaustion.lean` | `no_syntactic_semantic_exhaustion` | No purely syntactic structure can exhaust realized semantic truth |
| `SyntaxSemantics/Core/SyntacticTheory.lean` | `semanticExhaustive_induces_final` | Semantic exhaustion would induce final self-theory |

### QualiaLedger (Paper 55)

| File | Theorem | Statement |
|------|---------|-----------|
| `QualiaLedger/Theorems/QualiaLedgerTheorem.lean` | `known_qualia_irreducible_semantic` | Known qualia are irreducible semantic content |
| `QualiaLedger/Theorems/KnownQualiaOnLedger.lean` | `known_qualia_on_ledger` | Known qualia must be on ledger |
| `QualiaLedger/Theorems/OffLedgerQualia.lean` | `off_ledger_known_impossible` | Off-ledger known qualia impossible |
| `QualiaLedger/Theorems/OffLedgerQualia.lean` | `off_ledger_inert_or_illicit` | Off-ledger entities inert or illicit |
| `QualiaLedger/Core/LedgerRepresentation.lean` | `aware_implies_ledger_represented` | Awareness implies ledger representation |
| `QualiaLedger/Bridge/ToSyntaxSemantics.lean` | `on_ledger_qualia_not_purely_syntactic` | On-ledger qualia not purely syntactic |
| `QualiaLedger/Theorems/HardProblemCategoryError.lean` | `hard_problem_category_error` | Hard problem as category error |

### ReflexiveClosure (Paper 56)

| File | Theorem | Statement |
|------|---------|-----------|
| `ReflexiveClosure/Theorems/ClosureWithoutCollapse.lean` | `no_self_coincidence` | No self-coincidence |
| `ReflexiveClosure/Theorems/ClosureWithoutCollapse.lean` | `closure_without_collapse` | Closure without collapse |
| `ReflexiveClosure/Theorems/ClosureWithoutCollapse.lean` | `no_self_exhausting_observer_via_closure` | No self-exhausting observer via closure |
| `ReflexiveClosure/Theorems/ClosureWithoutCollapse.lean` | `irreducible_reflexive_distance_under_diagonal` | Irreducible reflexive distance under diagonal capability |
| `ReflexiveClosure/Core/SelfCoincidence.lean` | `no_self_coincidence_implies_irreducible_reflexive_distance` | No self-coincidence ⇒ irreducible reflexive distance |
| `ReflexiveClosure/Theorems/BinaryInsufficiency.lean` | `binary_closure_insufficient` | 56.T1: Binary closure insufficient |
| `ReflexiveClosure/Theorems/BinaryInsufficiency.lean` | `noncollapsing_reflexive_closure_minimally_ternary` | 56.T2: Non-collapsing reflexive closure minimally ternary |

### Summit-2 bridge (structured forgetting; geometry-of-maps paper adjacency)

Formal anchors in **reflexive-closure-lean** for *The Geometry of What Maps Forget*: local map forgetting, minimal representation/remainder interfaces, class-level invariants (“conservation”), and Paper 57 hook lemmas. **Trust boundary:** these are abstract (arbitrary types; no certification axioms). Endomorphism conservation uses `α → α`; mapping between distinct types is handled upstream in the universal residual package. Readings of “physical law,” “ontology,” or “motivation” remain interpretive even when the prose cites these interfaces.

| File | Key declarations / theorems | Notes |
|------|-----------------------------|--------|
| `ReflexiveClosure/Core/MapForgetting.lean` | `ForgetsDistinction`, `HasForgetting`, `hasForgetting_iff_not_injective`, `representation_forgetting_theorem` | Single-map forgetting vs injectivity. |
| `ReflexiveClosure/Core/RepresentationFrame.lean` | `RepSemanticRemainder`, `RepresentationExhaustive`, `RepresentationSelective`, `representation_selective_iff_rep_semantic_remainder` | Abstract frontier vs realized content (no Paper~57 import). |
| `ReflexiveClosure/Core/FamilyConservation.lean` | `InvariantUnder`, `ClassInvariant`, `ConservationLaw`, `invariant_agrees_on_fiber`, `invariant_identifies_forgotten_distinctions`, `class_level_memory_vs_local_forgetting`, `conservation_complement_single_map_forgetting` | Class-level invariance `I ∘ f = I` for admissible families; formal duality with fiber collapse (invariants constant on fibers). |
| `ReflexiveUnfolding/Bridge/StructuredForgetting.lean` | `semantic_remainder_eq_rep_semantic_remainder`, `semantic_remainder_iff_rep_semantic_remainder` | Aligns `RepresentationFrame` with Paper~57 `SemanticRemainder`. |
| `ReflexiveUnfolding/Theorems/FunctionalNonExhaustion.lean` | `FunctionSemanticallyExhaustive`, `functional_non_exhaustion_theorem`, `no_terminal_functional_completion`, etc. | Internal-transform / “function” non-exhaustion (Paper~56/57 stack). |
| `ReflexiveUnfolding/Theorems/ArticulativeAscent.lean` | `every_articulation_leaves_further_frontier`, `articulative_ascent_nonterminal`, `no_terminal_articulative_ascent_nat`, etc. | Abstract non-terminal articulation chains. |

### ReflexiveUnfolding (Paper 57)

| File | Theorem | Statement |
|------|---------|-----------|
| `ReflexiveUnfolding/Theorems/NoTerminalCompletion.lean` | `no_terminal_reflexive_completion` | No terminal reflexive completion |
| `ReflexiveUnfolding/Theorems/NoTerminalCompletion.lean` | `semantic_remainder_implies_not_terminal` | Semantic remainder ⇒ not terminal |
| `ReflexiveUnfolding/Theorems/FromPaper56.lean` | `theory_remainder_implies_frontier_remainder` | Theory remainder ⇒ frontier remainder |
| `ReflexiveUnfolding/Theorems/FromPaper56.lean` | `irreducible_distance_implies_no_terminal_for_theory_frontier` | Irreducible distance ⇒ no terminal for theory frontier |
| `ReflexiveUnfolding/Core/LocalVsGlobal.lean` | `global_non_halting` | Global reflexive unfolding cannot halt |

### NecessaryReflexiveIntelligence (Paper 58)

| File | Theorem | Statement |
|------|---------|-----------|
| `NecessaryReflexiveIntelligence/Theorems/NecessaryAdjudication.lean` | `necessary_adjudication` | Nontrivial reflexive worlds necessarily adjudicative |
| `NecessaryReflexiveIntelligence/Theorems/NecessaryAdjudication.lean` | `adjudicative_level_necessary` | Adjudicative level necessary |
| `NecessaryReflexiveIntelligence/Bridge/FromNemS.lean` | `not_dead_mechanistic` | Not dead mechanistic |
| `NecessaryReflexiveIntelligence/Bridge/FromStructuredFramework.lean` | `not_brute_random` | Not brute random |

### CalculusOfIntelligence (Paper 59)

| File | Theorem | Statement |
|------|---------|-----------|
| `CalculusOfIntelligence/Core/IntelligenceLevels.lean` | `no_intelligence_without_frontier` | No nontrivial intelligence without frontier |
| `CalculusOfIntelligence/Core/IntelligenceLevels.lean` | `terminal_implies_no_nontrivial_intelligence` | Terminal completion ⇒ no nontrivial intelligence |
| `CalculusOfIntelligence/Core/IntelligenceLevels.lean` | `frontier_bearing_admits_intelligence` | Frontier-bearing systems admit intelligence levels |
| `CalculusOfIntelligence/Theorems/HierarchyTheorems.lean` | `minimal_intelligence_at_least_level_two` | Minimal reflexive intelligence at least level two |
| `CalculusOfIntelligence/Theorems/HierarchyTheorems.lean` | `hierarchy_monotonic` | Hierarchy monotonicity |

### RealityAsRecursiveIntelligence (Paper 60)

| File | Theorem | Statement |
|------|---------|-----------|
| `RealityAsRecursiveIntelligence/Theorems/UnifiedTheorem.lean` | `unified_theorem` | Nontrivial reflexive reality persists as recursive frontier-generation |
| `RealityAsRecursiveIntelligence/Theorems/UnifiedTheorem.lean` | `no_static_closure` | No static self-identity closure |
| `RealityAsRecursiveIntelligence/Theorems/UnifiedTheorem.lean` | `persists_as_recursive_frontier` | Persists as recursive frontier |
| `RealityAsRecursiveIntelligence/Theorems/UnifiedTheorem.lean` | `recursively_intelligent` | Recursively intelligent |
| `RealityAsRecursiveIntelligence/Theorems/UnifiedTheorem.lean` | `recursively_intelligent_when_nontrivial_reality` | Recursively intelligent when nontrivial reality |
| `RealityAsRecursiveIntelligence/Theorems/UnifiedTheorem.lean` | `recursive_intelligence_implies_no_terminal` | Recursive intelligence implies no terminal completion |

### GhostCollapse (Paper 61)

| File | Theorem | Statement |
|------|---------|-----------|
| `GhostCollapse/Theorems/GhostCollapse.lean` | `ghost_collapse` | Off-ledger entities either determinacy-relevant (illicit) or inert |
| `GhostCollapse/Theorems/GhostCollapse.lean` | `no_viable_ghost_ontology` | No viable ontology of real-but-off-ledger ghost entities |
| `GhostCollapse/Theorems/OffLedgerDeterminacy.lean` | `off_ledger_determinacy_implies_illicit` | Off-ledger determinacy implies illicit (no-free-bits) |
| `GhostCollapse/Theorems/SemanticNullity.lean` | `off_ledger_nondeterminacy_semantic_null` | Off-ledger nondeterminacy ⇒ semantic nullity |

### LedgerGround (Paper 62)

| File | Theorem | Statement |
|------|---------|-----------|
| `LedgerGround/Core/Principles.lean` | `no_self_actualizing_ledger_thm` | No articulated ledger can ground its own actuality |
| `LedgerGround/Theorems/GroundingSqueeze.lean` | `grounding_squeeze` | Grounding squeeze: adequate ground must be of different category |
| `LedgerGround/Bridge/ToSyntaxSemantics.lean` | `syntax_cannot_ground_from_paper53` | Syntax cannot ground (Paper 53) |
| `LedgerGround/Bridge/ToGhostCollapse.lean` | `no_ghost_ground_from_paper61` | No ghost ground (Paper 61) |
| `LedgerGround/Bridge/ToReflexiveFinality.lean` | `no_external_equal_status_ground_from_paper23` | No external equal-status ground (Paper 23) |

### Alpha (Paper 63)

| File | Theorem | Statement |
|------|---------|-----------|
| `Alpha/Theorems/AlphaTheorem.lean` | `alpha_theorem` | Nontrivial reflexive reality ⇒ necessary pre-categorial ground exists |
| `Alpha/Theorems/GroundExistence.lean` | `ground_existence_thm` | Ground existence |
| `Alpha/Theorems/GroundExistenceFromNoFreeBits.lean` | `ground_existence_from_no_free_bits` | Ground from no-free-bits |
| `Alpha/Theorems/AlphaSqueeze.lean` | `alpha_squeeze` | Alpha squeeze (grounding squeeze ⇒ Alpha) |

### GroundedExistence (Paper 64)

| File | Theorem | Statement |
|------|---------|-----------|
| `GroundedExistence/Theorems/GroundedExistenceThm.lean` | `grounded_existence_thm` | Whatever exists is Alpha-grounded |
| `GroundedExistence/Theorems/GroundedExistenceThm.lean` | `alpha_terminus` | Alpha as terminus |
| `GroundedExistence/Theorems/AlphaStructural.lean` | `alpha_not_grounded_by_other` | Alpha not grounded by same-level other |
| `GroundedExistence/Theorems/AlphaStructural.lean` | `alpha_not_object_level` | Alpha not object-level |
| `GroundedExistence/Theorems/AlphaStructural.lean` | `alpha_not_temporalized` | Alpha not temporalized |
| `GroundedExistence/Theorems/AlphaStructural.lean` | `alpha_primordial` | Alpha primordial |
| `GroundedExistence/Theorems/AlphaStructural.lean` | `alpha_not_null` | Alpha not null |
| `GroundedExistence/Theorems/AlphaStructural.lean` | `alpha_not_mere_infinity` | Alpha not mere infinity |

### QualiaAlphaGrounded (Paper 65)

| File | Theorem | Statement |
|------|---------|-----------|
| `QualiaAlphaGrounded/Theorems/AlphaGroundedQualia.lean` | `alpha_grounded_qualia` | Known qualia are irreducible semantic content whose actuality is Alpha-grounded |
| `QualiaAlphaGrounded/Theorems/AlphaGroundedQualia.lean` | `ledger_represented_implies_content_of` | Ledger-represented implies content-of qualia |

### AwarenessGround (Paper 67)

AwarenessGround formalizes Paper 67's awareness-locus results:
- `manifestation_implies_presence_at_awareness_locus`
- `exists_awareness_locus_of_alpha_presence`
- `awareness_locus_not_object_level_content`
- self-illumination is derived through the 67.6a–67.6c chain
- 67.6b is discharged from Paper 33's observer corollary / no complete self-model structure
- 67.7 is a definitional consequence of the derived self-illumination package

AwarenessGround library: 0 custom axioms; self-illumination and no-second-observer are derived, not postulated.

### AlphaNonNull (Paper 68)

| File | Theorem | Statement |
|------|---------|-----------|
| `AlphaNonNull/Theorems/AlphaNotNull.lean` | `object_empty_and_not_null` | 68.1: ObjectEmpty(α) ∧ ¬Null(α) |
| `AlphaNonNull/Theorems/AlphaNotNull.lean` | `object_empty_not_implies_null` | 68.2: ObjectEmpty(α) ⇏ Null(α) |
| `AlphaNonNull/Bridge/ToGroundManifestation.lean` | `manifestation_implies_not_semantically_sterile` | 68.3: (∃x. AlphaManifestation(x)) ⇒ ¬SemanticallySterile(α) |
| `AlphaNonNull/Bridge/ToGroundManifestation.lean` | `alpha_not_inert` | 68.5: ¬Inert(α) |

`manifestation_implies_grounding` is derived from the GroundManifestation machinery (`GroundMode` / `GroundedInAlphaWitnessed`), not axiomatized.

AlphaNonNull library: 0 custom axioms.

### UnifiedPresence (Paper 69)

| File | Theorem | Statement |
|------|---------|-----------|
| `UnifiedPresence/Theorems/UnifiedTheorem.lean` | `unified_three_aspects` | 69.4: Ground, articulation, manifestation are three coordinated aspects |
| `UnifiedPresence/Bridge/ToReflexiveClosure.lean` | `three_aspect_synthesis_instantiates_minimal_ternary_closure` | 69.T: Ontological triad instantiates Paper 56 minimal ternary closure form |

UnifiedPresence formalizes the three-aspect synthesis:
- `reality_is_alpha_grounded` (69.1)
- `world_process_is_recursive_articulation` (69.2)
- `qualia_and_realized_awareness_are_manifestation_in_awareness` (69.3)
- `three_aspect_synthesis` (69.4)

The Paper 56 bridge is formalized: the three-aspect synthesis instantiates the minimal ternary closure form at the ontological level.

UnifiedPresence library: 0 custom axioms, 0 sorry.

### GoldenBridge (Paper 70)

| File | Theorem | Statement |
|------|---------|-----------|
| `GoldenBridge/Theorems/FinalSynthesis.lean` | (imports UnifiedPresence) | Final integrated statement |

GoldenBridge formalizes the final wrapper theorem importing UnifiedPresence:
- `golden_bridge` / final synthesis theorem (70.1)

This library adds no new machinery; it imports the prior synthesis chain and states the final coordinated result.

GoldenBridge library: 0 custom axioms, 0 sorry.

---

## Reproduction

```bash
# From a clean checkout with nems-lean at ../nems-lean:
lake update
lake build
```

Expected output: `Build completed successfully.`

---

## Papers

LaTeX papers live in the NEMS_PAPERS suite (`Physics_Papers/NEMS_PAPERS/52_*` through `70_*`). This repo is the Lean artifact. See `0.1_PAPER_SUMMARIES.md` in the outer repo for one-paragraph summaries of each paper.

The reflexive-closure summit arc now runs through Papers 56, 64, 66, 67, 68, 69, and 70, culminating in the Golden Bridge theorem. Paper 56's minimal ternary closure form is structurally recapitulated in Papers 69–70.
