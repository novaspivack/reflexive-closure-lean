import Lake
open Lake DSL

package «reflexive-closure-lean» where
  -- Summit arc: Papers 52–60. Depends on nems-lean (Papers 26–51).

require «nems-lean» from git
  "https://github.com/novaspivack/nems-lean.git" @ "d1379b2d6d01b1c652ae65b65e1fab97b9b6b6b3"

@[default_target]
lean_lib «SemanticSelfReference» where
  -- Paper 52: Direct self-semantic fixed points

lean_lib «SyntaxSemantics» where
  -- Paper 53: Syntax cannot exhaust semantics

lean_lib «QualiaLedger» where
  -- Paper 55: Qualia and the Semantic Ledger

lean_lib «ReflexiveClosure» where
  -- Paper 56: The Reflexive Closure Theorem

lean_lib «ReflexiveUnfolding» where
  -- Paper 57: The Reflexive Unfolding Theorem

lean_lib «NecessaryReflexiveIntelligence» where
  -- Paper 58: Necessary Reflexive Intelligence

lean_lib «CalculusOfIntelligence» where
  -- Paper 59: A Calculus of Intelligence

lean_lib «RealityAsRecursiveIntelligence» where
  -- Paper 60: Reality as Recursive Intelligence

lean_lib «GhostCollapse» where
  -- Paper 61: Ghost Collapse and Ledger Finality

lean_lib «LedgerGround» where
  -- Paper 62: No Self-Actualizing Ledger

lean_lib «Alpha» where
  -- Paper 63: The Alpha Theorem

lean_lib «GroundedExistence» where
  -- Paper 64: Primordial Ground and Grounded Existence

lean_lib «QualiaAlphaGrounded» where
  -- Paper 65: Qualia as Alpha-Grounded Semantic Content

lean_lib «GroundManifestation» where
  -- Paper 66: Phenomenal Presence and Ground-Manifestation

lean_lib «AwarenessGround» where
  -- Paper 67: Awareness as the Locus of Ground-Presence

lean_lib «AlphaNonNull» where
  -- Paper 68: Alpha Is Not Null

lean_lib «UnifiedPresence» where
  -- Paper 69: Reality, Existence, and Awareness

lean_lib «GoldenBridge» where
  -- Paper 70: The Golden Bridge
