# MoneyLog — Codex Project Instructions

## 1. Project Identity

MoneyLog is a privacy-focused personal finance application. The primary goal is to build a reliable mobile app first, followed by a complementary laptop-hosted website.

The developer is learning Flutter and Dart. Explain unfamiliar concepts in simple language and provide practical, incremental instructions.

This repository is the shared source of project knowledge for all developers and Codex accounts. Do not depend on previous ChatGPT or Codex conversation history, private memory, or another account's context.

## 2. Source of Truth

Use the following files as the persistent project knowledge base:

- `docs/PROJECT_SPEC.md` — confirmed product requirements.
- `docs/ARCHITECTURE.md` — actual technical architecture.
- `docs/IMPLEMENTATION_STATUS.md` — implementation progress, defects, and verification evidence.
- `docs/ROADMAP.md` — development priorities, dependencies, and next tasks.
- `docs/DECISIONS.md` — confirmed decisions and unresolved questions.
- `docs/UI_UX_SPEC.md` — intended screen behavior and confirmed UI/UX changes.
- `docs/UI_REFERENCE_CATALOG.md` — index and interpretation of original UI reference screenshots.
- `docs/reference-images/` — original visual reference images.

Read this file and the relevant project documents before substantial work.

The actual source code is authoritative for what is currently implemented. The product specification and decisions define what the application is supposed to do.

When implementation conflicts with a confirmed requirement, record the discrepancy and address it within the assigned scope. Never silently redefine the requirement to match the existing code.

If a document or image is missing or inaccessible, state that limitation instead of inventing its contents.

## 3. Mandatory Startup Workflow

At the beginning of a new task:

1. Read this `AGENTS.md`.
2. Read the relevant project documentation. For substantial work, review all six core documents: `PROJECT_SPEC.md`, `ARCHITECTURE.md`, `IMPLEMENTATION_STATUS.md`, `ROADMAP.md`, `DECISIONS.md`, and `UI_UX_SPEC.md`, plus `UI_REFERENCE_CATALOG.md` when available.
3. Inspect the current Git branch and working-tree status.
4. Review relevant source files, tests, database migrations, and dependencies.
5. Identify the requested behavior, acceptance criteria, risks, and required verification.
6. Check whether previous work or uncommitted changes affect the task.
7. State a concise understanding of the task and its scope before substantial implementation.

Do not repeatedly ask the developer to explain requirements already documented in the repository.

Ask a question only when an unresolved decision materially affects correctness, security, data integrity, or user experience.

## 4. Protect Existing Work

- Inspect relevant files before editing them.
- Never replace the existing project with a newly generated application.
- Do not delete, rename, or reorganize existing files without authorization.
- Preserve existing functionality unless a change is requested.
- Inspect Git status before making changes.
- Preserve unrelated uncommitted changes.
- Prefer small, reviewable, incremental modifications.
- Do not perform destructive database operations or migrations that could erase financial data.
- Do not commit, push, reset, rebase, or discard changes without appropriate authorization.
- Inspect the final diff before reporting completion.

## 5. Product Priorities

Follow the priorities and dependencies documented in `docs/ROADMAP.md`.

The overall development order is:

1. Stabilize the existing mobile application and establish a reliable Flutter testing baseline.
2. Protect financial-data integrity, persistence, and migrations.
3. Complete transaction, account, category, summary, and budget functionality.
4. Implement secure portable `.mbak` backup and restore.
5. Complete PDF reporting, charts, and exports.
6. Finish dark-theme support and mobile quality checks.
7. Develop the temporary laptop-hosted website only after the mobile foundation and backup/restore are reliable.

Do not skip prerequisite work merely to begin a later feature.

## 6. Confirmed Product Requirements

- The phone is the primary owner of the user's financial data.
- Do not introduce a mandatory cloud service or permanent backend.
- Provide income and expense summaries for Daily, Monthly, 3 Months, Yearly, and All Time periods.
- Do not include Balance in the Home/Records summary.
- Categories belong in the Home hamburger menu.
- Target replaces Categories in the bottom navigation.
- A global floating `+` button opens Add New Transaction.
- Support distinct Expense, Income, and Transfer transaction types.
- Transfers must not be counted as income or expenses.
- Support multiple accounts and opening balances.
- Support built-in and user-created categories, including colors and separate income and expense category lists.
- Preserve transaction history and data relationships when categories or accounts change.
- Support budget goals, transaction descriptions, and bill attachments as required by the specification.
- The portable backup extension is `.mbak`.
- Backup/restore is distinct from CSV and PDF export.
- PDF export options are Basic; Expenses + descriptions; and Expenses + descriptions + bills.
- PDF reports should support appropriate totals, date ranges, charts, and category selection as specified in the project documentation.
- Support a dark theme.
- The future website is a temporary laptop-hosted workspace for transferring and editing data packages, not a permanent backend.

Consult `docs/PROJECT_SPEC.md` and `docs/DECISIONS.md` for complete requirements and unresolved details. Do not assume this summary is exhaustive.

Do not silently change confirmed requirements. Record conflicts and seek approval before changing product behavior.

## 7. UI/UX Reference Images

Before implementing or modifying a screen:

1. Read `docs/UI_UX_SPEC.md`.
2. Read `docs/UI_REFERENCE_CATALOG.md`.
3. Inspect the relevant original images in `docs/reference-images/`.
4. Compare the reference with the current screen and Flutter implementation.
5. Identify the confirmed requirements and requested differences.
6. Implement only the agreed scope.

The reference catalog must cover every image actually present in the folder, including descriptively named screenshots and generically named images such as `image 1.jpg`, where present.

