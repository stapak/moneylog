# MoneyLog — UI Reference Image Catalogue

**Document type:** Original visual reference inventory  
**Status:** Inventory seeded from filenames supplied by the project owner; visual inspection pending  
**Image directory:** `docs/reference-images/`  
**Last reviewed:** 2026-10-28

## 1. Purpose

This catalogue preserves the identity and inspection status of original UI reference images for MoneyLog.

It is intended to help the project owner, ChatGPT, and different Codex sessions work from the same visual reference material without repeatedly reconstructing the context.

This catalogue is not a claim that the images have already been inspected.

The image filenames listed below were supplied by the project owner. Verify every filename against the actual repository directory before declaring the inventory complete.

## 2. Mandatory inspection rules

For every image:

1. Locate the original file under `docs/reference-images/`.
2. Open the actual image and inspect its visible content.
3. Preserve the exact filename, including spaces, punctuation, capitalization, and extension.
4. Describe only visible details that can be supported by the image.
5. Record inferred interactions separately from visible evidence.
6. Classify its relevance to MoneyLog.
7. Link it to relevant sections of `UI_UX_SPEC.md` where appropriate.
8. Record the inspection result and any uncertainty.

Do not infer complete screen behavior from a filename.

Do not generate replacement images or modify the originals as part of catalogue creation.

## 3. Inspection status definitions

Use these statuses consistently:

- **PENDING** — the file has not yet been opened and inspected.
- **INSPECTED** — the image has been opened and its visible content recorded.
- **UNAVAILABLE** — the file could not be found or opened; explain why.
- **NEEDS CLARIFICATION** — the image was inspected, but its intended relevance or meaning is unclear.

Use these relevance classifications:

- **CONFIRMED REQUIREMENT** — directly corresponds to an already-confirmed MoneyLog requirement.
- **REFERENCE ONLY** — offers visual inspiration but is not an approved requirement.
- **REQUIRES APPROVAL** — depicts a feature or behavior that needs the owner's explicit confirmation.
- **UNRELATED/UNKNOWN** — relevance has not been established.

A filename or inspection alone does not make a feature approved.

## 4. Original image inventory

All entries begin with inspection status **PENDING**. Update them only after examining the actual files.

### 4.1 Named transaction and screen references

| Exact filename | Inspection status | Visible content and notes | Relevance |
|---|---|---|---|
| `Income transaction.jpg` | PENDING | Record the actual visible content after inspection. Do not infer fields from the filename. | UNKNOWN |
| `Screenshot 1 Home Records page.jpg` | PENDING | Inspect the actual screen, summaries, records, controls, and layout. | UNKNOWN |
| `Screenshot 2 Display Options.jpg` | PENDING | Inspect the actual options and their labels. | UNKNOWN |
| `Screenshot 3 Categories page.jpg` | PENDING | Inspect the actual category layout and visible controls. | UNKNOWN |
| `Screenshot 4 Accounts page.jpg` | PENDING | Inspect the actual account layout and visible controls. | UNKNOWN |
| `Screenshot 5 Account Details Account Transactions.jpg` | PENDING | Inspect the actual account-detail content and transaction presentation. | UNKNOWN |
| `Screenshot 6 Add New Account popup.jpg` | PENDING | Inspect the popup, labels, fields, buttons, and validation indicators if visible. | UNKNOWN |
| `Screenshot 7 Add New Category popup.jpg` | PENDING | Inspect the popup, labels, fields, buttons, and visible options. | UNKNOWN |
| `Screenshot 8 Edit Category + Category Actions 1.jpg` | PENDING | Inspect the actual edit interface and visible category actions. | UNKNOWN |
| `Screenshot 8 Edit Category + Category Actions 2.jpg` | PENDING | Inspect the actual image independently; do not assume it duplicates the preceding file. | UNKNOWN |
| `Screenshot 9 Budgets page.jpg` | PENDING | Inspect the actual budget screen, figures, navigation, and controls. | UNKNOWN |
| `Screenshot 10 Budget category ⋯ menu.jpg` | PENDING | Inspect the actual menu and its visible options. Preserve the ellipsis character in the filename. | UNKNOWN |
| `Screenshot 11 Budgeted Category Details.jpg` | PENDING | Inspect the actual details screen and visible calculations or controls. | UNKNOWN |
| `Screenshot 12 Transaction Details popup from Records.jpg` | PENDING | Inspect the popup and the visible transaction details and actions. | UNKNOWN |
| `Screenshot 13 Analysis page — Expense Overview.jpg` | PENDING | Inspect the actual analysis layout, statistics, charts, and controls. Preserve the em dash in the filename. | UNKNOWN |
| `Screenshot 14 Expense Flow.jpg` | PENDING | Inspect the actual image and establish what the displayed flow represents. | UNKNOWN |
| `Transfer transaction.jpg` | PENDING | Inspect the actual transaction interface. Do not infer transfer rules from the filename. | UNKNOWN |

