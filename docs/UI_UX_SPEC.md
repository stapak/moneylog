# MoneyLog — UI/UX Specification

**Document type:** Product UI and interaction requirements  
**Status:** Initial specification based on confirmed project decisions and existing project documentation  
**Last reviewed:** 2026-10-28

## 1. Purpose

This document records the agreed user interface and interaction requirements for MoneyLog.

It complements:

- `AGENTS.md` — development instructions and project safeguards.
- `PROJECT_SPEC.md` — product requirements.
- `ARCHITECTURE.md` — inspected technical implementation.
- `IMPLEMENTATION_STATUS.md` — current implementation status.
- `ROADMAP.md` — development priorities.
- `DECISIONS.md` — confirmed decisions and unresolved questions.
- `UI_REFERENCE_CATALOG.md` — inventory and inspection record for original reference images.

This document must distinguish confirmed MoneyLog requirements from visual observations made in other applications.

## 2. Evidence and authority

Use the following evidence hierarchy:

1. Explicitly confirmed MoneyLog requirements and decisions.
2. Current project specification and decision register.
3. Actual application source code, for determining current behavior.
4. Original reference screenshots, for understanding visual patterns and possible design inspiration.
5. Unconfirmed assumptions, which must remain explicitly labelled.

A screenshot does not automatically authorize copying every feature it contains.

Do not silently turn a reference application's behavior into a MoneyLog requirement. Ask the user when an important product decision is unclear.

## 3. Product design principles

- Prioritize the mobile application.
- Keep the interface simple, readable, and consistent.
- Keep financial data under the user's control.
- Avoid unnecessary screens, interactions, and dependencies.
- Preserve existing working functionality during implementation.
- Use reusable widgets and consistent styling where appropriate.
- Support a dark theme.
- Provide clear validation, confirmation, empty states, loading states, and error messages where relevant.
- Do not claim an interaction works merely because its screen has been created.

## 4. Application navigation

### 4.1 Home and Records

The Home/Records experience is intended to be the main place for reviewing income, expenses, and transaction records.

Confirmed requirements:

- Display Income and Expense summaries.
- Do not display Balance in the Home/Records summary.
- Support Daily, Monthly, 3 Months, Yearly, and All Time periods.
- Provide a clear way to browse transaction records.
- Use the global floating `+` action to open Add New Transaction.

The exact layout, card arrangement, chart placement, and record-row styling must be confirmed using the original reference images and approved design decisions.

### 4.2 Hamburger menu

Categories must be accessible from the Home hamburger menu.

Do not place Categories in the bottom navigation unless the user explicitly changes the confirmed navigation decision.

The complete menu contents and ordering remain subject to reference-image inspection and confirmation.

### 4.3 Bottom navigation

Target replaces Categories in the bottom navigation.

The precise set of other navigation destinations and their order must be established from confirmed requirements and reviewed reference images. Do not invent additional destinations.

### 4.4 Global floating action button

Provide a global floating `+` button for adding a transaction.

Confirmed behavior: opening the Add New Transaction workflow.

The button must not merely add an account or perform an unrelated action. Ensure its behavior is consistent wherever it is displayed.

## 5. Transactions

MoneyLog must support the transaction workflows described in `PROJECT_SPEC.md` and `DECISIONS.md`.

Transaction types include:

- Expense
- Income
- Transfer

Transfers must be distinguished from income and expenses in financial summaries.

Transaction functionality should cover, as appropriate:

- Creating transactions.
- Editing and viewing transactions.
- Deleting transactions with suitable safeguards.
- Entering amount, date, category, and description.
- Selecting the relevant account or accounts.
- Viewing transaction history.
- Filtering or grouping records where supported by the approved design.
- Attaching bills when that capability is implemented.

The precise field arrangement, popup versus full-screen presentation, keyboard behavior, date-picker design, and validation messages must be documented after inspecting the reference images and current implementation.

Do not invent field requirements from screenshot filenames.

## 6. Accounts

Account functionality must respect the established data model and confirmed account requirements.

Potential account interactions include creating, viewing, editing, and deleting accounts; recording opening balances; viewing account-specific transactions; and transferring funds.

The exact supported account types and deletion behavior remain subject to the project decision register.

UI requirements:

- Make account information readable.
- Clearly distinguish account actions from transaction actions.
- Confirm destructive actions when necessary.
- Display errors clearly when an operation fails.
- Preserve financial records when account operations are performed.

The visual design of account cards, icons, detail views, and dialogs must be based on inspected references and approved decisions.

## 7. Categories

Confirmed requirements:

- Provide built-in categories.
- Allow custom categories.
- Support category colors.
- Maintain separate income and expense category lists.
- Allow category selection when recording transactions.
- Support category-based filtering where implemented.
- Provide category checkboxes in supported export workflows.
- Make Categories accessible through the Home hamburger menu.

Category creation, editing, deletion, and other actions must preserve transaction history.

Do not assume that a category-management screen, context menu, or particular set of category actions is approved merely because it appears in a reference image.

## 8. Target and budgets

Target replaces Categories in the bottom navigation.

MoneyLog must provide budget goals, with the detailed behavior established from confirmed requirements and approved references.

Relevant areas include:

