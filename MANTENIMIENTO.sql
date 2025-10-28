-- =====================================================
-- SCRIPT DE MANTENIMIENTO DE BASE DE DATOS COMUCTIVA
-- =====================================================
-- Este script contiene procedimientos de mantenimiento
-- para la base de datos, incluyendo limpieza de duplicados,
-- verificación de integridad y optimizaciones
-- =====================================================

USE Comuctiva;

-- =====================================================
-- 1. DETECTAR USUARIOS DUPLICADOS
-- =====================================================
SELECT 
    'USUARIOS DUPLICADOS DETECTADOS' as Operacion,
    u.ID_TipDocu,
    u.NumDoc,
    COUNT(*) as cantidad,
    GROUP_CONCAT(u.ID_Usuario ORDER BY u.ID_Usuario) as ids_usuarios
FROM usuario u
GROUP BY u.ID_TipDocu, u.NumDoc
HAVING COUNT(*) > 1;

-- =====================================================
-- 2. VER TODOS LOS USUARIOS (ORDENADOS POR DOCUMENTO)
-- =====================================================
SELECT 
    'LISTADO COMPLETO DE USUARIOS' as Operacion,
    ID_Usuario,
    NomUsu,
    apell1,
    NumDoc,
    ID_TipDocu,
    correo,
    LEFT(Password, 30) as password_inicio
FROM usuario
ORDER BY NumDoc, ID_Usuario;

-- =====================================================
-- 3. LIMPIAR DUPLICADOS (SI EXISTEN)
-- =====================================================
-- ADVERTENCIA: Este proceso eliminará usuarios duplicados
-- manteniendo solo el registro con el ID más bajo
-- Ejecutar solo si se detectaron duplicados en el paso 1

-- 3.1 Deshabilitar verificación de claves foráneas temporalmente
SET FOREIGN_KEY_CHECKS = 0;

-- 3.2 Eliminar roles de usuarios duplicados
DELETE FROM rol_usuario 
WHERE ID_Usuario IN (
    SELECT ID_Usuario FROM (
        SELECT u2.ID_Usuario
        FROM usuario u1
        INNER JOIN usuario u2 
            ON u1.ID_TipDocu = u2.ID_TipDocu 
            AND u1.NumDoc = u2.NumDoc 
            AND u1.ID_Usuario < u2.ID_Usuario
    ) AS duplicados
);

-- 3.3 Eliminar direcciones de usuarios duplicados
DELETE FROM direcciones 
WHERE ID_Usuario IN (
    SELECT ID_Usuario FROM (
        SELECT u2.ID_Usuario
        FROM usuario u1
        INNER JOIN usuario u2 
            ON u1.ID_TipDocu = u2.ID_TipDocu 
            AND u1.NumDoc = u2.NumDoc 
            AND u1.ID_Usuario < u2.ID_Usuario
    ) AS duplicados
);

-- 3.4 Eliminar pedidos de usuarios duplicados
DELETE FROM pedidos 
WHERE ID_Usuario IN (
    SELECT ID_Usuario FROM (
        SELECT u2.ID_Usuario
        FROM usuario u1
        INNER JOIN usuario u2 
            ON u1.ID_TipDocu = u2.ID_TipDocu 
            AND u1.NumDoc = u2.NumDoc 
            AND u1.ID_Usuario < u2.ID_Usuario
    ) AS duplicados
);

-- 3.5 Eliminar usuarios duplicados (manteniendo el de menor ID)
DELETE FROM usuario 
WHERE ID_Usuario IN (
    SELECT ID_Usuario FROM (
        SELECT u2.ID_Usuario
        FROM usuario u1
        INNER JOIN usuario u2 
            ON u1.ID_TipDocu = u2.ID_TipDocu 
            AND u1.NumDoc = u2.NumDoc 
            AND u1.ID_Usuario < u2.ID_Usuario
    ) AS duplicados
);

-- 3.6 Reactivar verificación de claves foráneas
SET FOREIGN_KEY_CHECKS = 1;

SELECT 'Duplicados eliminados exitosamente' as Resultado;

-- =====================================================
-- 4. AGREGAR/VERIFICAR CONSTRAINT UNIQUE
-- =====================================================
-- Este constraint previene la creación de usuarios duplicados

-- Verificar si el constraint ya existe
SELECT 
    CONSTRAINT_NAME,
    CONSTRAINT_TYPE
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'Comuctiva' 
    AND TABLE_NAME = 'usuario'
    AND CONSTRAINT_NAME = 'UK_Usuario_TipDoc_NumDoc';

-- Si no existe, agregarlo (ejecutar solo si el resultado anterior está vacío)
-- ALTER TABLE usuario 
-- ADD CONSTRAINT UK_Usuario_TipDoc_NumDoc 
-- UNIQUE (ID_TipDocu, NumDoc);

-- =====================================================
-- 5. VERIFICACIÓN POST-LIMPIEZA
-- =====================================================

-- Verificar que ya no hay duplicados
SELECT 
    'VERIFICACIÓN FINAL - NO DEBE RETORNAR REGISTROS' as Operacion,
    u.ID_TipDocu,
    u.NumDoc,
    COUNT(*) as cantidad
FROM usuario u
GROUP BY u.ID_TipDocu, u.NumDoc
HAVING COUNT(*) > 1;

-- =====================================================
-- 6. ACTUALIZAR CONTRASEÑA DEL ADMINISTRADOR
-- =====================================================
-- Solo ejecutar si necesitas resetear la contraseña del Admin
-- Hash BCrypt para 'admin123'

-- UPDATE usuario 
-- SET password = '$2a$10$DowJonesVSTRW0FVz15d9uKLCqH3JsZ.PWypayRII0f.YqK5E9WFG'
-- WHERE NumDoc = 22222222 AND ID_TipDocu = 1;

-- SELECT 'Contraseña del Admin actualizada correctamente' as Resultado;

-- =====================================================
-- 7. VERIFICAR INTEGRIDAD DE ROLES
-- =====================================================

-- Verificar usuarios sin rol asignado
SELECT 
    'USUARIOS SIN ROL ASIGNADO' as Operacion,
    u.ID_Usuario,
    u.NomUsu,
    u.correo
FROM usuario u
LEFT JOIN rol_usuario ru ON u.ID_Usuario = ru.ID_Usuario
WHERE ru.ID_Usuario IS NULL;

-- =====================================================
-- 8. ESTADÍSTICAS DE LA BASE DE DATOS
-- =====================================================

SELECT 'ESTADÍSTICAS GENERALES' as Operacion;

SELECT 
    'Total Usuarios' as Categoria,
    COUNT(*) as Cantidad
FROM usuario
UNION ALL
SELECT 
    'Total Productos' as Categoria,
    COUNT(*) as Cantidad
FROM producto
UNION ALL
SELECT 
    'Total Pedidos' as Categoria,
    COUNT(*) as Cantidad
FROM pedidos
UNION ALL
SELECT 
    'Total Compras' as Categoria,
    COUNT(*) as Cantidad
FROM compra;

-- =====================================================
-- NOTAS IMPORTANTES:
-- =====================================================
-- 1. Hacer backup antes de ejecutar operaciones DELETE
-- 2. El constraint UNIQUE previene duplicados futuros
-- 3. Las contraseñas están encriptadas con BCrypt
-- 4. El DataLoader de Spring Boot maneja la creación inicial
-- 5. Ejecutar este script periódicamente para mantenimiento
-- =====================================================
