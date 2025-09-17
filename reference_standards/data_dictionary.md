# Reference Intervals Data Dictionary

This document describes the columns used in the `reference_standards.csv` dataset.

---

## Columns

| Column             | Type             | Description                                                                                         | Example                                 |
| ------------------ | ---------------- | --------------------------------------------------------------------------------------------------- | --------------------------------------- |
| **LoincCode**      | string           | LOINC code identifying the analyte.                                                                 | `2823-3`                                |
| **LowerLimit**     | decimal          | Lower reference range limit (nullable if only upper limit is defined).                              | `3.5`                                   |
| **UpperLimit**     | decimal          | Upper reference range limit (nullable if only lower limit is defined).                              | `5.1`                                   |
| **AgeMin**         | integer          | Minimum patient age (in years) for which the range applies.                                         | `18`                                    |
| **AgeMax**         | integer          | Maximum patient age (in years). Use a large value (e.g., `120`) if no strict maximum is defined.    | `120`                                   |
| **Sex**            | string (M/F/Any) | Biological sex for which the interval applies. `M` = male, `F` = female, `Any` = applicable to all. | `M`                                     |
| **Criteria**       | string           | Special criteria if applicable (e.g., menstrual phase, pregnancy status, fasting).                  | `Follicular phase`                      |
| **Specimen**       | string           | Specimen type.                                                                                      | `Plasma`, `Urine`                       |
| **CollectionType** | string           | Specific collection/handling type (e.g., anticoagulant tube, container).                            | `Lithium heparin`, `EDTA plasma`        |
| **Method**         | string           | Method of measurement (if relevant).                                                                | `Ion selective electrode`               |
| **Unit**           | string           | Measurement unit (SI units preferred).                                                              | `mmol/L`                                |
| **Note**           | text             | Free-text notes for clarifications.                                                                 | `Values decrease if delayed processing` |
| **Source**         | string           | Source/reference for the interval (lab name, guideline, publication).                               | `LabCorp 2023`                          |

---

## Notes

* `Criteria` is optional, only needed where reference ranges change based on physiology (e.g., pregnancy, reproductive phases).
* `CollectionType` matters when specimen handling alters results (e.g., EDTA tubes artificially lower calcium).
* Reference ranges should be expressed in SI units whenever possible for standardization.

---