- Creating and editing targets.
- Setting target amounts.
- Linking targets to categories where appropriate.
- Displaying spending and progress.
- Handling target periods.
- Representing overspending.

The exact target calculation rules, screen layout, period choices, progress indicators, and category-specific interactions remain to be confirmed where the existing documentation does not define them.

Do not invent calculation rules.

## 9. Reports, analysis, and exports

### 9.1 PDF export

Provide three export options:

1. Basic.
2. Expenses + descriptions.
3. Expenses + descriptions + bills.

The exact contents of Basic remain unresolved and must be confirmed before implementation.

Confirmed report requirements include:

- A clean, readable report.
- Expense data and relevant statistics.
- Pie chart and bar graph.
- Category checkboxes to select which categories to export.
- Appropriate date-range and total information where confirmed by the report specification.

The exact appearance and content of analysis screens shown in reference images must be inspected and catalogued before being adopted.

### 9.2 CSV export

CSV is a separate export format.

It must not be confused with the portable `.mbak` backup format. CSV field selection and filtering details remain subject to the project decision register.

### 9.3 Analysis screens

Do not assume that every analysis screen shown in a reference image is required in the initial release.

Catalogue the original images first, identify what each image actually shows, and obtain confirmation before treating additional analysis workflows as approved requirements.

## 10. Backup and restore interface

The intended portable backup extension is `.mbak`.

Backup and restore must be distinct from CSV and PDF export.

The interface must eventually support the confirmed password-protected backup and restore workflow. The design must account for:

- Choosing or selecting a backup file.
- Entering a password where required.
- Communicating progress and errors.
- Rejecting invalid, corrupted, incompatible, or incorrectly encrypted files safely.
- Avoiding accidental loss of existing financial records.
- Confirming destructive actions where necessary.

The exact screens, directory selection behavior, restore policy, and backup-file management interactions must be documented from confirmed requirements and inspected references.

Security must be implemented in the underlying code; a password field or security message alone does not establish secure backup behavior.

## 11. Theme and visual consistency

A dark theme is required.

The implementation should use a consistent theme for:

- Backgrounds and surfaces.
- Primary and secondary text.
- Buttons and interactive controls.
- Category colors.
- Cards, dialogs, and navigation.
- Forms and validation messages.
- Charts and report previews.

Ensure text and controls remain readable in both light and dark appearances where both are supported.

Do not invent exact color values from screenshots that have not been inspected.

The screenshot catalog must record visible colors and styling only after direct inspection.

## 12. Empty, loading, and error states

Relevant screens should handle:

- No accounts.
- No transactions.
- No categories or targets.
- No matching records for a selected period or filter.
- Loading data.
- Failed database operations.
- Invalid user input.
- Failed export or backup operations.
- Failed or rejected restore operations.

Messages must be understandable to a non-technical user. Errors must not imply success when an operation failed.

The exact wording can be decided during implementation, provided it accurately describes the result.

## 13. Responsive layout and accessibility

The mobile application is the primary product.

UI implementation should:

- Avoid overflow on supported screen sizes.
- Keep forms usable with the on-screen keyboard.
- Provide readable text and sufficiently large interactive targets.
- Preserve clear visual hierarchy.
- Use labels and icons consistently.
- Avoid relying on color alone to communicate essential information.

Specific breakpoints, supported devices, and accessibility targets remain to be established where necessary.

## 14. Reference-image workflow

Original images are stored in:

`docs/reference-images/`

The reference inventory and inspection status belong in `docs/UI_REFERENCE_CATALOG.md`.

For each image:

1. Open and inspect the actual image.
2. Record its exact filename.
3. Describe the visible screen and interactions without guessing.
4. Distinguish visible observations from inferred behavior.
5. Identify which parts are relevant to MoneyLog.
6. Mark whether the image informs an already-confirmed requirement, suggests a design requiring approval, or is unrelated.
7. Record uncertainties and inspection failures.

Do not generate substitute images, rename originals, delete originals, or claim that an image was inspected if it was not accessible.

## 15. Current implementation versus intended design

This document describes intended UI requirements; it does not assert that they are implemented.

Use `IMPLEMENTATION_STATUS.md` for implementation claims and `ARCHITECTURE.md` for inspected technical behavior.

When a feature is implemented:

- Update the implementation status.
- Update the architecture if the technical design changes.
- Update this document only if an approved UI requirement changes.
- Update `DECISIONS.md` when the user confirms a new decision or changes an existing one.
- Record actual test results.

## 16. Unresolved UI questions

Do not silently decide the following from incomplete evidence:

- Exact Home/Records layout.
- Exact bottom-navigation destinations and ordering beyond confirmed decisions.
- Complete hamburger-menu contents.
- Transaction form layout and field arrangement.
- Account types and account-detail interactions.
- Target periods and calculation behavior.
- Which reference-app features are approved for MoneyLog.
- Basic PDF contents.
- Exact report and analysis layouts.
- Exact backup and restore screen behavior.
- Theme colors and detailed visual tokens.

Resolve these incrementally through actual screenshot inspection and explicit user confirmation.

## 17. Maintenance

Keep this document aligned with the approved product requirements.

Do not use this file to report unverified implementation progress. Do not copy observations from a reference app into confirmed requirements without approval.

Update `UI_REFERENCE_CATALOG.md` whenever the original image inventory or inspection status changes.