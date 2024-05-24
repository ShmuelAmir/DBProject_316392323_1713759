import random

from treatment_descriptions import treatment_descriptions
from medication_descriptions import medication_descriptions
from medication_names import medication_names

ROWS = 999
# ROWS = 20000
FK = 500


def generate_random_date(from_year, to_year):
    date = random.randint(1, 28)
    month = random.randint(1, 12)
    year = random.randint(from_year, to_year)

    return f"{date:02d}-{month:02d}-{year:02d}"


def generate_medication_insert_queries():
    queries = []
    for i in range(1, ROWS + 1):
        medication_name = random.choice(medication_names)
        description = random.choice(medication_descriptions)
        expiration_date = generate_random_date(2005, 2026)
        quantity_in_stock = random.randint(5, 48)

        query = f"INSERT INTO Medication (MedicationID, Name, Description, ExpirationDate, QuantityInStock) VALUES ({i}, '{medication_name}', '{description}', TO_DATE('{expiration_date}', 'DD-MM-YYYY'), {quantity_in_stock});"
        queries.append(query)

    return queries


def generate_treatment_insert_queries():
    queries = []
    for i in range(1, ROWS + 1):
        fk_patient = random.randint(1, FK)
        fk_doctor = random.randint(1, FK)
        fk_medication = random.randint(1, ROWS)

        description = random.choice(treatment_descriptions)
        treatment_date = generate_random_date(2000, 2023)

        query = f"INSERT INTO Treatment (TreatmentID, Description, PatientID, DoctorID, TreatmentDate, MedicationID) VALUES ({i},'{description}',{fk_patient},{fk_doctor},TO_DATE('{treatment_date}', 'DD-MM-YYYY'),{fk_medication});"
        queries.append(query)

    return queries


# Generate queries for Medication table
# medication_queries = generate_medication_insert_queries()
# with open("medication_inserts.sql", "w") as f:
#     for query in medication_queries:
#         f.write(query + "\n")

# Generate queries for Treatment table
treatment_queries = generate_treatment_insert_queries()
with open("treatment_inserts.sql", "w") as f:
    for query in treatment_queries:
        f.write(query + "\n")

print("Insert queries generated successfully.")