Do not infer image contents from filenames alone. Open the actual images before describing them.

For each reference, document its exact filename, observed screen or state, visible elements, related screenshots, relevant requirements, and corresponding source files when identifiable.

Distinguish between:

- Details visibly present in a screenshot.
- Confirmed user requirements.
- Proposed interpretations.
- Unresolved questions.

Screenshots are visual references, not automatic authorization to copy every visible feature.

Confirmed MoneyLog requirements take precedence over conflicting older screenshots. Do not generate replacement images or rename original reference images without approval.

If an image cannot be accessed or interpreted, mark it unverified.

## 8. Privacy and Security

- Keep financial records and bill attachments under the user's control.
- Do not transmit financial data to external services without explicit approval.
- Do not log passwords, backup keys, or sensitive financial records.
- Do not store plaintext backup passwords in exported packages.
- Use established cryptographic libraries and authenticated encryption for protected backups.
- Use an appropriate password-based key derivation function.
- Validate backup structure, version, integrity, relationships, and attachment paths before restoring data.
- Protect against corrupted, incompatible, or malicious import files.
- Define safe failure and recovery behavior for imports and restores.
- Never claim a security feature is complete without verifying its implementation.
- Never erase existing financial data during a failed restore or import.

## 9. Development Practices

- Inspect existing dependencies and architecture before introducing new ones.
- Follow established project conventions where practical.
- Use clear, maintainable Flutter and Dart code.
- Separate UI, validation, data access, and business logic appropriately.
- Test financial calculations, persistence, account relationships, import/export, and backup/restore carefully.
- Add or update tests for affected behavior.
- Run relevant tests, formatting, static analysis, and build checks when feasible.
- Explain important changes in simple language.
- Ask before making major architectural decisions or changing confirmed requirements.
- Avoid unrelated refactoring.

## 10. Evidence and Implementation Status

Use these status meanings consistently:

- **Implemented:** Relevant source code exists.
- **Tested:** An appropriate automated test actually passed.
- **Verified:** The defined acceptance criteria were checked with sufficient evidence.
- **Partial:** Some required behavior is implemented, but other requirements remain incomplete.
- **Missing:** The feature is not implemented.
- **Unverified:** Evidence is insufficient to confirm the behavior.
- **Blocked:** A known dependency, defect, or environment limitation prevents progress.

Never claim that a feature works simply because source code was added.

Never claim a test, build, migration, manual check, or image inspection succeeded unless it was actually performed and the result supports that claim.

Record failed, skipped, unavailable, and inconclusive checks explicitly.

## 11. Mandatory Documentation Maintenance

Documentation updates are part of implementation, not an optional follow-up task.

After every meaningful code change, update the relevant documents in the same task.

### `docs/ARCHITECTURE.md`

Update when the actual implementation structure, data flow, dependencies, database schema, repositories, services, persistence, security, or navigation architecture changes.

Describe the implementation that exists, not a proposed design.

### `docs/IMPLEMENTATION_STATUS.md`

Update affected feature statuses using actual code and verification evidence.

Record completed behavior, partial work, defects, tests, failed checks, and remaining limitations.

Do not mark a feature verified merely because code was written.

### `docs/ROADMAP.md`

Update completed tasks only when their acceptance criteria have been met.

Record newly discovered blockers, dependencies, and the next recommended task.

Keep the next task specific, bounded, and testable.

### `docs/PROJECT_SPEC.md`

Update only when a product requirement is explicitly changed or approved.

Do not rewrite requirements merely to accommodate an implementation defect.

### `docs/DECISIONS.md`

Record new confirmed decisions, their rationale, and consequences.

Do not treat a developer suggestion, assumption, or screenshot interpretation as user approval.

Keep unresolved questions explicitly unresolved.

### `docs/UI_UX_SPEC.md`

Update confirmed UI requirements, approved changes, relevant screen behavior, and acceptance criteria.

Keep proposed interpretations separate from confirmed decisions.

### `docs/UI_REFERENCE_CATALOG.md`

Update when screenshots are added, removed, inspected, or reinterpreted.

Preserve exact filenames and record whether each image was actually inspected.

### `AGENTS.md`

Change only when persistent project-wide working rules need to change.

Avoid unnecessary duplication. Keep detailed information in its authoritative document and link to it from other documents.

## 12. Mandatory Development Handover

At the end of every meaningful task, provide a concise handover containing:

1. **Task:** What was requested and what was accomplished.
2. **Implementation:** Important behavior changes and files modified.
3. **Verification:** Commands actually run, results, and any checks not performed.
4. **Documentation:** Which documents were updated and why.
5. **Remaining work:** Known defects, limitations, blockers, and unresolved decisions.
6. **Next task:** The recommended next roadmap item and its acceptance criteria.

Update the persistent documentation before ending the task.

When practical, include the relevant commit hash after a commit has actually been created. Never claim a commit or push succeeded unless it did.

## 13. Cross-Account Continuity

The repository documentation is the persistent shared memory for every Codex account.

A new account must be able to understand the project by reading these instructions, the project documents, the relevant source code, and the reference-image catalog.

Do not depend on private chat history, another account's memory, or verbal explanations that have not been recorded in the repository.

After substantial work, leave the project in a documented state so another developer can continue without repeating the original knowledge-transfer process.

## 14. Initial Workflow Summary

For every assigned task:

1. Read the instructions and relevant documentation.
2. Inspect Git status and the existing implementation.
3. Identify the smallest safe change and acceptance criteria.
4. Implement only the agreed scope.
5. Run appropriate verification.
6. Inspect the final diff.
7. Update relevant documentation.
8. Report changes, evidence, remaining issues, and the next recommended task.