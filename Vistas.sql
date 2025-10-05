USE `comuctiva`;
CREATE  OR REPLACE VIEW `Produc_Baratos` AS
SELECT NomProd, Valor FROM Producto
WHERE Valor < 10000 ORDER BY Valor ASC;

Select * from Produc_Baratos;