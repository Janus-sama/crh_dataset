# Reference Standards Dataset

This dataset (`reference_standards.csv`) defines **reference intervals** for clinical laboratory analytes, mapped to their **LOINC codes**.

It standardizes age, sex, specimen type, collection details, and method-specific variations so that laboratory values can be accurately interpreted in clinical systems.

---

## Files

* **`reference_standards.csv`**
  The dataset containing analytes, reference intervals, and clinical applicability.

* **`schema.yml`**
  Validation schema describing constraints and accepted values for each column.

* **`data_dictionary.md`**
  Detailed explanation of each column in the CSV.

---

## Structure

Each row in `reference_standards.csv` represents a **reference interval definition** for a given analyte under specific conditions (sex, age, specimen, collection type, method).

**Key relationships:**

* `LoincCode` → links to the analyte (lab test) defined by LOINC.
* `Specimen`, `CollectionType`, and `Method` → together define the laboratory context in which the interval is valid.
* `LowerLimit` and `UpperLimit` → establish the clinical reference boundaries.

---

## Columns

| Column             | Description                                                       |
| ------------------ | ----------------------------------------------------------------- |
| **LoincCode**      | LOINC code of the analyte                                         |
| **LowerLimit**     | Lower bound of the reference interval                             |
| **UpperLimit**     | Upper bound of the reference interval                             |
| **AgeMin**         | Minimum patient age (years)                                       |
| **AgeMax**         | Maximum patient age (years)                                       |
| **Sex**            | Biological sex: `M`, `F`, or `Any`                                |
| **Criteria**       | Special conditions (e.g., pregnancy, menstrual phase)             |
| **Specimen**       | Specimen type (serum, plasma, urine, CSF, etc.)                   |
| **CollectionType** | Container/handling type (e.g., EDTA plasma, lithium heparin tube) |
| **Method**         | Method of measurement (if relevant)                               |
| **Unit**           | Measurement unit (preferably SI)                                  |
| **Note**           | Free-text notes for clarifications                                |
| **Source**         | Source of the interval (guideline, publication, laboratory, etc.) |

For detailed descriptions, see [data\_dictionary.md](./data_dictionary.md).

---

## Validation

The dataset should be validated against the included schema:

```yaml
# schema.yml excerpt
- name: Sex
  tests:
    - accepted_values:
        values: ["M", "F", "Any"]
```

This ensures that only clinically valid values are used.

---

## 🔍 Example

```csv
"LoincCode","LowerLimit","UpperLimit","AgeMin","AgeMax","Sex","Criteria","Specimen","CollectionType","Method","Unit","Note","Source"
"2823-3","3.5","5.1","18","120","Any","","Plasma","Lithium heparin","Ion selective electrode","mmol/L","","LabCorp 2023"
"2823-3","3.6","5.2","18","120","Any","","Serum","Plain tube (clot)","Ion selective electrode","mmol/L","","LabCorp 2023"
```

---

## Notes

* `Sex` is limited to **M, F, Any** — “Other” is not clinically relevant.
* `CollectionType` can affect analyte values (e.g., EDTA lowers calcium, raises potassium).
* Reference intervals should follow **SI units** where possible.
* When multiple conditions apply (e.g., sex + reproductive phase), use the `Criteria` column.

---

## Generation

This dataset is curated and validated by the **CRH Team** to support safe interpretation of laboratory data in clinical and research systems.

---