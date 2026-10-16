---
name: angular-developer
description: Angular code, components, services, routing, forms, signals, SSR, ARIA, testing, styling, migrations, and CLI tooling. Use when working on Angular apps or when the user asks for Angular best practices.
license: MIT
metadata:
  source: Adapted from angular/skills
  upstream: https://github.com/angular/skills
---

# Angular Developer

Use this skill when the task is about building or modifying an Angular application.

## Core Rules

1. Detect the Angular version before giving version-sensitive guidance.
2. Prefer Angular CLI generators for components, services, directives, pipes, guards, and routes.
3. After generating or changing Angular code, run `ng build` when feasible and fix any build errors before finishing.

## Best Practices

1. Prefer standalone APIs and current Angular conventions.
2. Prefer signals for local state and derived state.
3. Prefer modern template control flow such as `@if`, `@for`, and `@switch` when supported by the project version.
4. Prefer `inject()` over constructor injection when it matches the project style and Angular version.
5. Keep components focused, accessible, and easy to test.
6. Follow Angular style guide conventions and keep generated code idiomatic.

## Forms

1. For new Angular apps on modern versions, prefer signal forms when available.
2. For existing apps, match the established form strategy unless the user asks for migration.
3. Use reactive forms for complex forms and template-driven forms only for simpler legacy scenarios.

## Routing

1. Use lazy loading where appropriate.
2. Use guards and resolvers intentionally, not by default.
3. Consider SSR, prerendering, and hydration implications when routing or data loading changes affect rendering.

## Accessibility

1. Preserve keyboard support, focus order, labels, semantics, and ARIA correctness.
2. For advanced headless widgets, align with Angular Aria and WCAG AA expectations.

## Testing

1. Add or update tests when the repo already expects them.
2. Prefer stable Angular testing patterns and avoid brittle DOM assertions.

## Tooling

1. Use `ng generate` for scaffolding.
2. Use `ng add` for ecosystem integrations when appropriate.
3. Use the Angular MCP server tools when they are available, especially:
   - `get_best_practices`
   - `find_examples`
   - `search_documentation`
   - `list_projects`
   - `ai_tutor`

## References

When deeper framework guidance is needed, prefer official Angular docs:

- https://angular.dev/guide/components
- https://angular.dev/guide/routing
- https://angular.dev/guide/forms
- https://angular.dev/ai/mcp
- https://angular.dev/ai/agent-skills
