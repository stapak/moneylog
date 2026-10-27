# MoneyLog — Codex Project Instructions

## 1. Project identity

MoneyLog is a privacy-focused personal finance application. The primary goal is to build a reliable mobile app first, followed by a complementary laptop-hosted website.

The developer is learning Flutter and Dart. Explain unfamiliar concepts in simple language and provide practical, incremental instructions.

## 2. Source of truth

- Treat the existing source code as the authority for what is currently implemented.
- Treat `docs/PROJECT_SPEC.md` as the product requirements reference.
- Treat `docs/ARCHITECTURE.md` as the verified technical architecture reference.
- Treat `docs/IMPLEMENTATION_STATUS.md` as the feature-status reference.
- Treat `docs/ROADMAP.md` as the prioritized development plan.
- Treat `docs/DECISIONS.md` as the record of confirmed decisions and unresolved questions.
- Read this file and relevant documentation before beginning substantial work.
- When documentation conflicts with the actual code or another confirmed decision, identify the conflict rather than silently guessing.

## 3. Protect existing work

- Inspect the relevant files before editing them.
- Never replace the existing project with a newly generated application.
- Do not delete, rename, or reorganize existing files without explicit approval.
- Preserve existing functionality unless a change is requested.
- Inspect Git status before making changes when Git is available.
- Prefer small, reviewable changes.
- Do not perform destructive database migrations or operations that could erase user data.

## 4. Product priorities

1. Stabilize the existing mobile application.
2. Ensure reliable local financial-data storage.
3. Complete transaction, account, category, and budget functionality.
4. Implement secure `.mbak` backup and restore.
5. Complete PDF reporting and export.
6. Develop the temporary laptop-hosted website in a later phase.

Do not start the website before the mobile foundation is sufficiently reliable.

## 5. Confirmed product requirements

- The phone is the primary owner of the user's financial data.
- Do not introduce a mandatory cloud service or permanent backend.
- Provide income and expense summaries for Daily, Monthly, 3 Months, Yearly, and All Time periods.
- Do not include Balance in the Home/Records summary.
- Categories belong in the Home hamburger menu.
- Target replaces Categories in the bottom navigation.
- Support built-in and user-created categories, including colors and separate income and expense category lists.
- Provide a global floating '+' button for adding transactions.
- Support budget goals, transaction descriptions, and bill attachments as required by the specification.
- The portable backup extension is `.mbak`.
- Backup/restore is distinct from CSV and PDF export.
- PDF export options are Basic; Expenses + descriptions; and Expenses + descriptions + bills.
- Support a dark theme.

Consult `docs/DECISIONS.md` before changing any of these decisions.

## 6. Privacy and security

- Keep financial records and bill attachments under the user's control.
- Do not transmit financial data to external services without explicit approval.
- Do not log passwords, backup keys, or sensitive financial records.
- Do not store plaintext backup passwords in exported packages.
- Use established cryptographic libraries and authenticated encryption for protected backups.
- Validate backup files before restoring them.
- Protect against corrupted, incompatible, or malicious import files.
- Never claim a security feature is complete without verifying its implementation.

## 7. Development practices

- Inspect existing dependencies and architecture before introducing new ones.
- Follow the project's existing conventions where practical.
- Use clear, maintainable Flutter and Dart code.
- Test financial calculations, persistence, import/export, and backup/restore carefully.
- Run relevant tests, formatting, static analysis, and build checks when feasible.
- Report actual test results. Never claim that an unexecuted command passed.
- Explain important changes and list the files modified.
- Ask before making major architectural decisions or changing confirmed requirements.

## 8. Documentation maintenance

- Update implementation status when features change.
- Record confirmed design decisions and unresolved questions.
- Keep requirements separate from implementation status.
- Treat screenshots as visual reference material, not automatic authorization to copy every visible feature.
- Never claim to have inspected files, images, or tests that were unavailable.

## 9. Initial workflow

When starting a new task:

1. Read these instructions and relevant documentation.
2. Inspect the existing implementation.
3. Identify the smallest safe change that meets the requirement.
4. Implement only the agreed scope.
5. Run appropriate verification.
6. Update the relevant documentation.
7. Summarize changes, test results, remaining issues, and next steps.