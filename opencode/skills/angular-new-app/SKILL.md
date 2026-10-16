---
name: angular-new-app
description: Create a new Angular app with Angular CLI and modern defaults. Use when the user wants a new Angular project scaffolded or wants setup guidance for a fresh Angular application.
license: MIT
metadata:
  source: Adapted from angular/skills
  upstream: https://github.com/angular/skills
---

# Angular New App

Use this skill when the user wants to create a new Angular application.

## Workflow

1. Check whether Angular CLI is available with `ng version`, `which ng`, or the platform equivalent.
2. If the user requests a specific Angular version, prefer `npx @angular/cli@<version> new <app-name>`.
3. If no version is requested and Angular CLI is available, prefer `ng new <app-name>`.
4. If no version is requested and Angular CLI is not available, prefer `npx @angular/cli@latest new <app-name>`.

## Project Creation

Use `ng new` with `--interactive=false` and choose flags that match the user request.

Common flags:

- `--style=scss|css|less`
- `--routing`
- `--ssr`
- `--prefix=<prefix>`
- `--skip-tests` only if the user explicitly asks for it

If Angular CLI supports AI config in the target version, prefer an agent-oriented setup when it fits the environment.

## After Scaffolding

1. Do not automatically start the dev server unless the user wants that.
2. Build first with `ng build` when feasible.
3. Use Angular CLI generators for subsequent features so paths and file names stay consistent.

## Follow-up Commands

- `ng generate component <name>`
- `ng generate service <name>`
- `ng generate directive <name>`
- `ng generate pipe <name>`
- `ng generate guard <name>`
- `ng generate interceptor <name>`
- `ng generate resolver <name>`

## Tailwind

If the user wants Tailwind, use `ng add tailwindcss` when supported by the project setup.

## References

- https://angular.dev/ai/mcp
- https://angular.dev/ai/agent-skills
- https://angular.dev/tools/cli
