# MoneyLog — Product Specification

**Project:** MoneyLog  
**Document type:** Product requirements  
**Status:** Initial specification based on confirmed project discussions  
**Primary development priority:** Mobile application

Requirement IDs and current evidence are indexed in [REQUIREMENTS_TRACEABILITY.md](REQUIREMENTS_TRACEABILITY.md). This specification records intended behavior, not implementation proof.

## 1. Product vision

MoneyLog is a privacy-focused personal finance application for tracking income, expenses, accounts, budgets, and financial records.

The mobile application is the primary product. A complementary website may later provide a temporary workspace hosted on the user's laptop.

Financial data must remain under the user's control. The application must not require a permanent backend or cloud account.

## 2. Product principles

1. Local-first financial data ownership.
2. Reliable transaction recording and financial calculations.
3. Simple, consistent user interface.
4. Secure, portable backup and restore.
5. Useful reports and exports.
6. Incremental development that preserves working functionality.
7. Mobile-first development, followed by the website.

## 3. Mobile application requirements

### 3.1 Transactions

The application should support:

- Recording income and expenses.
- Editing and viewing transactions.
- Deleting transactions with appropriate safeguards.
- Transaction dates, amounts, categories, and descriptions.
- Transaction history and relevant filters.
- Distinct Expense, Income, and Transfer transactions. Transfers move value between distinct accounts and are not counted as income or expenses in summaries.
- A global floating '+' button for opening the Add New Transaction screen.

Financial calculations must handle decimal precision and currency formatting appropriately.

Transfer-specific fields and validation details remain open and must be confirmed before they are treated as product rules; see `DECISIONS.md` (OPEN-002). Existing implementation behavior is evidence about current code, not approval of a transfer policy.

### 3.2 Accounts

The application must support multiple named accounts and opening balances. Users must be able to view transactions associated with an account, including transfers into and out of it. Account changes must preserve transaction history and relationships.

The supported account types, treatment of opening balances in reports, negative-balance rules, and account-deletion policy remain unresolved. Until the deletion policy is confirmed, do not implement behavior that leaves dangling transaction references or silently discards history. Transfer representation and validation details remain open in `DECISIONS.md` (OPEN-001/002).

### 3.3 Categories

- Provide built-in categories.
- Allow users to create custom categories.
- Support category colors.
- Maintain separate income and expense category lists.
- Allow category selection when recording transactions.
- Support filtering records by category.
- Allow users to select categories for export through checkboxes.

Category deletion or modification must not silently corrupt existing transaction history.

### 3.4 Home and Records

The Home/Records experience should provide income and expense summaries.

Supported periods:

- Daily
- Monthly
- 3 Months
- Yearly
- All Time

**Confirmed design decision:** Do not include Balance in the Home/Records summary.

The interface should present transaction records clearly and use consistent date grouping, totals, and period navigation.

Other account-specific balance displays must follow the confirmed account requirements.

The month view supports previous/next-month navigation. A filter control opens Display Options with the period selector, Show total, and Carry over controls. Transactions are grouped by date. The presence of Show total and Carry over is recovered as a requirement; their precise effects remain unresolved. The old reference image describes monthly surplus being added to the next month, but this is reference-app wording and is not confirmation of MoneyLog semantics. See HOME-003–HOME-005.

### 3.5 Navigation

Confirmed navigation decisions:

- Categories is accessible from the Home hamburger menu.
- Target replaces Categories in the bottom navigation.
- A global floating '+' button provides access to adding a transaction.

The remaining bottom-navigation destinations and ordering, and the rest of the hamburger menu, remain unresolved (NAV-001).

Inspect the existing navigation before making UI changes.

### 3.6 Target and budget goals

The application should provide a Target screen for budget goals.

The detailed behavior must be established from the existing implementation and confirmed design references, including:

- Creating and editing targets.
- Linking targets to categories where appropriate.
- Displaying target amounts and relevant progress.
- Calculating spending against a target.
- Handling date periods and overspending.

Do not assume that all of these capabilities are already implemented.

### 3.7 Descriptions and bill attachments

Transactions should support descriptions.

Transactions must support attaching bill files, with those attachments kept under the user's control.

The specification and architecture must document:

- Attachment storage.
- Attachment association with transactions.
- Backup inclusion.
- PDF-export behavior.
- Safe deletion and restoration of attachments.

See TXN-004 and ATT-001. Supported attachment types, size limits, and lifecycle details remain open.

### 3.8 Themes and visual design

The application should support a dark theme and maintain a clean, readable interface.

Use the project's existing design conventions and assets where possible. Treat reference screenshots as evidence of intended appearance, not as authorization to copy unrelated features.

## 4. Local data and privacy

- The mobile device is the primary owner of financial data.
- Financial records should persist locally across application restarts.
- No mandatory cloud account or permanent backend.
- No automatic upload of financial records or bill images to external services.
- Data migrations must preserve existing records.
- Database operations should handle errors safely.
- Deletion and restore operations must avoid accidental data loss.

