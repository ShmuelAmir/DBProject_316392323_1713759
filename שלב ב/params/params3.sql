SELECT MedicationID, Name, Description, QuantityInStock
FROM Medication
WHERE QuantityInStock = '&<name="Quantity In Stock"
                           list="10, 20, 30, 40">';
