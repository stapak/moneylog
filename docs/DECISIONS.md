# MoneyLog — Design Decisions

**Status:** Initial decision register  
**Purpose:** Preserve confirmed requirements and track unresolved decisions.

## 1. Confirmed decisions

### DEC-001 — Mobile-first development
**Decision:** Complete and stabilize the mobile application before building the website.

**Reason:** The mobile application is the primary product and owns the user's financial data.

### DEC-002 — Local-first data ownership
**Decision:** The phone is the primary owner of MoneyLog data.

**Constraints:**
- No mandatory cloud service.
- No permanent backend is required.
- Financial records remain under the user's control.
- Backup and restore must be supported.

### DEC-003 — Home/Records summary
**Decision:** The Home/Records summary shows Income and Expense, not Balance.

**Constraint:** Do not reintroduce Balance into this summary without explicit approval.

### DEC-004 — Reporting periods
**Decision:** The Home/Records summary supports:
- Daily
- Monthly
- 3 Months
- Yearly
- All Time

### DEC-005 — Navigation
**Decision:**
- Categories belongs in the Home hamburger menu.
- Target replaces Categories in the bottom navigation.
- A global floating '+' button provides access to adding a transaction.

### DEC-006 — Categories
**Decision:** Support built-in and user-created categories, category colors, and separate income and expense category lists.

**Additional requirement:** Provide category checkboxes for selecting categories in supported export workflows.

### DEC-007 — Portable backup format
**Decision:** The intended backup extension is `.mbak`.

**Constraint:** A backup must be distinguishable from CSV and PDF exports and must support restoring the required application data.

### DEC-008 — Backup security
**Decision:** Backups must be password-protected using encryption, not merely a stored password hash.

**Constraints:**
- Do not store plaintext backup passwords in the package.
- Use established cryptographic libraries.
- Validate backup integrity before restoration.
- Handle incorrect passwords and corrupted packages safely.

### DEC-009 — PDF export options
**Decision:** Provide three options:
1. Basic.
2. Expenses + descriptions.
3. Expenses + descriptions + bills.

The exact contents of Basic remain to be confirmed.

### DEC-010 — Themes
**Decision:** Support a dark theme.

### DEC-011 — Temporary website workspace
**Decision:** The future website is a temporary workspace hosted on the user's laptop.

**Constraints:**
- No permanent backend is required.
- Data transfer must be deliberate and validated.
- Changes can be exported and imported back into the phone.
- The website is a later development phase.

### DEC-012 — Preserve existing implementation
**Decision:** Development must proceed incrementally, preserving existing working code and user data.

**Constraint:** Inspect before editing. Avoid destructive changes and unnecessary rewrites.

## 2. Unresolved decisions

The following items must not be silently assumed.

### OPEN-001 — Account model
Confirm supported account types, opening balances, transfers, and account deletion behavior.

### OPEN-002 — Transaction model
Verify transaction fields, date handling, currency precision, and transfer representation against the actual implementation.

### OPEN-003 — Target calculations
Confirm how targets are created, measured, and displayed, including date periods and overspending.

### OPEN-004 — Backup restoration
Decide whether restoration replaces existing data, merges data, or offers both options. Define duplicate handling and rollback behavior.

### OPEN-005 — Backup package format
Verify whether a package format already exists. If not, define its schema, versioning, encryption, integrity checks, and migration strategy before implementing it.

### OPEN-006 — PDF Basic contents
Confirm which transaction fields, summaries, and charts belong in the Basic export.

### OPEN-007 — CSV export
Confirm the fields, filtering options, and expected CSV structure.

### OPEN-008 — Website data transfer
Select a safe, practical mechanism for transferring data between the phone and the laptop-hosted website.

### OPEN-009 — Screenshot references
Identify which supplied screenshots represent approved MoneyLog designs and which are examples from other applications.

## 3. How to maintain this file

- Add a new decision when the user explicitly confirms a new product or architecture choice.
- Give each decision a unique identifier.
- Do not mark an assumption as confirmed.
- If a confirmed decision changes, record the new decision and update the relevant specification.
- Keep implementation status separate in `IMPLEMENTATION_STATUS.md`.
- Do not make major architectural decisions without user approval.