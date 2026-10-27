# MoneyLog Architecture

**Audit basis:** local source tree inspected on 2026-10-27. This document describes code that exists; it is not a target design.

## Project structure

- `lib/main.dart`: Flutter entry point, `BudgetApp`, and the only application screen, `AccountsScreen`.
- `lib/data/database/app_database.dart`: Drift table declarations, database setup, CRUD queries, and schema migration.
- `lib/data/database/app_database.g.dart`: generated Drift mappings and table/query managers; generated file was inspected but not edited.
- `lib/data/models/`: plain Dart `Account`, `Category`, `Transaction`, and `TransactionType` models.
- `lib/data/repositories/`: account, category, and transaction database adapters; `BalanceRepository` computes one account's balance from a supplied transaction list.
- `lib/data/services/`: category name validation and transaction validation.
- `test/`: Drift in-memory repository tests, a balance calculation test, a transaction validation test, and one widget smoke test.
- `web/`: Flutter web bootstrap, manifest, and icons only. No MoneyLog website workflow exists.
- `android/`, `ios/`, `linux/`, `macos/`, `windows/`: Flutter platform scaffolding. Android Gradle files are present.

## Startup, UI, and state

`main()` in `lib/main.dart` calls `runApp(const BudgetApp())`. `BudgetApp` builds a `MaterialApp` with Material 3, a green seeded light theme, and `AccountsScreen` as `home`. There is no router, named route table, bottom navigation, drawer, Home/Records screen, Target screen, transaction form, category screen, or theme preference/state. `AccountsScreen` is a `StatefulWidget`; it owns an `AppDatabase`, `AccountRepository`, account list, and loading flag, loads accounts in `initState`, and closes the database in `dispose`. Account add/edit/delete use dialogs, and delete asks for confirmation. The floating action button adds an account; it is not the confirmed global transaction action. The account form uses `double.tryParse`, so it accepts binary floating point rather than a fixed decimal-money representation.

## Data model and data flow

The UI calls `AccountRepository`; repositories call `AppDatabase` CRUD methods and map Drift rows to plain models. `TransactionService` validates positive amounts and requires a different destination for transfers. `CategoryService` rejects empty names and the reserved name `Deleted`. Validation services are not wired into the visible UI or repositories, so their existence does not ensure all writes are validated.

Drift defines three tables:

- `Accounts`: text primary key, name, `REAL` opening balance, icon name with a default.
- `Categories`: text primary key, name, integer type (`0` income, `1` expense), default flag, creation date. There is no color column.
- `Transactions`: text primary key, integer type (`0` income, `1` expense, `2` transfer), `REAL` amount, source account ID, nullable destination account/category/note, and date.

There are no declared foreign keys or database constraints relating transactions to accounts/categories. Account deletion deletes only the account row. Category deletion is transactional: it creates/reuses a type-specific reserved `Deleted` category, moves matching transaction category IDs, then deletes the category. Transactions can be queried globally (descending by date), by ID, or by account (including transfer destination); CRUD is available. No transaction UI, summary aggregation, date-period query, filtering UI, or history screen exists.

A mapping defect is visible in `AccountRepository`: the UI creates/edits an `Account` with an `iconName`, but repository create/read/update mappings omit it, so persisted records use the DB default and the UI read mapping also returns the model default. `AppDatabase` supports icon persistence, but the repository does not pass the value.

`BalanceRepository.calculateBalance` starts with opening balance and adds income, subtracts expenses, and applies transfers to source/destination. It uses `double`; only one calculation test covers a normal example. It is not shown in the current UI.

## Persistence and migrations

`AppDatabase` defaults to `driftDatabase(name: 'moneylog')` from `drift_flutter`; repository tests instead pass `NativeDatabase.memory()`. Schema version is 2. `onCreate` creates all tables; `onUpgrade` adds `accounts.iconName` when upgrading from a version below 2. There is no migration test, explicit foreign-key policy, backup/restore service, attachment file store, or demonstrated restart/persistence test. Financial amounts and account opening balances use Drift `REAL`/Dart `double`.

## Dependencies

Runtime dependencies in `pubspec.yaml`: Flutter SDK, `cupertino_icons`, `drift`, and `drift_flutter`. Development dependencies: `flutter_test`, `flutter_lints`, `drift_dev`, and `build_runner`. No crypto, archive/package, file-picker, image/attachment, PDF, chart, CSV, or state-management packages are declared.

## Tests and verification

- `test/account_repository_test.dart`: in-memory account create/read, list, update, delete.
- `test/category_repository_test.dart`: in-memory category create/read/list/update/delete.
- `test/transaction_repository_test.dart`: in-memory income/expense/transfer writes, reads, update/delete, account query.
- `test/balance_repository_test.dart`: a single balance arithmetic example.
- `test/transaction_service_test.dart`: valid transfer and missing-destination validation; no test for same source/destination or non-positive amount.
- `test/widget_test.dart`: expects text `Budget` and `Budget App`, while the current app title/screen display MoneyLog Accounts. This expectation conflicts with directly inspected UI and is likely stale; it was not executed successfully in this audit.

Commands attempted on 2026-10-27: `flutter test` and `flutter --version` produced no output and did not complete during the available wait; both processes were interrupted. Therefore tests, static analysis, and Android build are **not verified**. No command result is represented as a pass.

