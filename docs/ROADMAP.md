# MoneyLog Development Roadmap

**Audit basis:** source/priority audit 2026-10-27; repository handover rechecked 2026-10-30. Priorities below reflect the local source audit. `[x]` means directly verified complete, `[!]` marks a directly verified defect or missing requirement, and `[ ]` means pending or unverified.

Requirement IDs and acceptance criteria are maintained in [REQUIREMENTS_TRACEABILITY.md](REQUIREMENTS_TRACEABILITY.md). The 2026-10-30 review found no newer source changes or verification results; Git HEAD `eba16e7` changes only the implementation-status document. No checks were run during the documentation audit.

## Phase 0 - Source audit

- [x] Inspect local tree, Git status, `pubspec.yaml`, source, tests, and project requirements.
- [x] Trace app entry/UI, data models, Drift storage, repositories, services, and migrations.
- [x] Check for backup, restore, attachments, reports, exports, charts, theme, and website code.
- [x] Record evidence and test execution limits in architecture and status documents.

## Phase 1 - Restore a verifiable development baseline

**Requirements:** QA-001, QA-002, HAND-001.

- [!] The existing `test/widget_test.dart` expects `Budget` and `Budget App`, but inspected `lib/main.dart` renders MoneyLog Accounts; Flutter commands produced no output and hung during this audit.
- [ ] Establish a working Flutter/Dart toolchain in this environment and run `flutter --version`, `flutter test`, and `flutter analyze`.
- [ ] Align the widget test with the intended current app entry screen and ensure the full suite passes.
- [ ] Run an Android debug build and record actual result.
- [ ] Address analyzer/build defects found by those commands.

**Exit criterion:** Flutter tests and static analysis complete successfully, and the Android app builds. Until then, build readiness is unverified.

## Phase 2 - Protect and verify local financial data

**Requirements:** ACC-002, ACC-004, DAT-001–DAT-004, TXN-001, TXN-003.

- [!] The `AccountRepository` drops `iconName` on create/read/update although the UI edits it and `Accounts` has a DB column.
- [!] Account deletion removes an account without handling transaction rows that reference it; schema has no FK constraints.
- [ ] Decide and document safe account deletion behavior, then preserve transaction/account integrity.
- [ ] Replace or formally constrain floating-point amount storage and define currency precision before expanding calculation/reporting paths.
- [ ] Add tests for migration from v1 to v2, durable reopen/restart behavior, invalid references, and data-preserving category reassignment.
- [ ] Ensure service validations are invoked by write paths, including transfer source/destination and positive amount checks.

**Exit criterion:** Existing records survive upgrades/restarts and CRUD operations cannot leave inconsistent or silently invalid records.

## Phase 3 - Complete core mobile workflows

**Requirements:** HOME-001–HOME-005, NAV-001–NAV-002, TXN-001–TXN-004, ACC-001–ACC-004, CAT-001–CAT-004, TGT-001, ATT-001.

### Transactions and accounts

- [ ] Add transaction entry, view, edit, delete safeguards, descriptions, date history, and filters using existing transaction storage.
- [ ] Add transfer entry and tests for source/destination accounting and validation.
- [ ] Provide account-specific activity and safe account deletion behavior.
- [ ] Implement and test income/expense summary calculations for Daily, Monthly, 3 Months, Yearly, and All Time.

### Categories and navigation

- [ ] Seed or otherwise provide built-in categories; add custom category management.
- [ ] Add category colors and selector/filter UI while preserving transaction history on changes.
- [ ] Implement confirmed navigation: Categories in Home hamburger, Target in bottom navigation, global `+` opens transaction entry.
- [ ] Keep Balance out of the Home/Records summary.

### Targets and bills

- [ ] Confirm target period and overspending rules, then implement target CRUD and calculations with tests.
- [ ] Confirm bill file types and lifecycle, then implement local attachment association and safe deletion.

**Exit criterion:** Required daily transaction, account, category, summary, target, and attachment workflows are usable and tested against persistent data.

## Phase 4 - Secure portable `.mbak` backup and restore

**Requirements:** BAK-001–BAK-005.

- [ ] Define versioned package contents and compatibility policy, including attachments and relationships.
- [ ] Select established cryptographic implementation and implement password-based key derivation plus authenticated encryption.
- [ ] Validate package structure, integrity, version, and attachment paths before touching stored data.
- [ ] Decide merge/replacement behavior and duplicate handling; define rollback/recovery behavior.
- [ ] Test successful round trips, wrong passwords, corruption, unsupported versions, incomplete imports, and preservation of existing records after failure.

**Exit criterion:** Valid packages restore completely and invalid/incomplete packages fail without silent data loss.

## Phase 5 - Reports and exports

**Requirements:** RPT-001–RPT-003.

- [ ] Confirm fields included in Basic PDF.
- [ ] Implement the three confirmed PDF options: Basic; Expenses + descriptions; Expenses + descriptions + bills.
- [ ] Add accurate totals/date ranges, pie/bar charts, and category checkbox selection; test totals against exported rows.
- [ ] Confirm CSV fields/filters and implement CSV separately from restorable backups.
- [ ] Test empty and larger datasets, attachments, and selected-category behavior.

**Exit criterion:** Exports match user selections and calculated values; PDF/CSV remain distinct from `.mbak` restore packages.

## Phase 6 - Theme and mobile quality

**Requirements:** THM-001, QA-001, QA-002, DAT-001.

- [ ] Implement dark theme and theme selection/persistence.
- [ ] Verify responsive behavior and form validation across supported screen sizes.
- [ ] Verify privacy/local-only handling and app restart behavior.
- [ ] Complete tests, static analysis, and Android build on a working toolchain.

**Exit criterion:** Mobile foundation is reliable for daily use and quality checks are repeatable.

## Phase 7 - Laptop-hosted website (deferred)

**Requirements:** WEB-001 (deferred until mobile and backup prerequisites are satisfied).

- [ ] Define supported edits and deliberate phone-to-laptop transfer workflow.
- [ ] Import and validate transferred data; support temporary local workspace editing.
- [ ] Export a validated portable package for mobile restore/import.
- [ ] Prevent stale data or conflicting edits from silently overwriting newer records.
- [ ] Verify local-network privacy/security. Do not add a permanent backend or mandatory cloud service.

Start only after mobile persistence and backup/restore are reliable.

## Immediate next task

First restore a verifiable Flutter baseline (QA-001/QA-002): resolve the stale widget-test expectation against the approved current startup behavior, establish why Flutter commands stall, then run the suite, analyzer, and Android debug build. Acceptance is successful completion of each check with outcomes recorded; a stall is inconclusive, not a test failure. Next fix account icon persistence (ACC-002): pass `iconName` through repository create/update and both read mappings, with regression cases for create/read, list/read, and update; verify against the current schema without a migration. Keep account deletion (ACC-004) separate until OPEN-013 is resolved.

