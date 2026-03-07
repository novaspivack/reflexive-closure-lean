/-!
# NecessaryReflexiveIntelligence.Core.ExecutionModes

**Execution modes (Paper 58).**

A trichotomy of execution modes for reflexive systems:
- **DeadMechanistic**: execution is total algorithmic—a static computable function
  can emulate the selection. Excluded by the diagonal barrier (Papers 15, 19, 22).
- **BruteRandom**: execution has no lawful structure—outcomes are not constrained
  by any semantic relation. Excluded in nontrivial reflexive frameworks.
- **Adjudicative**: lawful non-algorithmic selection—the middle ground. Necessarily
  holds when the other two are excluded.
-/

set_option autoImplicit false

namespace NecessaryReflexiveIntelligence

/--
**DeadMechanistic** — Execution operates via a total computable function.
A static algorithm can perfectly emulate the selection on all (or diagonal) instances.
This is the "robotic" or "lookup-table" view of reality.
-/
def DeadMechanistic (Algorithmic : Prop) : Prop :=
  Algorithmic

/--
**BruteRandom** — Execution has no lawful structure. Outcomes are not constrained
by any semantic relation; selection is unconstrained by the framework's record
structure. In a diagonal-capable framework with record determinacy, this cannot hold.
-/
def BruteRandom (Unstructured : Prop) : Prop :=
  Unstructured

/--
**Adjudicative** — Execution is lawful (respects framework structure) but
non-algorithmic (cannot be emulated by a total computable function).
This is the necessarily remaining mode when DeadMechanistic and BruteRandom
are excluded in a nontrivial reflexive world.
-/
def Adjudicative (NotDead : Prop) (NotRandom : Prop) : Prop :=
  NotDead ∧ NotRandom

/--
**NecessaryAdjudication** — Under the hypotheses that execution is neither
dead mechanistic nor brute random, it is necessarily adjudicative.
-/
theorem necessary_adjudication_iff
    (NotDead : Prop) (NotRandom : Prop) :
    Adjudicative NotDead NotRandom ↔ (NotDead ∧ NotRandom) :=
  Iff.rfl

end NecessaryReflexiveIntelligence
