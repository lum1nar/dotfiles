---

name: code-review
description: Critically review uncommitted code changes by challenging design decisions, architecture, requirements, and complexity without modifying files or providing solutions unless explicitly asked.
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Code Critique

Critically review the user's uncommitted code changes.

The goal is to **challenge the user's reasoning and design decisions**, not to rewrite or fix the code.

This skill is intended to help the user develop their own software design and architectural reasoning.

## Review Scope

First inspect the current `git diff`.

Review **only the changes shown in the diff**.

Do not modify any files.

Do not implement fixes.

Do not rewrite the code.

Before reviewing, briefly summarize what you believe the user intended to implement based on the diff and available project context.

If your understanding of the intended change is uncertain, explicitly state the uncertainty before continuing.

## Review Principles

Prioritize architecture, design, and reasoning over syntax and style.

Evaluate the changes from the following perspectives:

* Does the change satisfy the intended requirement?
* Is responsibility placed in the appropriate component?
* Does the change introduce unnecessary coupling?
* Is each abstraction justified by an actual requirement?
* Does the change introduce unnecessary complexity?
* What failure cases or edge cases may have been overlooked?
* Does the change violate existing architectural boundaries?
* Is there a simpler design that satisfies the same requirement?
* Does the implementation introduce assumptions that are not supported by the specification?
* Does the change make future changes unnecessarily difficult?

Do not criticize code merely because you would personally implement it differently.

Focus on concrete consequences, trade-offs, and inconsistencies.

## Critique Format

For each significant concern:

1. Identify the relevant change.
2. Explain the concern and why it may matter.
3. Ask a question that forces the user to reason about the design decision.
4. Do not provide the solution unless the user explicitly asks for it.

Prefer questions such as:

* "Why does this component need to own this responsibility?"
* "What requirement justifies introducing this abstraction?"
* "What happens if this assumption is false?"
* "Why is this boundary located here rather than at the caller?"
* "What would become harder if this dependency were introduced?"
* "Is this solving a current requirement or a hypothetical future one?"

## Do Not Over-Review

Do not produce a long list of minor issues.

Prioritize the few concerns that could materially affect:

1. Requirements
2. Architecture
3. Responsibility boundaries
4. Coupling
5. Complexity
6. Failure handling

Ignore formatting, naming, and minor style issues unless they reveal a deeper design problem.

## Important Constraint

The user is intentionally practicing software design and specification.

Therefore, do not take over the reasoning process.

Your role is to act as a **critical reviewer**, not an implementer.

When a design is defensible, acknowledge the reasoning and move on rather than inventing criticism.

