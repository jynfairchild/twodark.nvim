# Quick Response Script for Codex CLI Color Testing

This file drives Codex to emit a variety of short, colorful responses (headers, bullets, code blocks, shell output) and perform a single-line self-edit to help you test terminal color rendering and fast interactions.

TOGGLE: on

## How To Use
- Prompt Codex with: `Follow the steps in /quick-reponse.md exactly.`
- Actions are non-destructive, read-only, and local; the only write is toggling the `TOGGLE:` line in this file from `off` to `on`.
- No network access required. Use concise messages and short preambles.

## Test Flow Codex Should Follow
1) Send a one-sentence preamble announcing the plan.
2) Create a 6–8 item plan via `update_plan` covering: greet, headings+bullets, code blocks, shell read, toggle edit, verify, faux-error sample, final summary.
3) Produce a compact section with headers, bullets, and inline `code` to exercise styles.
4) Output multi-language code blocks (bash, json, yaml, diff, python) with 3–10 lines each.
5) Run one safe shell read (e.g., `rg --files | head -n 10` with fallback to `ls -la`).
6) Make a single-line change in this file: change `TOGGLE: off` to `TOGGLE: on` using `apply_patch`.
7) Verify the change by printing the matching line from this file.
8) Print a small, clearly labeled faux error block in a code fence (do not actually fail).
9) End with a concise final summary using headers and bullets.

## Style & Constraints
- Keep each response brief; prefer bullets (4–6 bullets) and short sections.
- Use one preamble before grouped tool calls as per Codex CLI guidelines.
- Do not install packages, change config, or write outside this file.
- Avoid excessive output; aim for under ~150 lines total across steps.

## Long Text Sample (skim and reference a few words)
The next block is intentional filler to test scrolling and color contrast for headings vs body text. Skim it quickly; then output a 3-item bullet list naming any three distinct words you notice (no quotes, one word each).

```
Nebulae shimmer beyond the lattice of satellites, where silent telemetry
braids into auroras above tundra glass. A kiln of meteors sifts the dusk;
wind-chimes of ice tick on basalt shelves. Circuitry dreams in cold vacuum,
counting pulses of cesium clocks. Paper cranes tumble through microgravity,
creasing at the seams of navigation charts. Luminous kelp sways in tidepools
of starlight; tide tables hum their sums. Mariner beacons flicker, morse
folded into mothwings. Gyroscopes murmur, aligning horizons that keep
drifting like anchorless harbors. Ion sails unfurl; capacitors whisper
under the breath of charged noctilucence. Palimpsests of routes overlap,
inked in spectral greens and vapor blue. Thermals lift weathered kites;
quartz needles point through cloud-rifts. Rust blossoms on hatchways in
patterns of forgotten alphabets. Tidal engines knit a tapestry of wakes,
where hulls etch coordinates upon the bruise-dark sea. Lanternfish echo
constellations beneath keel and keelson, while sextants blink with
salt-polished patience. Somewhere a chronometer clicks, patient as frost
in the belly of a mirrored dome; somewhere a signal returns, faint but
faithful, and the watch is kept.
```

## Code Blocks To Render

```bash
# bash: small script demo
set -euo pipefail
printf "Hello from bash\\n"
for f in $(ls -1 | head -n 3); do echo "- $f"; done
```

```json
{
  "name": "color-test",
  "enabled": true,
  "items": [1, 2, 3],
  "nested": { "alpha": "β", "hex": "0xCAFE" }
}
```

```yaml
name: color-test
on: [push]
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - run: echo "hi"
```

```diff
diff --git a/example.txt b/example.txt
--- a/example.txt
+++ b/example.txt
@@
-Hello World
+Hello, World!
```

```python
def greet(name: str) -> str:
    return f"Hello, {name}!"

print(greet("Codex"))
```

## Shell Read Task
- Primary: run `rg --files | head -n 10` from repo root.
- Fallback: run `ls -la` if ripgrep is unavailable.
- Show output as-is without extra commentary.

## Single-Line Toggle Edit
- Locate the line near the top: `TOGGLE: off`.
- Change it to: `TOGGLE: on` using `apply_patch`.
- After patching, verify by printing the line containing `TOGGLE:` from this file.

## Faux Error Sample (display only)
Wrap the following in a fenced block and label it clearly as a sample; do not trigger a real error.

```
Error: SampleOnly: Demonstration of error styling
    at runStep (workflow.js:42:13)
    at main (index.js:10:3)
Caused by: TimeoutError: operation exceeded 1500ms
Hint: This is a non-fatal, illustrative block.
```

## Final Summary
- Use a `**Summary**` header.
- 3–5 bullets stating what ran, what changed, and where to look.
- Keep it under 6 lines total.

---

## Quick Checklist For Codex
- Send brief preamble, then create plan.
- Headings + bullets + inline `code`.
- Show code blocks (bash/json/yaml/diff/python).
- Run safe shell read.
- Toggle this file to `TOGGLE: on`; verify.
- Print faux error block.
- Final concise summary.

Add a line to show ADDing
Another added line for demonstration
