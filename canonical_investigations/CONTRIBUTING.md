# Contributing Guidelines

Thank you for considering a contribution to the **Canonical Investigation Dataset**.  
This dataset is maintained by the **Clinical Records Hub (CRH) Team** and is aligned with LOINC Release 2.80.  

Contributions are welcome in the form of:
- Fixing incorrect LOINC mappings  
- Adding missing canonical investigations or atoms  
- Improving documentation, schema, or metadata  

---

## How to Contribute

1. **Fork the repository** and create a new branch:  
   ```bash
   git checkout -b fix/loinc-mapping
   ```

2. **Make your changes**:

   * Add or update rows in `canonical_investigation.csv`
   * Update the [`data_dictionary.md`](./data_dictionary.md) if introducing new columns
   * Update [`schema.yml`](./schema.yml) if adding new constraints

3. **Validate your changes** against the schema:

   * Ensure values for `Category` are only: `lab`, `radiology`, `other`
   * Ensure values for `Type` are only: `numeric`, `ordinal`, `text`, `long_text`, `document`
   * Run any validation scripts provided (if available)

4. **Commit your changes** with a clear message:

   ```bash
   git commit -m "fix: corrected unit for Six Minute Walk distance"
   ```

5. **Open a Pull Request (PR)**:

   * Clearly describe what was changed and why
   * Reference related LOINC documentation if relevant
   * Indicate if the update aligns with a newer LOINC release

---

## Data Quality Standards

* Each `LoincCode` must exist in the official **LOINC release**.
* `CanonicalInvestigationLoincCode` must be consistent across all atoms of a canonical investigation.
* `Unit` should use UCUM units where applicable.
* `Required` should be left blank unless there is a clinical consensus.

---

## Versioning

* The dataset is currently aligned with **LOINC 2.80**.
* Contributions introducing mappings from newer releases should include:

  * A clear note in the PR description
  * Updates to the **Versioning** section in [`README.md`](./README.md)

---

## Good Practices

* Keep commits small and focused.
* Use descriptive `AtomName` values (avoid abbreviations unless LOINC specifies them).
* Always cross-check against the **LOINC Table Core** before proposing new codes.

---

## Communication

If you’re unsure about a contribution:

* Open a **Discussion** before making a PR
* Or file an **Issue** describing the problem

The CRH Team will review contributions and merge those that meet the data quality and consistency standards.

