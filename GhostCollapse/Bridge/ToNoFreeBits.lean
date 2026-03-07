import GhostCollapse.Core.Principles
import GhostCollapse.Theorems.OffLedgerDeterminacy

/-!
# GhostCollapse.Bridge.ToNoFreeBits

**Bridge to Paper 27 (No-Free-Bits).**

Theorem 61.1 rests on the no-free-bits principle from Paper 27: semantic content
that affects outcomes (reports, memory, adjudication, etc.) must be represented
in the ledger. Off-ledger determinacy-relevant content would be a "free bit"—
hence illicit. This module documents the bridge.

## Paper 27 connection

NoFreeBits (Paper 27) excludes semantic content that affects world-type
distinctions without being internally represented. Determinacy-relevant
content affects reports, memory, adjudication, self-models—hence world-type
distinctions. Off-ledger + determinacy-relevant ⇒ free bit ⇒ contradiction.

The axiom `no_free_bits_off_ledger_determinacy` in Core.Principles encodes
this bridge. Theorem `off_ledger_determinacy_implies_illicit` (61.1) is the
formal statement.
-/