### 4.2 Numbered image references

The project owner also supplied `image 1.jpg` through `image 24.jpg`. Each image must be opened and catalogued independently.

| Exact filename | Inspection status | Visible content and notes | Relevance |
|---|---|---|---|
| `image 1.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 2.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 3.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 4.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 5.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 6.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 7.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 8.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 9.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 10.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 11.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 12.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 13.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 14.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 15.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 16.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 17.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 18.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 19.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 20.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 21.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 22.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 23.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |
| `image 24.jpg` | PENDING | Record visible content after inspection. | UNKNOWN |

## 5. Required inspection record

For each image, replace the placeholder notes with an evidence-based entry. Use this format where more detail is useful:

### `[Exact filename]`

- **Inspection status:** INSPECTED / UNAVAILABLE / NEEDS CLARIFICATION
- **Image dimensions:** Record if readily available.
- **Visible screen or component:** Describe what is actually shown.
- **Visible labels and controls:** Record relevant readable text and controls.
- **Layout and visual styling:** Describe supported observations about spacing, colors, cards, typography, navigation, and arrangement.
- **Visible interaction states:** Record menus, dialogs, selected options, or other states actually visible.
- **Possible workflow:** Describe a plausible workflow, clearly labelled as inference when not directly demonstrated.
- **MoneyLog relevance:** CONFIRMED REQUIREMENT / REFERENCE ONLY / REQUIRES APPROVAL / UNRELATED/UNKNOWN
- **Related UI specification section:** Link to the relevant section of `UI_UX_SPEC.md`, if applicable.
- **Open questions:** Record ambiguity, unreadable text, or decisions requiring owner confirmation.

Do not duplicate this template unnecessarily when a concise table entry is sufficient.

## 6. Confirmed product decisions relevant to references

These decisions are already recorded in the project documentation and must not be changed solely because a screenshot looks different:

- The phone is the primary owner of financial data.
- Mobile development precedes the laptop-hosted website.
- Home/Records summaries show Income and Expense, not Balance.
- Summary periods are Daily, Monthly, 3 Months, Yearly, and All Time.
- Categories are accessible from the Home hamburger menu.
- Target replaces Categories in the bottom navigation.
- A global floating `+` button opens Add New Transaction.
- Built-in and custom categories, colors, and separate income/expense category lists are required.
- The intended portable backup extension is `.mbak`.
- PDF export options are Basic; Expenses + descriptions; and Expenses + descriptions + bills.
- A dark theme is required.

Refer to `DECISIONS.md` and `PROJECT_SPEC.md` for the full requirements.

## 7. Distinguishing reference observations from requirements

When a reference image depicts a feature not already approved:

1. Document the visible feature.
2. Classify it as REFERENCE ONLY or REQUIRES APPROVAL.
3. Do not add it to the confirmed requirements merely because it exists in the reference application.
4. Ask the project owner before making a material product decision.
5. Once approved, update `DECISIONS.md` and `PROJECT_SPEC.md` as appropriate.

## 8. Inventory reconciliation

The initial inventory contains **41 named entries**:

- 17 named transaction and screen references.
- 24 numbered `image N.jpg` references.

These counts reflect the filenames supplied by the project owner, not a verified filesystem listing.

Before declaring the catalogue complete, compare every entry with the actual `docs/reference-images/` directory.

Report separately:

- Number of image files actually found.
- Number successfully opened and inspected.
- Number fully catalogued.
- Number unavailable or unreadable.
- Unexpected image files not yet listed in this document.
- Listed files that do not exist in the repository.
- Any filename differences that need correction.

Do not mark the catalogue complete while any discovered image remains unaccounted for.

## 9. Maintenance and handover

Whenever reference images are added or removed:

- Update this inventory.
- Preserve exact original filenames.
- Record inspection status honestly.
- Update `UI_UX_SPEC.md` only when a supported UI requirement or approved design decision changes.
- Keep implementation status in `IMPLEMENTATION_STATUS.md`.
- Keep confirmed decisions in `DECISIONS.md`.

The purpose of this catalogue is to make future work reproducible across different ChatGPT and Codex sessions without inventing missing visual information.