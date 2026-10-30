# MoneyLog — UI Reference Image Catalogue

**Document type:** Original visual reference inventory
**Status:** All files in the current reference directory opened and catalogued
**Image directory:** `docs/reference-images/`
**Last reviewed:** 2026-10-30

## 1. Purpose and authority

This catalogue records what is visibly present in the original screenshot files. It is evidence about the referenced app's screens and states; it does not approve those features for MoneyLog. Approved MoneyLog UI requirements are recorded in [UI_UX_SPEC.md](UI_UX_SPEC.md), with product requirements and decisions in [PROJECT_SPEC.md](PROJECT_SPEC.md) and [DECISIONS.md](DECISIONS.md).

Requirement IDs and current implementation evidence are indexed in [REQUIREMENTS_TRACEABILITY.md](REQUIREMENTS_TRACEABILITY.md).

Every image below was opened with the local image viewer and visually examined. Descriptions report readable content and visible layout; they do not assert behavior beyond what the screenshot demonstrates. “Possible workflow” is omitted where a screenshot alone cannot establish one. Relevance is classified against currently documented MoneyLog requirements, not inferred from the image's original app.

## 2. Status and relevance definitions

- **INSPECTED** — the actual image was opened and its visible content recorded.
- **UNAVAILABLE** — the file could not be opened; none of the current files has this status.
- **NEEDS CLARIFICATION** — the image was inspected but its meaning or relevance remains unclear.

Relevance values:

- **CONFIRMED REQUIREMENT** — visibly corresponds to a MoneyLog requirement already documented.
- **REFERENCE ONLY** — a visual or interaction observation, without approval as a MoneyLog requirement.
- **REQUIRES APPROVAL** — depicts a feature or behavior that must be explicitly approved before adoption.
- **UNRELATED/UNKNOWN** — relevance is not established.

## 3. Inspected images

The theme in these screenshots is predominantly pale cream with dark green text and outlines, green income/accent values, red expense values, and circular pictogram icons. The screenshots appear to be from an app branded “MyMoney.” This is a visual observation, not a MoneyLog branding or color decision. Some screenshots include Android status/navigation bars and a software keyboard.

### Named transaction and screen references

