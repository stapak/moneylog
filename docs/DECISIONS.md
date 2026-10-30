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

### DEC-013 — Display Options controls
**Decision:** Records Display Options include a period selector, Show total, and Carry over controls.

**Unresolved behavior:** What Show total changes and what Carry over includes or carries between periods. `Screenshot 2 Display Options.jpg` visibly describes monthly surplus moving into the next month in the referenced app, but that wording is not approval of MoneyLog calculation semantics. Preserve only the presence of the controls until confirmed. (HOME-004)

### DEC-014 — Date-grouped Records and month browsing
**Decision:** Group transaction records by date and provide previous/next-month navigation in the monthly view. The filter control opens Display Options. (HOME-003, HOME-005)

### DEC-015 — Backup directory workflow
**Decision:** The intended workflow creates `.mbak` in a user-selected directory, allows the directory to be changed, and presents `.mbak` files found there for restore. Backups are password-protected, validated before modifying data, and failure must preserve current data. Backup/restore is distinct from CSV/PDF exports. (BAK-001–BAK-005)

**Privacy constraint:** A reference screenshot's suggestion to keep a copy on a computer or cloud service is not authorization for automatic upload.

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

### OPEN-010 — Show total behavior
The control's presence is recovered, but what total it displays, where it appears, and how it interacts with period selection is not settled. Do not infer behavior from screenshot state. (HOME-004)

### OPEN-011 — Carry over semantics
The control's presence is recovered. Confirm whether it affects display, reporting, targets, or another calculation. The screenshot says monthly surplus is added to the next month, but that is reference-app text and is not a confirmed MoneyLog financial rule. (HOME-004)

### OPEN-012 — Remaining navigation
Earlier navigation discussion/reference material included Records, Analysis, Budgets, Accounts, and Categories. The later confirmed decision moved Categories to the Home hamburger and replaced it with Target in bottom navigation. Confirm whether Records, Analysis, and Accounts remain bottom destinations, whether Budgets is represented by Target, and the final ordering/menu contents. The Categories and Target decisions remain confirmed. (NAV-001)

### OPEN-013 — Account deletion and balance rules
Confirm deletion behavior when transactions refer to an account, account types, and whether opening balances or negative balances have restrictions. Do not leave or silently repair dangling transaction references. (ACC-001, ACC-004)

### OPEN-014 — Target calculations
Confirm target period, category linkage, included transaction types, carry-forward, progress, and overspending calculations. (TGT-001)

### OPEN-015 — Restore policy
Confirm whether restore replaces, merges, or offers both; define duplicate handling and recovery. Validation-before-write and preserving existing data on failure are confirmed safeguards. (BAK-004)

### OPEN-016 — Export details
Confirm Basic PDF contents, CSV columns/filters, transfer handling, and which charts belong in each report. The three PDF modes and category selection requirement remain confirmed. (RPT-001–RPT-003)

### OPEN-017 — Money precision and attachments
Confirm currency/scale policy and supported bill file types, size limits, and attachment deletion lifecycle before implementation. (DAT-003, ATT-001)

## 3. How to maintain this file

- Add a new decision when the user explicitly confirms a new product or architecture choice.
- Give each decision a unique identifier.
- Do not mark an assumption as confirmed.
- If a confirmed decision changes, record the new decision and update the relevant specification.
- Keep implementation status separate in `IMPLEMENTATION_STATUS.md`.
- Do not make major architectural decisions without user approval.
