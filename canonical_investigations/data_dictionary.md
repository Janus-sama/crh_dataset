# Data Dictionary — `canonical_investigation.csv`

This file defines the structure and meaning of the fields exported from the **Canonical Investigation** model in the EMR.
It maps **canonical investigations** to their component **LOINC atoms**, including metadata required for form validation.

---

## Fields

| Column Name                         | Type           | Description                                                                                   | Example                                   |
| ----------------------------------- | -------------- | --------------------------------------------------------------------------------------------- | ----------------------------------------- |
| **LoincCode**                       | string         | The LOINC code of the atom (child element of the canonical investigation). Unique identifier. | `8889-8`                                  |
| **AtomName**                        | string         | The descriptive name of the atom (from LOINC Long Common Name).                               | `Heart rate by Pulse oximetry - Pre-test` |
| **CanonicalInvestigationLoincCode** | string         | The LOINC code of the canonical investigation (the “parent” investigation).                   | `64098-7`                                 |
| **CanonicalInvestigationName**      | string         | The descriptive name of the canonical investigation.                                          | `Six Minute Walk Test`                    |
| **Category**                        | string         | Type of investigation: `"lab"`, `"radiology"`, or `"other"`.                                  | `other`                                   |
| **Unit**                            | string         | Unit of measurement associated with the atom (from LOINC Units). May be blank.                | `m/(6.min)`                               |
| **Type**                            | string         | Data type for form validation. Derived from LOINC **Scale** (`Qn`, `Ord`, `Nom`, etc.).       | `numeric`                                 |
| **Required**                        | boolean\|blank | Indicates if the atom is mandatory. Currently left blank.                                     | (blank)                                   |

---

## Notes on Columns

* **LoincCode** and **CanonicalInvestigationLoincCode** may differ:

  * `LoincCode` → represents the atom (e.g. "Heart rate by Pulse oximetry").
  * `CanonicalInvestigationLoincCode` → represents the higher-level investigation (e.g. "Six Minute Walk Test").

* **Type Mapping (from LOINC SCALE\_TYP):**

  | LOINC SCALE\_TYP | CSV `Type` value | Meaning (for form validation) |
  | ---------------- | ---------------- | ----------------------------- |
  | `Qn`             | `numeric`        | Quantitative, numeric values  |
  | `Ord`            | `ordinal`        | Ordered categorical values    |
  | `Nom`            | `text`           | Nominal / qualitative text    |
  | `Nar`            | `long_text`      | Narrative descriptions        |
  | `Doc`            | `document`       | Structured documents          |

* **Required** → left blank by default since requirement rules may vary by context.

---

## Example Rows

```csv
"LoincCode","AtomName","CanonicalInvestigationLoincCode","CanonicalInvestigationName","Category","Unit","Type","Required"
"64098-7","Six minute walk distance","64098-7","Six Minute Walk Test","other","m/(6.min)","numeric",""
"8889-8","Heart rate by Pulse oximetry - Pre-test","64098-7","Six Minute Walk Test","other","b/m","numeric",""
"59408-5","Oxygen saturation in Arterial blood by Pulse oximetry - Pre-test","64098-7","Six Minute Walk Test","other","%","numeric",""
```