| Exact filename | Status | Observed screen, labels, state, and uncertainty | Relevance | UI spec |
|---|---|---|---|---|
| `Income transaction.jpg` | INSPECTED | Records screen dimmed behind an open green **INCOME** detail dialog. Shows ₹20,000.00, Sep 10, 2026 4:39 PM, Account **Card**, Category **Salary**, “No notes”; top icons appear to close, delete, duplicate, and edit. Background summary shows EXPENSE ₹552.00 and INCOME ₹20,052.00. Filename says “transaction,” but this is a detail dialog, not an add form. | CONFIRMED REQUIREMENT — income type and income/expense summary are established; dialog actions/layout remain observations. | [§5](UI_UX_SPEC.md#5-transactions), [§4](UI_UX_SPEC.md#4-application-navigation) |
| `Transfer transaction.jpg` | INSPECTED | Records screen behind a blue **TRANSFER** detail dialog showing ₹500.00, Sep 10, 2026 3:53 PM, From **Savings**, To **Card**, and note “test”; close, delete, duplicate, and edit icons are visible. The lower edge is cropped, so any further content is not readable. | CONFIRMED REQUIREMENT — distinct transfer type is established; dialog design and actions are not thereby approved. | [§5](UI_UX_SPEC.md#5-transactions), [§6](UI_UX_SPEC.md#6-accounts) |
| `Screenshot 1 Home  Records page.jpg` | INSPECTED | Records screen with hamburger, “MyMoney” wordmark, search, month arrows and filter; September 2026; EXPENSE ₹552.00 and INCOME ₹20,052.00; date-grouped records for Coupons, Salary, Transfer, Bills, and Food. A floating plus is above bottom tabs Records, Analysis, Budgets, Accounts, Categories. | CONFIRMED REQUIREMENT — income/expense summaries, transaction types, and global plus are documented. The shown Categories bottom tab conflicts with the confirmed Target destination and is not adopted. | [§4](UI_UX_SPEC.md#4-application-navigation), [§5](UI_UX_SPEC.md#5-transactions) |
| `Screenshot 2 Display Options.jpg` | INSPECTED | Modal **Display options** shows View mode DAILY, WEEKLY, MONTHLY (selected), 3 MONTHS ★, 6 MONTHS ★, YEARLY ★; Show total YES/NO (NO selected); Carry over ON/OFF (ON selected) and explanatory text that monthly surplus carries forward. | REQUIRES APPROVAL — weekly and 6-month periods and carry-over behavior conflict with or extend the confirmed period list; the screenshot also does not establish those options' meaning in MoneyLog. | [§4](UI_UX_SPEC.md#4-application-navigation), [§8](UI_UX_SPEC.md#8-target-and-budgets), [§16](UI_UX_SPEC.md#16-unresolved-ui-questions) |
| `Screenshot 3 Categories page.jpg` | INSPECTED | Category screen with an all-accounts amount and expense/income-so-far totals, separate **Income categories** and **Expense categories** lists, colored icons, per-row ellipsis menus, **ADD NEW CATEGORY**, and Categories selected in the bottom navigation. | REQUIRES APPROVAL — separate income/expense categories and custom categories are confirmed, but this screen's placement, totals, menu, and Categories tab conflict with confirmed hamburger/Target navigation. | [§4](UI_UX_SPEC.md#4-application-navigation), [§7](UI_UX_SPEC.md#7-categories) |
| `Screenshot 4 Accounts page.jpg` | INSPECTED | **Accounts** screen shows “All Accounts ₹19,500.00,” expense/income totals, and cards for Card, Cash, Savings with balances and ellipsis menus; **ADD NEW ACCOUNT**, floating plus, and Accounts bottom tab are visible. | REFERENCE ONLY — account support is in the product specification, but this particular summary, balance presentation, and controls are observations. | [§6](UI_UX_SPEC.md#6-accounts) |
| `Screenshot 5 Account Details  Account Transactions.jpg` | INSPECTED | **Account details**, Records: All time. Card icon/name and Account balance ₹20,448.00; note says monthly, weekly, or daily statistics are in Analysis. Shows “Total 3 records,” NEW TO OLD sort, September 2026 grouping, Salary, transfer [Savings > Card] with “test,” and Food. | REFERENCE ONLY — account transaction history is relevant; specific balances, date controls, sorting and analysis handoff need product decisions. | [§6](UI_UX_SPEC.md#6-accounts), [§9](UI_UX_SPEC.md#9-reports-analysis-and-exports) |
| `Screenshot 6 Add New Account popup.jpg` | INSPECTED | **Add new account** modal with Initial amount field set to 0 and note “Initial amount will not be reflected in analysis,” Name “Untitled,” five icon choices, CANCEL/SAVE; numeric keyboard is open. | REQUIRES APPROVAL — account creation is in scope, but initial-amount treatment and this dialog's details are not confirmed. | [§6](UI_UX_SPEC.md#6-accounts), [§16](UI_UX_SPEC.md#16-unresolved-ui-questions) |
| `Screenshot 7 Add New Category popup.jpg` | INSPECTED | **Add new category** dialog; Type INCOME / EXPENSE with EXPENSE selected, Name “Untitled,” ten visible icon choices, CANCEL/SAVE; text keyboard is open. | CONFIRMED REQUIREMENT — custom categories, income/expense distinction, and category icons/colors are established; exact dialog is reference observation. | [§7](UI_UX_SPEC.md#7-categories) |
| `Screenshot 8 Edit Category + Category Actions 1.jpg` | INSPECTED | **Edit category** dialog with Name “Awards,” ten pictogram choices, one highlighted, CANCEL/SAVE. Background category list is dimmed; keyboard is not visible. | REFERENCE ONLY — category editing is a plausible control, but exact edit behavior and icon set are not established by requirements. | [§7](UI_UX_SPEC.md#7-categories) |
| `Screenshot 8 Edit Category + Category Actions 2.jpg` | INSPECTED | Category list with an ellipsis menu open for Awards; menu options **Edit**, **Delete**, **Ignore**. Separate income and expense headings and floating plus are visible; Categories bottom tab is selected. | REQUIRES APPROVAL — Ignore action and tab placement are not approved and tab conflicts with the Target navigation decision. | [§4](UI_UX_SPEC.md#4-application-navigation), [§7](UI_UX_SPEC.md#7-categories) |
| `Screenshot 9 Budgets page.jpg` | INSPECTED | September 2026 budget page: TOTAL BUDGET ₹5,000.00, TOTAL SPENT ₹500.00; Bills budget shows limit, spent, remaining, progress bar. “Not budgeted this month” rows have SET BUDGET; bottom includes **SET FROM PAST MONTHS**. | REFERENCE ONLY — budget goals are established, while carry-forward, layout and exact calculations are not confirmed. | [§8](UI_UX_SPEC.md#8-target-and-budgets) |
| `Screenshot 10 Budget category ⋯ menu.jpg` | INSPECTED | Same budget screen with Bills ellipsis menu open; options **Change limit** and **Remove budget**. | REFERENCE ONLY — menu actions are observations, not approved MoneyLog behavior. | [§8](UI_UX_SPEC.md#8-target-and-budgets) |
| `Screenshot 11 Budgeted Category Details.jpg` | INSPECTED | **Category details**, time selected September 2026, Bills / Expense category; circular chart and “90.58% of total expense in this period,” “Expense in this period: -₹500.00,” one record, Cash -₹500.00. | REQUIRES APPROVAL — detailed category analytics and chart treatment are not established as required. | [§8](UI_UX_SPEC.md#8-target-and-budgets), [§9](UI_UX_SPEC.md#9-reports-analysis-and-exports) |
| `Screenshot 12 Transaction Details popup from Records.jpg` | INSPECTED | Records screen dimmed behind red **EXPENSE** detail dialog showing -₹52.00, Sep 10, 2026 12:49 PM, Account Card, Category Food, “No notes,” plus close/delete/duplicate/edit icons. | CONFIRMED REQUIREMENT — expense transaction type and summary are established; dialog layout/actions remain reference observations. | [§5](UI_UX_SPEC.md#5-transactions) |
| `Screenshot 13 Analysis page — Expense Overview.jpg` | INSPECTED | Analysis screen with September totals, **EXPENSE OVERVIEW** selector, doughnut chart labeled Expenses and legend Bills/Food; rows show amounts and percentages (90.58%, 9.42%). | REQUIRES APPROVAL — analysis layout, chart and category percentages require approval beyond confirmed reporting needs. | [§9](UI_UX_SPEC.md#9-reports-analysis-and-exports) |
| `Screenshot 14 Expense Flow.jpg` | INSPECTED | Expense Flow view with September summary, red daily line chart and date axis, then a September calendar with weekday headings and daily values; screenshot begins below the usual app header. | REQUIRES APPROVAL — this analysis view is not an established required screen. | [§9](UI_UX_SPEC.md#9-reports-analysis-and-exports) |

### Numbered image references

| Exact filename | Status | Observed screen, labels, state, and uncertainty | Relevance | UI spec |
|---|---|---|---|---|
| `image 1.jpg` | INSPECTED | Expense Overview doughnut with tooltip **Food 9.42%** over chart; Bills and Food legend and category amount/progress rows below. | REQUIRES APPROVAL — tooltip/chart interaction is not a confirmed requirement. | [§9](UI_UX_SPEC.md#9-reports-analysis-and-exports) |
| `image 2.jpg` | INSPECTED | Category details for Bills in September 2026; 90.58% of expense, -₹500.00, one Cash record. Similar view to Screenshot 11, without bottom tabs. | REQUIRES APPROVAL — detailed analytics are unconfirmed. | [§9](UI_UX_SPEC.md#9-reports-analysis-and-exports) |
| `image 3.jpg` | INSPECTED | Analysis selector open; visible options Expense overview, Income overview, Expense flow, Income flow, Account analysis. | REQUIRES APPROVAL — these analysis destinations are not established requirements. | [§9](UI_UX_SPEC.md#9-reports-analysis-and-exports), [§16](UI_UX_SPEC.md#16-unresolved-ui-questions) |
| `image 4.jpg` | INSPECTED | Income Overview doughnut with Salary/Coupons legend and rows; amounts ₹20,000.00 and ₹52.00, percentages 99.74% and 0.26%; a Salary 99.74% tooltip is visible. | REQUIRES APPROVAL — analysis presentation is unconfirmed. | [§9](UI_UX_SPEC.md#9-reports-analysis-and-exports) |
| `image 5.jpg` | INSPECTED | Expense Flow line chart with a selected-point tooltip “Sep 07 ₹0.00”; September calendar below shows -552.0 on one date. | REQUIRES APPROVAL — chart interaction and flow view are unconfirmed. | [§9](UI_UX_SPEC.md#9-reports-analysis-and-exports) |
| `image 6.jpg` | INSPECTED | Analysis day view for Sep 01, 2026 with ₹0.00 expense and income, flat chart and a selected zero point; calendar shows the single date. | REQUIRES APPROVAL — empty/day analysis state is only a reference observation. | [§9](UI_UX_SPEC.md#9-reports-analysis-and-exports), [§12](UI_UX_SPEC.md#12-empty-loading-and-error-states) |
| `image 7.jpg` | INSPECTED | Income Flow September chart with one tall green point and calendar values “20.0k” and “52.0” on dates; expense/income totals remain at top. | REQUIRES APPROVAL — flow chart is not established. | [§9](UI_UX_SPEC.md#9-reports-analysis-and-exports) |
| `image 8.jpg` | INSPECTED | Income Flow day view for Sep 01, 2026; both summary totals are ₹0.00, chart selected at zero and one-day calendar below. | REQUIRES APPROVAL — flow chart is not established. | [§9](UI_UX_SPEC.md#9-reports-analysis-and-exports) |
| `image 9.jpg` | INSPECTED | Income Flow month view with selected chart point “Sep 12 ₹0.00” and calendar showing income entries 20.0k and 52.0 on dates. | REQUIRES APPROVAL — chart interaction is not established. | [§9](UI_UX_SPEC.md#9-reports-analysis-and-exports) |
| `image 10.jpg` | INSPECTED | Account Analysis grouped bars (Expense/Income) for Card, Cash, Savings; account rows show period expense and income values. | REQUIRES APPROVAL — this specific analysis screen is unconfirmed. | [§9](UI_UX_SPEC.md#9-reports-analysis-and-exports), [§6](UI_UX_SPEC.md#6-accounts) |
| `image 11.jpg` | INSPECTED | Similar Account Analysis chart and account rows as image 10, with a Card ₹20,000.00 tooltip selected over the bar. | REQUIRES APPROVAL — chart interaction and analysis screen are unconfirmed. | [§9](UI_UX_SPEC.md#9-reports-analysis-and-exports) |
| `image 12.jpg` | INSPECTED | Account details for Card, September 2026: balance ₹20,448.00, starting balance ₹0.00, expense/income proportions, transfer in/out totals, ending balance and three transactions. | REFERENCE ONLY — account balances and transfers are relevant; the period breakdown and layout are not confirmed. | [§6](UI_UX_SPEC.md#6-accounts) |
| `image 13.jpg` | INSPECTED | Add-transaction form, EXPENSE selected among INCOME/EXPENSE/TRANSFER; Account and Category selectors, Add notes field, amount display and arithmetic keypad, date/time controls. | CONFIRMED REQUIREMENT — transaction types and description support are established; precise form and keypad are reference observations. | [§5](UI_UX_SPEC.md#5-transactions) |
| `image 14.jpg` | INSPECTED | Same expense-entry form dimmed behind **Select an account** bottom sheet listing Card, Cash, Savings and balances plus **ADD NEW ACCOUNT**. | REFERENCE ONLY — account selection sheet and balances are not specified. | [§5](UI_UX_SPEC.md#5-transactions), [§6](UI_UX_SPEC.md#6-accounts) |
| `image 15.jpg` | INSPECTED | **Select a category** bottom sheet with a 3-column icon/name grid and **ADD NEW CATEGORY** button. Visible category names include Baby, Beauty, Bills, Car, Clothing, Education, Electronics, Entertainment, Food, Health, Home, Insurance, Shopping, Social, Sport, Tax, Telephone, Transportation. | REFERENCE ONLY — custom category capability is confirmed; picker layout and displayed set are not. | [§5](UI_UX_SPEC.md#5-transactions), [§7](UI_UX_SPEC.md#7-categories) |
| `image 16.jpg` | INSPECTED | Expense-entry form with Cash account, Home category, empty Add notes field with cursor and amount 0. Keyboard is open and lower keypad partly hidden. | CONFIRMED REQUIREMENT — expense, account/category association and descriptions are documented; this exact entry state is illustrative. | [§5](UI_UX_SPEC.md#5-transactions) |
| `image 17.jpg` | INSPECTED | Expense form behind a clock picker showing 3:16 PM, analog dial, keyboard toggle, CANCEL and OK. | REFERENCE ONLY — time-entry picker style is not specified. | [§5](UI_UX_SPEC.md#5-transactions) |
| `image 18.jpg` | INSPECTED | Expense form behind date picker showing year 2026, Sat, 12 Sept, September calendar, date 12 selected and CANCEL/OK. | REFERENCE ONLY — date picker appearance is not specified. | [§5](UI_UX_SPEC.md#5-transactions) |
| `image 19.jpg` | INSPECTED | Income entry selected; Cash account, category unselected, note “testing,” amount 500.5, arithmetic keypad and Sep 12, 2026 / 3:16 PM selectors. | CONFIRMED REQUIREMENT — Income type and description support are established; input layout remains an observation. | [§5](UI_UX_SPEC.md#5-transactions) |
| `image 20.jpg` | INSPECTED | Transfer entry selected; From Card, To Cash, note “testing,” amount 500.5, keypad and date/time selectors. | CONFIRMED REQUIREMENT — transfer between accounts is established; UI layout is only a reference. | [§5](UI_UX_SPEC.md#5-transactions), [§6](UI_UX_SPEC.md#6-accounts) |
| `image 21.jpg` | INSPECTED | Hamburger drawer headed MyMoney / 6.6-free. Items: Preferences; Management (Export Report, Backup & Restore, Delete & Reset); Application (Pro version, Like MyMoney, Help, Feedback). | REQUIRES APPROVAL — product/version, reset and menu contents are not MoneyLog approvals; backup/export relate to documented needs but this navigation is not established. | [§4](UI_UX_SPEC.md#4-application-navigation), [§9](UI_UX_SPEC.md#9-reports-analysis-and-exports), [§10](UI_UX_SPEC.md#10-backup-and-restore-interface) |
| `image 22.jpg` | INSPECTED | Export Report screen dimmed behind date picker showing Tue, 1 Sept 2026 selected; background has From/To range, expense categories and EXPORT CSV / EXPORT PDF ★ buttons. | REFERENCE ONLY — date range and CSV/PDF controls are visible; screenshot does not establish MoneyLog's approved report flow or PDF options. | [§9](UI_UX_SPEC.md#9-reports-analysis-and-exports) |
| `image 23.jpg` | INSPECTED | **Export Report** page with date range Sep 01–30, 2026; summary says 5 records, 2 expense records in 2 categories and 2 income records in 2 categories; note says CSV/PDF files cannot restore data; EXPORT CSV and EXPORT PDF ★ buttons. | CONFIRMED REQUIREMENT — distinction between exports and backup is documented; displayed summary and screen layout remain reference observations. | [§9](UI_UX_SPEC.md#9-reports-analysis-and-exports), [§10](UI_UX_SPEC.md#10-backup-and-restore-interface) |
| `image 24.jpg` | INSPECTED | **Backup & Restore** page with .mbak-to-MyMoney diagram, explanatory backup/restore text, BACKUP NOW, RESTORE, SELECT/CHANGE DIRECTORY buttons and a note about the selected directory. Text mentions cloud storage as a suggested safe place; that is not a MoneyLog requirement and does not override local-first/privacy requirements. | CONFIRMED REQUIREMENT — `.mbak` backup and distinction from report exports are established; directory mechanics and cloud recommendation are not approved. | [§10](UI_UX_SPEC.md#10-backup-and-restore-interface) |

## 4. Confirmed requirements and visible conflicts

The catalog observations do not change approved decisions. In particular:

- Home/Records summaries are Income and Expense, never Balance; supported periods are Daily, Monthly, 3 Months, Yearly, and All Time. The Display Options image shows Weekly, 6 Months, and budget carry-over, which are not approved summary choices.
- Categories belong in the Home hamburger menu, and Target replaces Categories in bottom navigation. The reference app shows Categories as a bottom tab; that older arrangement is not adopted.
- The global floating `+` opens Add New Transaction. Expense, Income, and Transfer are distinct transaction types; transfers are excluded from income/expense totals.
- The phone owns financial data; mobile development precedes the laptop-hosted website. A screenshot suggesting cloud storage is not approval for mandatory or automatic upload.
- Dark theme is required. These references mostly show a light cream theme and do not establish MoneyLog color tokens.
- Portable backup uses `.mbak`. PDF options remain Basic; Expenses + descriptions; and Expenses + descriptions + bills. The screenshots do not override these options.

See [UI_UX_SPEC.md §2](UI_UX_SPEC.md#2-evidence-and-authority), [§4](UI_UX_SPEC.md#4-application-navigation), [§5](UI_UX_SPEC.md#5-transactions), [§9](UI_UX_SPEC.md#9-reports-analysis-and-exports), [§10](UI_UX_SPEC.md#10-backup-and-restore-interface), and [§16](UI_UX_SPEC.md#16-unresolved-ui-questions).

## 5. Inventory reconciliation

The directory was enumerated and compared against the catalogue inventory on 2026-10-30. It contains 41 image files: 17 named transaction/screen references and 24 numbered images (`image 1.jpg` through `image 24.jpg`). Each discovered file was opened with the local image viewer and visually inspected during this audit; every file has a catalogue row and exact filename. None was unreadable or unavailable. No files are present in the directory but missing from this catalogue, and no catalogue entry refers to a nonexistent file. No unexpected files or filename discrepancies were found.

| Measure | Count |
|---|---:|
| Image files found | 41 |
| Opened and inspected | 41 |
| Fully catalogued | 41 |
| Unavailable or unreadable | 0 |
| Present in directory but missing from catalogue | 0 |
| Catalogue entries whose files are absent | 0 |

## 6. Maintenance

When reference images change, preserve original files and exact names, inspect each changed or added image, and update this inventory and the counts. Do not replace originals with generated images. Keep approved MoneyLog requirements in `UI_UX_SPEC.md`, product requirements in `PROJECT_SPEC.md`, and confirmed decisions in `DECISIONS.md`; do not promote reference-app features into those documents without approval.
