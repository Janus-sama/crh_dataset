-- Parent investigations
CREATE TABLE canonical_investigations (
    id SERIAL PRIMARY KEY,
    loinc_code VARCHAR(20) NOT NULL UNIQUE,
    -- canonical LOINC (e.g. Six Minute Walk Test)
    name VARCHAR(255) NOT NULL,
    -- canonical investigation name
    category VARCHAR(50) NOT NULL CHECK (category IN ('lab', 'radiology', 'other'))
);
-- Atoms (components of investigations)
CREATE TABLE canonical_investigation_atoms (
    id SERIAL PRIMARY KEY,
    loinc_code VARCHAR(20) NOT NULL UNIQUE,
    -- LOINC for the atom (e.g. HR, O2 saturation)
    name VARCHAR(255) NOT NULL,
    -- descriptive atom name
    unit VARCHAR(50),
    -- UCUM unit if applicable
    type VARCHAR(20) NOT NULL CHECK (
        type IN (
            'numeric',
            'ordinal',
            'text',
            'long_text',
            'document'
        )
    ),
    required BOOLEAN DEFAULT FALSE,
    canonical_investigation_id INT NOT NULL REFERENCES canonical_investigations(id) ON DELETE CASCADE
);