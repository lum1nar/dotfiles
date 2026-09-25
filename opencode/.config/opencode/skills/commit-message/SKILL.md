---
name: commit-message
description: Draft a Conventional Commits message from the staged diff and write it to .git/COMMIT_EDITMSG without running git commit. Use when the user asks to summarize staged changes or write a commit message.
---

# Commit Message

Turn the **staged diff** into a commit message and write it to `.git/COMMIT_EDITMSG`.

## Workflow

1. Inspect the staged diff with `git diff --staged`.
2. Look at `git log --oneline` and `git status` only to match the repository's existing
   conventions and to tell staged from unstaged changes.
3. Draft the message following the rules below.
4. Write the final message to `.git/COMMIT_EDITMSG`.
5. Do **not** run `git commit`.
6. Show the written message to the user.

## Rules

### Title

* Use Conventional Commits: `type(scope): summary`.
* Keep the title to **72 characters or fewer**.
* The summary is a single line.

### Body

* Use bullet points.
* Group bullets by module or layer (for example per package, per file, or per layer such as
  config / logic / tests).
* Each bullet states **what changed and why**.

### Scope of Content

* Include only what is actually present in the staged diff.
* Do not speculate about intent, requirements, or future work.
* Do not describe unstaged or unrelated changes.

### Tone

* Do not add filler such as "This commit...", "In this change...", or similar.
* Do not add trailers, co-author lines, or signatures unless the user asks.

## Output

Write the exact message (title, blank line, body) to `.git/COMMIT_EDITMSG`, then report it back
to the user.
