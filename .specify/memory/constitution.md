<!--
Sync Impact Report
- Version change: 1.0.0 → 1.1.0
- Modified principles:
  - I. Plan-Driven Delivery (NON-NEGOTIABLE) → I. Code Quality as a Release Gate (NON-NEGOTIABLE)
  - II. Flutter Web Architecture Discipline → II. Testing Standards and Change Safety (NON-NEGOTIABLE)
  - III. Quality-First Engineering → III. User Experience Consistency
  - IV. Performance and Responsiveness by Default → IV. Performance Requirements
  - V. Readability, Consistency, and Safety → V. Architectural Consistency and Delivery Discipline
- Added sections: Quality Benchmarks
- Removed sections: None
- Templates requiring updates:
  - ✅ .specify/templates/plan-template.md
  - ✅ .specify/templates/spec-template.md
  - ✅ .specify/templates/tasks-template.md
  - ✅ .github/agents/speckit.constitution.agent.md (reviewed, no changes required)
- Follow-up TODOs: None
-->
# Nabd Care Dashboard Constitution

## Core Principles

### I. Code Quality as a Release Gate (NON-NEGOTIABLE)
All production code MUST be clear, maintainable, and aligned with project architecture.
Every change MUST pass static analysis and follow naming, layering, and null-safety
standards. Merges are blocked when code quality gates fail. Rationale: code quality is
the first control against long-term instability.

### II. Testing Standards and Change Safety (NON-NEGOTIABLE)
Behavior-changing work MUST include or update automated tests at the correct level
(unit, widget, integration). Bug fixes MUST add a regression test when feasible.
Test omissions are allowed only for non-behavioral changes and MUST be justified.
Rationale: stable delivery requires repeatable verification of intended behavior.

### III. User Experience Consistency
User-facing changes MUST preserve consistent interaction patterns, navigation behavior,
layout rhythm, and visual language across screens. Features MUST include explicit loading,
empty, error, and success states where applicable. Rationale: consistency reduces user
friction and improves trust in the product.

### IV. Performance Requirements
Features MUST define measurable performance expectations before implementation and verify
them before release. UI code MUST avoid unnecessary rebuilds and expensive synchronous work
on render-critical paths. Rationale: Flutter web quality depends on responsive interaction
and predictable runtime behavior.

### V. Architectural Consistency and Delivery Discipline
Implementation MUST follow `plan.md` phases and maintain clear boundaries between `core`,
`data`, `domain`, and `presentation`. Cross-layer coupling and duplicated business logic
MUST be eliminated or explicitly justified. Rationale: disciplined structure enables safe
iteration as the codebase grows.

## Technical Standards

- Framework: Flutter web with sound null safety.
- Code quality baseline: `flutter analyze` MUST pass before merge.
- Testing baseline: changed behavior requires `flutter test` coverage at appropriate scope.
- UX baseline: shared design patterns and common state handling MUST be applied.
- Performance baseline: release-impacting screens require evidence of acceptable responsiveness.
- Dependency policy: new dependencies MUST include rationale and avoid capability duplication.

## Quality Benchmarks

- Code review MUST verify readability, responsibility boundaries, and side-effect control.
- Testing review MUST verify meaningful assertions, not only execution-path coverage.
- UX review MUST verify consistency with existing shared components and navigation patterns.
- Performance review MUST verify the absence of avoidable UI-thread bottlenecks.

## Delivery Workflow

1. Define acceptance criteria including quality, testing, UX, and performance expectations.
2. Implement in small increments following `plan.md` and feature boundaries.
3. Run required validation (`flutter analyze`, `flutter test`, and relevant manual checks).
4. Document deviations from expected standards with explicit remediation tasks.
5. Keep pull requests focused; separate structural refactors from behavior changes.

## Governance

This constitution supersedes ad-hoc implementation preferences in this repository.
Amendments require documented rationale, impact analysis, and maintainer approval.

Versioning policy:
- MAJOR: backward-incompatible governance changes or principle removals/redefinitions.
- MINOR: new principles or materially expanded constraints and standards.
- PATCH: clarifications and non-semantic wording improvements.

Compliance review expectations:
- Every implementation plan MUST include constitution gate checks.
- Reviewers MUST block merges that violate non-negotiable principles.
- Temporary exceptions MUST include owner, scope, expiry, and remediation plan.

**Version**: 1.1.0 | **Ratified**: 2026-04-21 | **Last Amended**: 2026-04-21
