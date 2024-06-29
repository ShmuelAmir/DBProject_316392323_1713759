SELECT MedicationID, Name, Description, QuantityInStock
FROM Medication
WHERE QuantityInStock = '&<name="Quantity In Stock"
                           list="SELECT DISTINCT QuantityInStock FROM MEDICATION ORDER BY QuantityInStock">';
