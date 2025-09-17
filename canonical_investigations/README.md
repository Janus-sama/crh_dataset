# Canonical Investigation Dataset

This dataset (`canonical_investigation.csv`) defines **canonical clinical investigations** and their **LOINC atom mappings**.  
It is generated from the EMR’s `CanonicalInvestigation` and `CanonicalInvestigationAtom` models.

The CSV provides a standardized structure for integrating LOINC-based investigations into forms, analytics, and interoperability pipelines.

---

## Files

* **`canonical_investigation.csv`**  
  The dataset containing canonical investigations and their LOINC atoms.
* **`schema.yml`**  
  Validation schema describing constraints and accepted values for each column.
* **`data_dictionary.md`**  
  Detailed explanation of each column in the CSV.

---

## Structure

Each row in `canonical_investigation.csv` represents a **LOINC atom** within a **canonical investigation**.  
A canonical investigation may have multiple atoms (e.g. *Six Minute Walk Test* contains distance, pre-test HR, oxygen saturation, etc.).

**Key relationships:**

* `CanonicalInvestigation` → Parent investigation (e.g. “Six Minute Walk Test”).  
* `CanonicalInvestigationAtom` → Component test/measurement (e.g. HR, O₂ saturation).  

---

## Columns

| Column                              | Description                                                                  |
| ----------------------------------- | ---------------------------------------------------------------------------- |
| **LoincCode**                       | LOINC code of the atom                                                       |
| **AtomName**                        | Descriptive name of the atom                                                 |
| **CanonicalInvestigationLoincCode** | LOINC code of the canonical investigation                                    |
| **CanonicalInvestigationName**      | Name of the canonical investigation                                          |
| **Category**                        | Type of investigation: `lab`, `radiology`, `other`                           |
| **Unit**                            | Unit of measurement (if applicable)                                          |
| **Type**                            | Data type for form validation (numeric, ordinal, text, long\_text, document) |
| **Required**                        | Whether the atom is mandatory (blank by default)                             |

For more details, see [data_dictionary.md](./data_dictionary.md).  

---

## Generation

This CSV is curated by the CRH Team.  

---

## Versioning

This dataset is aligned with **LOINC Release 2.80**.  
Future updates will follow subsequent LOINC releases.  

---

## Validation

The dataset should be validated against the included schema:

```yaml
# schema.yml excerpt
- name: Category
  tests:
    - accepted_values:
        values: ["lab", "radiology", "other"]
- name: Type
  tests:
    - accepted_values:
        values: ["numeric", "ordinal", "text", "long_text", "document"]
```

This ensures consistency across environments and prevents malformed values from entering downstream systems.

---

## Usage

* **Clinical forms** → ensures the correct data type (numeric, text, ordinal, etc.) is applied to each investigation.
* **Analytics & research** → enables grouping and standardization of investigations across datasets.
* **Interoperability** → provides mappings to LOINC codes for exchange between systems and research hubs.

---

## Example

```csv
"LoincCode","AtomName","CanonicalInvestigationLoincCode","CanonicalInvestigationName","Category","Unit","Type","Required"
"64098-7","Six minute walk distance","64098-7","Six Minute Walk Test","other","m/(6.min)","numeric",""
"8889-8","Heart rate by Pulse oximetry - Pre-test","64098-7","Six Minute Walk Test","other","b/m","numeric",""
"59408-5","Oxygen saturation in Arterial blood by Pulse oximetry - Pre-test","64098-7","Six Minute Walk Test","other","%","numeric",""
```


## Notes

* `Required` is left blank; requirement logic should be enforced at the application/form level.
* `Unit` may be empty if no LOINC-recommended unit exists.
* `Type` is derived from the **LOINC SCALE\_TYP** field.
