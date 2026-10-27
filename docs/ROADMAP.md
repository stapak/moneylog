# MoneyLog Development Roadmap

**Audit date:** 2026-10-27. Priorities below reflect the local source audit. `[x]` means directly verified complete, `[!]` marks a directly verified defect or missing requirement, and `[ ]` means pending or unverified.

## Phase 0 - Source audit

- [x] Inspect local tree, Git status, `pubspec.yaml`, source, tests, and project requirements.
- [x] Trace app entry/UI, data models, Drift storage, repositories, services, and migrations.
- [x] Check for backup, restore, attachments, reports, exports, charts, theme, and website code.
- [x] Record evidence and test execution limits in architecture and status documents.

## Phase 1 - Restore a verifiable development baseline

- [!] The existing `test/widget_test.dart` expects `Budget` and `Budget App`, but inspected `lib/main.dart` renders MoneyLog Accounts; Flutter commands produced no output and hung during this audit.
- [ ] Establish a working Flutter/Dart toolchain in this environment and run `flutter --version`, `flutter test`, and `flutter analyze`.
- [ ] Align the widget test with the intended current app entry screen and ensure the full suite passes.
- [ ] Run an Android debug build and record actual result.
- [ ] Address analyzer/build defects found by those commands.

**Exit criterion:** Flutter tests and static analysis complete successfully, and the Android app builds. Until then, build readiness is unverified.

## Phase 2 - Protect and verify local financial data

- [!] The `AccountRepository` drops `iconName` on create/read/update although the UI edits it and `Accounts` has a DB column.
- [!] Account deletion removes an account without handling transaction rows that reference it; schema has no FK constraints.
- [ ] Decide and document safe account deletion behavior, then preserve transaction/account integrity.
- [ ] Replace or formally constrain floating-point amount storage and define currency precision before expanding calculation/reporting paths.
- [ ] Add tests for migration from v1 to v2, durable reopen/restart behavior, invalid references, and data-preserving category reassignment.
- [ ] Ensure service validations are invoked by write paths, including transfer source/destination and positive amount checks.

**Exit criterion:** Existing records survive upgrades/restarts and CRUD operations cannot leave inconsistent or silently invalid records.

## Phase 3 - Complete core mobile workflows

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

- [ ] Define versioned package contents and compatibility policy, including attachments and relationships.
- [ ] Select established cryptographic implementation and implement password-based key derivation plus authenticated encryption.
- [ ] Validate package structure, integrity, version, and attachment paths before touching stored data.
- [ ] Decide merge/replacement behavior and duplicate handling; define rollback/recovery behavior.
- [ ] Test successful round trips, wrong passwords, corruption, unsupported versions, incomplete imports, and preservation of existing records after failure.

**Exit criterion:** Valid packages restore completely and invalid/incomplete packages fail without silent data loss.

## Phase 5 - Reports and exports

- [ ] Confirm fields included in Basic PDF.
- [ ] Implement the three confirmed PDF options: Basic; Expenses + descriptions; Expenses + descriptions + bills.
- [ ] Add accurate totals/date ranges, pie/bar charts, and category checkbox selection; test totals against exported rows.
- [ ] Confirm CSV fields/filters and implement CSV separately from restorable backups.
- [ ] Test empty and larger datasets, attachments, and selected-category behavior.

**Exit criterion:** Exports match user selections and calculated values; PDF/CSV remain distinct from `.mbak` restore packages.

## Phase 6 - Theme and mobile quality

- [ ] Implement dark theme and theme selection/persistence.
- [ ] Verify responsive behavior and form validation across supported screen sizes.
- [ ] Verify privacy/local-only handling and app restart behavior.
- [ ] Complete tests, static analysis, and Android build on a working toolchain.

**Exit criterion:** Mobile foundation is reliable for daily use and quality checks are repeatable.

## Phase 7 - Laptop-hosted website (deferred)

- [ ] Define supported edits and deliberate phone-to-laptop transfer workflow.
- [ ] Import and validate transferred data; support temporary local workspace editing.
- [ ] Export a validated portable package for mobile restore/import.
- [ ] Prevent stale data or conflicting edits from silently overwriting newer records.
- [ ] Verify local-network privacy/security. Do not add a permanent backend or mandatory cloud service.

Start only after mobile persistence and backup/restore are reliable.

## Immediate next task

Restore a verifiable Flutter baseline: resolve the stale widget-test expectation and get Flutter commands to complete, then run the suite, analyzer, and Android build. This is the highest-priority next task because the current test expectation conflicts with the actual screen and none of the test/build checks could be completed, so there is no reliable pass/fail baseline for subsequent data-safety work.

