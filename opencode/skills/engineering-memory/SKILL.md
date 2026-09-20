---
name: engineering-memory
description: Manage persistent engineering knowledge in the user's Obsidian Engineering vault across projects and coding sessions.
---

# Engineering Memory

Implements the persistent engineering-memory workflow defined in the global
`~/.config/opencode/AGENTS.md`.

The repository remains the source of truth for current implementation details
and project-specific architecture. The Obsidian "Engineering" vault is the
persistent knowledge layer for project history, decisions, constraints,
discoveries, lessons, unresolved questions, reusable patterns, and
cross-project engineering knowledge.

## When to Load

Load this skill when any of the following is relevant:

- project initialization or first contact with a repository
- persistent engineering memory (recording decisions, lessons, discoveries)
- project history, architectural decisions, or changes in direction
- constraints/restrictions, failed approaches, unresolved questions
- knowledge promotion into shared Engineering knowledge
- milestone completion that should update project knowledge

Do **not** require the user to explicitly invoke this skill for normal project
work. When the global `AGENTS.md` rules already indicate that persistent
knowledge should be maintained, apply them directly. Use this skill to drive
the workflow, not as a gate that needs a manual trigger.

## Normal Workflow

1. **Identify the project.** Determine the repository name and its
   authoritative documentation (`PROJECT.md`, `AGENTS.md`, README,
   architecture docs, repository structure).

2. **Locate or initialize the project entry.** Check for a project knowledge
   note under `Projects/` in the Engineering vault. If none exists, create a
   minimal one (see "Project Initialization" below).

3. **Read existing context.** When beginning meaningful work, read the
   project's Obsidian note and any relevant shared knowledge before making a
   significant architectural or design decision.

4. **Search only relevant parts of the vault.** Do not load the entire vault.
   Use targeted searches (by project name, tag, or path) to find related
   notes, patterns, decisions, or lessons.

5. **Classify new information** as one of:
   - **Repository** — required to understand, build, operate, or maintain the
     current project (source, API contracts, config, current architecture,
     feature specs, deployment config).
   - **Obsidian** — valuable as persistent memory across sessions/projects
     (decisions and rationale, history, discoveries, failed approaches,
     lessons, unresolved questions, reusable patterns, research, durable
     constraints).
   - **Both** — keep the authoritative implementation detail in the repo and
     record the decision, rationale, or history in Obsidian.

6. **Record significant, unambiguous information** automatically, without
   prompting the user, including:
   - architectural decisions
   - rationale for decisions
   - project direction changes
   - constraints/restrictions
   - discoveries about the existing system
   - failed approaches and why they failed
   - debugging lessons
   - unresolved questions
   - milestone outcomes
   - important future-session context

7. **Promote genuinely reusable knowledge** into shared folders when it is a
   durable engineering principle, a non-obvious solution to a recurring
   problem, a meaningful lesson from failure, or a significant architectural
   pattern:
   - `Patterns/` — reusable engineering patterns
   - `Architecture/` — architectural knowledge and decisions
   - `Lessons/` — lessons from successes and failures
   - `Research/` — research findings

8. **Preserve historical context.** When a significant direction, architecture,
   constraint, or decision changes, preserve the history rather than silently
   overwriting it. A future session should be able to see what was decided,
   why, what changed, what was rejected, and what remains unresolved.

9. **Stay concise.** Do not duplicate repository documentation into Obsidian.
   Do not turn Obsidian into a second source-code repository. Prefer concise,
   durable notes over exhaustive transcripts.

10. **Update after milestones.** When a meaningful milestone is completed,
    record outcomes, architectural changes, lessons, unresolved questions, and
    future-direction changes. Do not create excessive documentation for
    trivial milestones.

## Project Initialization

This is automatic and must not require a separate user prompt.

When starting work in a repository:

1. Identify the project.
2. Check whether the Engineering vault already has a project entry under
   `Projects/`.
3. If none exists, initialize a minimal project entry automatically.
4. Source the initial content from the repository's `PROJECT.md`, `AGENTS.md`,
   README, architecture documentation, and repository structure.
5. Do **not** perform an exhaustive repository analysis merely to initialize
   the entry.
6. Expand the project's Obsidian knowledge naturally as meaningful
   information is discovered during development.

A minimal project note should contain enough context for a future session to:

- recognize the project
- locate its repository (the source of truth)

A minimal entry is roughly:

```markdown
# <Project Name>

## Repository

`<path-or-url>`

## Project Documentation

The repository's `PROJECT.md` (or equivalent) is the project and architecture
source of truth.

## Engineering Knowledge

Reusable engineering knowledge extracted from this project belongs in the
shared Engineering vault rather than being duplicated here.

## Related Knowledge

_None documented yet._
```

## Migration / Bootstrap (Explicit Operation)

Migration is a deliberate, explicit operation — distinct from the automatic
initialization described above.

- Migration may process multiple repositories in a single operation.
- Discover the user's existing projects rather than prompting for each one.
- For each project, inspect only its authoritative documentation and relevant
  history (`PROJECT.md`, `AGENTS.md`, README, architecture docs, decision logs,
  changelogs).
- Create or update the corresponding `Projects/` entry.
- Extract significant historical decisions, constraints, discoveries, lessons,
  and project direction only when they are actually documented.
- Do **not** invent historical information.
- Do **not** copy entire `PROJECT.md` files into Obsidian.
- Do **not** create unnecessary notes.
- Preserve existing Obsidian knowledge rather than overwriting it.

## User Interaction

- Do not repeatedly ask whether obvious engineering knowledge should be
  recorded. Use judgment.
- If information is clearly significant and its classification is unambiguous,
  record it.
- If recording requires choosing between materially different interpretations,
  or if the information is ambiguous or potentially sensitive, ask the user
  before making a permanent entry.

## Scope Control

Keep Obsidian as persistent engineering context, not a second source-code
repository. Prefer concise, durable notes. Do not duplicate entire repository
documentation into Obsidian.
