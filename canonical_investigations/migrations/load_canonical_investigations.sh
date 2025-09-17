#!/usr/bin/env bash
set -euo pipefail

DB_NAME="your_db"
DB_USER="your_user"
DB_HOST="localhost"
DB_PORT="5432"
CSV_FILE="canonical_investigation.csv"

# 1. Run SQL schema from external file
psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -f sql_query.sql

# 2. Load distinct Canonical Investigations
echo "Loading canonical investigations..."
cut -d',' -f3,4,5 "$CSV_FILE" | tail -n +2 | sort -u | while IFS=',' read -r loinc name category; do
  psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" \
    -c "INSERT INTO canonical_investigations (loinc_code, name, category)
        VALUES ('$loinc', '$name', '$category')
        ON CONFLICT (loinc_code) DO NOTHING;"
done

# 3. Load Atoms
echo "Loading atoms..."
tail -n +2 "$CSV_FILE" | while IFS=',' read -r loinc atom_name inv_loinc inv_name category unit type required; do
  inv_id=$(psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" -t -c \
    "SELECT id FROM canonical_investigations WHERE loinc_code = '$inv_loinc';" | xargs)

  req=false
  if [ "$required" = "TRUE" ] || [ "$required" = "true" ]; then
    req=true
  fi

  psql -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER" -d "$DB_NAME" \
    -c "INSERT INTO canonical_investigation_atoms (loinc_code, name, unit, type, required, canonical_investigation_id)
        VALUES ('$loinc', '$atom_name', '$unit', '$type', $req, $inv_id)
        ON CONFLICT (loinc_code) DO NOTHING;"
done

echo "✅ Load complete!"