Document the actual database technology, schema, and migration approach after inspecting the source code.

## 5. Backup and restore

The portable backup file extension is `.mbak`.

### 5.1 Backup

The backup must contain the data required to restore the user's MoneyLog state, including applicable:

- Transactions.
- Accounts.
- Categories.
- Budget goals and settings.
- Descriptions.
- Bill attachments.
- Other essential user preferences and relationships.

The final package contents must be determined from the actual data model.

### 5.2 Security

- Encrypt private backup content using established cryptographic libraries.
- Use a suitable password-based key derivation function.
- Use authenticated encryption.
- Never store the plaintext backup password inside the package.
- Validate integrity and compatibility before importing data.
- Do not treat a password hash alone as encryption.
- Handle incorrect passwords, corrupted files, unsupported versions, and incomplete imports safely.

### 5.3 Restore

The restore workflow must define:

- File selection.
- Password entry.
- Package validation.
- Schema and version compatibility.
- Duplicate handling.
- Merge versus full replacement behavior.
- Recovery from failed imports.
- Protection against accidental loss of existing data.

Unconfirmed restore behavior must be recorded as an open decision rather than assumed.

The interface should allow the user to select and change a backup directory, create a portable `.mbak` there, and list `.mbak` files from the selected directory for restore. Support password-protected backups. Validate the package before changing stored data and preserve existing data if restoration fails. Backup/restore remains distinct from CSV/PDF export. Include all data, relationships, settings, and bill attachments required by the final data model. A screenshot's suggestion to store backups on a computer or cloud service does not authorize automatic upload. See BAK-001–BAK-005.

## 6. Reports and exports

### 6.1 PDF reports

PDF reports should be clean, readable, and suitable for saving or printing.

Where applicable, reports should include:

- Relevant expense data.
- Descriptions, depending on the selected export option.
- Totals and date ranges.
- Pie charts.
- Bar charts.
- Bill attachments when explicitly selected.

Chart values and displayed totals must agree with the records included in the report.

### 6.2 PDF export options

The three confirmed options are:

1. Basic.
2. Expenses + descriptions.
3. Expenses + descriptions + bills.

The precise fields included in Basic must be confirmed from the existing design or implementation.

### 6.3 Category selection

Users must be able to select categories to include in supported export workflows through checkboxes. The exact fields, filtering behavior, and handling of transfer rows remain open for CSV and PDF as recorded in `DECISIONS.md` (OPEN-016).

### 6.4 CSV export

Provide CSV export separately from PDF reports and `.mbak` backups; CSV files are not restorable backup packages.

Its exact fields, filters, and behavior must be verified before implementation.

**Important:** A CSV or PDF export is a report/data export, not a replacement for a restorable `.mbak` backup.

## 7. Temporary website workspace — later phase

The website is a future phase and must not delay the mobile application.

Intended workflow:

1. Transfer data deliberately from the phone to the laptop.
2. Import it into a temporary workspace hosted on the laptop.
3. Modify supported records in the website.
4. Export the updated data into a portable package.
5. Import the package back into the mobile application.

Constraints:

- No permanent backend is required.
- The website must not assume direct access to arbitrary phone storage.
- Data transfer must be deliberate and documented.
- Imported data must be validated.
- The design must address stale data, conflicts, and accidental overwrites.
- Financial data must not be exposed to external services.

The technical transfer mechanism remains to be confirmed.

## 8. Development and quality requirements

- Preserve the existing application and working functionality.
- Inspect source code before making architectural changes.
- Make small, testable changes.
- Avoid unnecessary dependencies.
- Test important calculations and persistence behavior.
- Test backup encryption, integrity validation, and restore behavior.
- Run appropriate Flutter tests, formatting, static analysis, and builds.
- Record actual test outcomes.
- Update documentation when requirements or implementation change.

## 9. Explicitly deferred scope

Until the mobile application is sufficiently complete:

- Do not implement the website.
- Do not introduce a permanent backend.
- Do not introduce mandatory cloud synchronization.
- Do not redesign unrelated screens without approval.
- Do not invent unconfirmed account, budget, or restore rules.

## 10. Open questions

These items require verification or confirmation:

1. Exact supported account types and transfer rules.
2. Full transaction and database schema.
3. Exact Target screen calculations and behavior.
4. Exact fields included in Basic PDF export.
5. CSV export requirements.
6. `.mbak` package format and compatibility strategy.
7. Restore merge versus replacement behavior.
8. Exact website-to-phone data transfer mechanism.
9. Which reference screenshots represent the final approved designs.

The Show total behavior, Carry over semantics, remaining navigation destinations, account deletion policy, target calculations, restore merge/replacement and duplicate behavior, PDF Basic contents, and CSV fields/filters are explicitly open. See `DECISIONS.md` and the relevant IDs in `REQUIREMENTS_TRACEABILITY.md`.

## 11. Requirement verification

This document records intended behavior, not proof that the features exist.

Codex must compare every requirement with the source code and record the verified status in `docs/IMPLEMENTATION_STATUS.md`.
