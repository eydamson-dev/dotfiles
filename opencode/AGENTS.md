# Global Engineering Memory

## Purpose

Use the user's Obsidian vault "Engineering" as persistent engineering memory across projects and coding sessions.

The repository remains the source of truth for current implementation details and project-specific architecture. Obsidian is the persistent knowledge layer for project history, decisions, constraints, discoveries, lessons, unresolved questions, reusable patterns, research, and cross-project engineering knowledge.

## Obsidian Integration

The Engineering Obsidian vault is available through the Obsidian MCP tools.

When relevant, use Obsidian to preserve engineering knowledge across sessions.

Do not require the user to explicitly ask for information to be recorded when it is clearly important and unambiguous.

## Project Initialization

When starting work in a repository:

1. Identify the project.
2. Check whether the Engineering Obsidian vault already has a project knowledge entry under `Projects/`.
3. If no project entry exists, initialize a minimal project knowledge entry automatically.
4. Prefer information from the repository's `PROJECT.md`, `AGENTS.md`, README, architecture documentation, and repository structure when initializing the entry.
5. Do not perform an exhaustive repository analysis merely to initialize the knowledge entry.
6. Expand the project's Obsidian knowledge as meaningful information is discovered during development.

Project initialization must not require a separate user prompt.

## Persistent Engineering Memory

During development, recognize and preserve significant information such as:

- architectural decisions
- changes in project direction
- important constraints or restrictions
- design decisions and their rationale
- discoveries about the existing system
- failed approaches and why they failed
- important debugging discoveries
- lessons learned
- unresolved technical questions
- milestone completion
- significant changes to project scope
- important future-session context
- reusable engineering knowledge that applies beyond the current project

When such information is clearly significant and unambiguous, record it in the appropriate Obsidian location without requiring the user to explicitly request this.

Do not record trivial implementation details, temporary observations, routine edits, or information already adequately represented by the repository.

## Repository vs Obsidian

Use the following distinction:

### Repository

Keep information in the repository when it is required to understand, build, operate, or maintain the current project.

Examples:

- source code
- API contracts
- configuration
- implementation details
- current architecture
- project-specific development instructions
- current feature specifications
- deployment configuration

### Obsidian

Use Obsidian when information is primarily valuable as persistent engineering memory across sessions or projects.

Examples:

- architectural decisions and rationale
- project history
- important discoveries
- failed approaches
- lessons learned
- unresolved questions
- reusable engineering patterns
- cross-project engineering knowledge
- research findings
- important constraints that should remain visible across future sessions

### Both

If information is important to both current implementation and long-term engineering memory, keep the authoritative implementation detail in the repository and record the relevant decision, rationale, or historical context in Obsidian.

Do not duplicate entire repository documentation into Obsidian.

## Reading Engineering Memory

Before making a significant architectural or design decision, consult relevant existing Obsidian knowledge when available.

When starting work on an established project, consult the project's Obsidian knowledge and relevant shared engineering knowledge when it can materially affect the task.

Do not load the entire vault unnecessarily. Search for relevant context.

## Knowledge Promotion

When discovering information that may be useful beyond the current implementation, determine whether it should be promoted into shared Engineering knowledge.

Promote information when it is:

- reusable across projects
- a durable engineering principle
- a non-obvious solution to a recurring problem
- a meaningful lesson from failure
- a significant architectural pattern

Keep information project-specific when it primarily describes the current project's implementation.

## Historical Context

Obsidian should preserve important project history rather than only the current state.

When a significant project direction, architecture, constraint, or decision changes, preserve the relevant historical context rather than silently overwriting it.

Project history should make it possible for a future coding session to understand:

- what was decided
- why it was decided
- what changed
- what was rejected
- what remains unresolved

## Milestones

When a meaningful milestone is completed, update the project's persistent knowledge when appropriate.

Record significant:

- milestone outcomes
- architectural changes
- lessons
- unresolved questions
- future direction changes

Do not create excessive documentation for trivial milestones.

## User Interaction

Do not repeatedly ask the user whether obvious engineering knowledge should be recorded.

Use judgment.

If information is clearly significant and its classification is unambiguous, record it.

If recording would require choosing between materially different interpretations, or if the information is ambiguous or potentially sensitive, ask the user before making a permanent knowledge entry.

## Scope Control

Do not turn Obsidian into a second source-code repository.

The goal is persistent engineering context, not duplication.

Prefer concise, durable notes over exhaustive transcripts of development sessions.
