# 📚 Índice de Archivos SQL - Base de Datos Comuctiva

## 🎯 Guía Rápida de Uso

### Instalación Inicial (Base de datos nueva)
```bash
# Opción 1: Script todo-en-uno (RECOMENDADO)
mysql -u root < INSTALACION_COMPLETA.sql

# Opción 2: Paso a paso
mysql -u root < DDL_ACTUALIZADO.sql
mysql -u root < DML_DATOS_INICIALES.sql
```

### Mantenimiento (Base de datos existente)
```bash
mysql -u root < MANTENIMIENTO.sql
```

---

## 📁 Descripción de Archivos

### 1. INSTALACION_COMPLETA.sql ⭐ RECOMENDADO
**Propósito:** Script maestro que ejecuta todo el proceso de instalación en un solo comando

**Contenido:**
- ✅ Elimina y recrea la base de datos
- ✅ Crea todas las tablas (DDL)
- ✅ Establece relaciones (Foreign Keys)
- ✅ Inserta datos iniciales (DML)
- ✅ Verifica instalación correcta

**Cuándo usar:**
- Primera instalación
- Resetear base de datos completamente
- Después de cambios estructurales importantes

**Ejecución:**
```bash
cd C:\xampp\mysql\bin
.\mysql.exe -u root < C:\xampp\htdocs\comuctivs\Base_De_Datos_Comuntiva\INSTALACION_COMPLETA.sql
```

**Resultado esperado:**
```
✅ PASO 1 COMPLETADO: Base de datos creada
✅ PASO 2 COMPLETADO: Tablas creadas
✅ PASO 3 COMPLETADO: Relaciones (Foreign Keys) creadas
✅ PASO 4 COMPLETADO: Datos iniciales insertados
✅ INSTALACIÓN COMPLETADA EXITOSAMENTE
```

---

### 2. DDL_ACTUALIZADO.sql
**Propósito:** Definición de estructura de base de datos (Data Definition Language)

**Contenido:**
- Creación de todas las tablas
- Definición de tipos de datos
- Claves primarias y foráneas
- **Constraint UNIQUE (ID_TipDocu, NumDoc)** ⚠️ IMPORTANTE

**Cambios importantes:**
```sql
-- Campo NumDoc ahora es NUMERIC (antes VARCHAR)
NumDoc NUMERIC(20) NOT NULL

-- Constraint para prevenir duplicados
CONSTRAINT UK_Usuario_TipDoc_NumDoc UNIQUE (ID_TipDocu, NumDoc)
```

**Cuándo usar:**
- Solo necesitas crear la estructura sin datos
- Desarrollo/testing de modelo de datos

**Ejecución:**
```bash
mysql -u root < DDL_ACTUALIZADO.sql
```

---

### 3. DML_DATOS_INICIALES.sql
**Propósito:** Datos base necesarios para el funcionamiento del sistema

**Contenido:**
| Categoría | Cantidad | Ejemplos |
|-----------|----------|----------|
| Tipos de Documento | 4 | CC, Pasaporte, TI, CE |
| Roles | 2 | Administrador, Cliente |
| Usuarios | 3 | Admin, Ana, Pedro |
| Unidades de Medida | 6 | Kg, g, Lb, Unidad, L, mL |
| Tipos de Vías | 6 | Calle, Carrera, Avenida |
| Tipos de Pago | 5 | Efectivo, Débito, Crédito |
| Estados | 5 | Pendiente, En Proceso, Entregado |
| Departamentos | 5 | Antioquia, Bogotá, Valle |
| Transportadoras | 2 | Servientrega, Coordinadora |

**Usuarios de Prueba:**
```
Admin     - 22222222 - admin123 - Rol: Administrador
Ana       - 55555555 - 1234     - Rol: Cliente
Pedro     - 66666666 - 1234     - Rol: Cliente
```

**⚠️ IMPORTANTE:** Las contraseñas están en BCrypt pero el **DataLoader de Spring Boot las actualiza automáticamente** al iniciar el servidor.

**Cuándo usar:**
- Después de ejecutar DDL_ACTUALIZADO.sql
- Resetear datos a valores iniciales (perderás datos existentes)

**Ejecución:**
```bash
mysql -u root < DML_DATOS_INICIALES.sql
```

---

### 4. MANTENIMIENTO.sql
**Propósito:** Diagnóstico, limpieza y verificación de integridad

**Funcionalidades:**

#### 4.1 Detectar Usuarios Duplicados
```sql
-- Sección 1: Ver duplicados
SELECT ID_TipDocu, NumDoc, COUNT(*) as cantidad
FROM usuario
GROUP BY ID_TipDocu, NumDoc
HAVING COUNT(*) > 1;
```

#### 4.2 Listar Usuarios
```sql
-- Sección 2: Ver todos los usuarios
SELECT ID_Usuario, NomUsu, NumDoc, correo
FROM usuario
ORDER BY NumDoc;
```

#### 4.3 Limpiar Duplicados
```sql
-- Sección 3: Eliminar duplicados (mantiene el de menor ID)
-- ⚠️ ADVERTENCIA: Hace DELETE, ejecutar con precaución
```

#### 4.4 Verificar Constraint UNIQUE
```sql
-- Sección 4: Confirmar que existe UK_Usuario_TipDoc_NumDoc
```

#### 4.5 Actualizar Contraseña Admin
```sql
-- Sección 6: Resetear password del Admin
-- (Script comentado, descomentar si necesitas usarlo)
```

#### 4.6 Verificar Usuarios sin Rol
```sql
-- Sección 7: Encontrar usuarios que no tienen rol asignado
```

#### 4.7 Estadísticas
```sql
-- Sección 8: Conteo de usuarios, productos, pedidos, compras
```

**Cuándo usar:**
- Después de migración de datos
- Detectar inconsistencias
- Mantenimiento periódico
- Diagnóstico de problemas

**Ejecución:**
```bash
mysql -u root < MANTENIMIENTO.sql
```

**⚠️ ADVERTENCIA:** Hacer backup antes de ejecutar sección 3 (limpieza de duplicados)

---

### 5. README.md
**Propósito:** Documentación completa del proyecto de base de datos

**Contenido:**
- Descripción detallada de cada archivo SQL
- Historial de cambios y problemas resueltos
- Estructura de tablas y relaciones
- Integración con Spring Boot
- Comandos útiles de MySQL
- Guía de troubleshooting

**Cuándo consultar:**
- Necesitas entender la arquitectura de BD
- Buscar soluciones a problemas comunes
- Referencias de comandos SQL
- Documentación de APIs relacionadas

---

## 🔄 Flujos de Trabajo Comunes

### Escenario 1: Primera Instalación
```bash
# 1. Ejecutar instalación completa
mysql -u root < INSTALACION_COMPLETA.sql

# 2. Iniciar Spring Boot
cd C:\xampp\htdocs\comuctivs\Comuctiva_String_Boot
.\mvnw.cmd spring-boot:run

# 3. Verificar en logs:
# "✅ Contraseña del Admin actualizada correctamente con BCrypt"

# 4. Probar login en Postman
# POST http://localhost:8080/api/usuario/login
# Body: {"tipDocId": 1, "numDoc": 22222222, "password": "admin123"}
```

---

### Escenario 2: Resetear Base de Datos (Conservar Estructura)
```bash
# 1. Eliminar solo datos
mysql -u root -e "USE Comuctiva; SET FOREIGN_KEY_CHECKS=0; 
TRUNCATE TABLE rol_usuario; TRUNCATE TABLE usuario; 
TRUNCATE TABLE producto; SET FOREIGN_KEY_CHECKS=1;"

# 2. Reinsertar datos iniciales
mysql -u root < DML_DATOS_INICIALES.sql

# 3. Reiniciar Spring Boot
```

---

### Escenario 3: Problema de Usuarios Duplicados
```bash
# 1. Detectar duplicados
mysql -u root < MANTENIMIENTO.sql > diagnostico.txt

# 2. Revisar diagnostico.txt
# Si hay duplicados, ejecutar limpieza:

# 3. Hacer backup
mysqldump -u root Comuctiva > backup_comuctiva.sql

# 4. Ejecutar limpieza (sección 3 de MANTENIMIENTO.sql)
mysql -u root Comuctiva

# En MySQL:
mysql> source C:\xampp\htdocs\comuctivs\Base_De_Datos_Comuntiva\MANTENIMIENTO.sql

# 5. Verificar que se eliminaron
```

---

### Escenario 4: Actualizar Solo Contraseña del Admin
```bash
# Opción 1: Dejar que Spring Boot lo haga (RECOMENDADO)
# Solo reinicia el servidor, DataLoader actualiza automáticamente

# Opción 2: Manualmente en MySQL
mysql -u root -e "USE Comuctiva; 
UPDATE usuario 
SET password = '\$2a\$10\$DowJonesVSTRW0FVz15d9uKLCqH3JsZ.PWypayRII0f.YqK5E9WFG' 
WHERE NumDoc = 22222222 AND ID_TipDocu = 1;"
```

---

### Escenario 5: Agregar Nuevos Datos Base (Ej: Productos)
```sql
-- Crear archivo: PRODUCTOS_INICIALES.sql
USE Comuctiva;

INSERT INTO Producto (NomProd, Valor, Cant, ID_Medida, Descrip, Imagen) VALUES
('Tomate', 3500, 100, 1, 'Tomate chonto fresco', 'tomate.jpg'),
('Lechuga', 2500, 50, 4, 'Lechuga verde fresca', 'lechuga.jpg'),
('Zanahoria', 2000, 80, 1, 'Zanahoria orgánica', 'zanahoria.jpg');

SELECT 'Productos agregados correctamente' as Resultado;
```

```bash
mysql -u root < PRODUCTOS_INICIALES.sql
```

---

## ⚙️ Configuración de application.properties

Para que Spring Boot se conecte correctamente:

```properties
# Base de datos
spring.datasource.url=jdbc:mysql://localhost:3306/comuctiva
spring.datasource.username=root
spring.datasource.password=

# JPA/Hibernate
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=false
spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQLDialect

# No recrear estructura en cada inicio
spring.jpa.hibernate.ddl-auto=update
```

**Valores de `ddl-auto`:**
- `create`: Elimina y recrea tablas cada vez (⚠️ CUIDADO)
- `create-drop`: Igual que create, elimina al cerrar
- `update`: Actualiza estructura sin eliminar datos (RECOMENDADO)
- `validate`: Solo valida, no modifica nada
- `none`: No hace nada

---

## 🧪 Testing y Verificación

### Verificar Instalación Correcta
```sql
-- 1. Verificar constraint UNIQUE
SHOW CREATE TABLE usuario;

-- 2. Contar usuarios
SELECT COUNT(*) as total_usuarios FROM usuario;
-- Debe retornar: 3

-- 3. Ver roles asignados
SELECT 
    u.NomUsu,
    r.Nom_Rol
FROM usuario u
JOIN rol_usuario ru ON u.ID_Usuario = ru.ID_Usuario
JOIN rol r ON ru.ID_Rol = r.Id_Rol;
-- Debe mostrar: Admin (Administrador), Ana (Cliente), Pedro (Cliente)

-- 4. Verificar contraseñas BCrypt
SELECT NomUsu, LEFT(password, 10) as hash_inicio FROM usuario;
-- Todas deben empezar con: $2a$10$
```

---

## 🐛 Troubleshooting

### Error: "Table 'comuctiva.usuario' doesn't exist"
**Solución:**
```bash
mysql -u root < INSTALACION_COMPLETA.sql
```

### Error: "Duplicate entry '1-22222222' for key 'UK_Usuario_TipDoc_NumDoc'"
**Causa:** Intentando insertar usuario que ya existe

**Solución:**
```sql
-- Ver usuarios actuales
SELECT * FROM usuario WHERE NumDoc = 22222222;

-- Si necesitas reemplazarlo, elimina el anterior
DELETE FROM rol_usuario WHERE ID_Usuario = (SELECT ID_Usuario FROM usuario WHERE NumDoc = 22222222);
DELETE FROM usuario WHERE NumDoc = 22222222;
```

### Error: "NonUniqueResultException"
**Causa:** Hay usuarios duplicados en BD

**Solución:**
```bash
mysql -u root < MANTENIMIENTO.sql
# Ejecutar sección 3 (limpieza de duplicados)
```

### Login retorna "Credenciales inválidas"
**Solución:**
```bash
# Reiniciar servidor Spring Boot
# DataLoader actualizará automáticamente la contraseña del Admin
```

---

## 📊 Estadísticas de Archivos

| Archivo | Tamaño aprox. | Líneas | Propósito Principal |
|---------|---------------|--------|---------------------|
| INSTALACION_COMPLETA.sql | 15 KB | 400 | Instalación todo-en-uno |
| DDL_ACTUALIZADO.sql | 8 KB | 250 | Estructura de tablas |
| DML_DATOS_INICIALES.sql | 5 KB | 150 | Datos iniciales |
| MANTENIMIENTO.sql | 6 KB | 200 | Diagnóstico y limpieza |
| README.md | 20 KB | 500 | Documentación completa |
| INDICE.md | 10 KB | 350 | Esta guía |

---

## 📞 Referencias Cruzadas

- **Documentación API:** `POSTMAN_TESTS.md`
- **Guía de Login:** `LOGIN_QUICK_START.md`
- **Código DataLoader:** `src/main/java/com/comuctiva/comuctiva/config/DataLoader.java`
- **Configuración BD:** `src/main/resources/application.properties`

---

## 🔐 Seguridad

### Contraseñas BCrypt
- **Algoritmo:** BCrypt con factor 10
- **Formato:** `$2a$10$...` (60 caracteres)
- **Nunca** guardar contraseñas en texto plano
- DataLoader regenera hashes en cada inicio del servidor

### Constraint de Unicidad
```sql
CONSTRAINT UK_Usuario_TipDoc_NumDoc UNIQUE (ID_TipDocu, NumDoc)
```
Previene:
- ✅ Usuarios duplicados
- ✅ NonUniqueResultException
- ✅ Inconsistencias de login

---

## 📅 Historial de Versiones

### Versión 2.0 (Octubre 2025)
- ✅ Agregado constraint UNIQUE (ID_TipDocu, NumDoc)
- ✅ Campo NumDoc cambiado a NUMERIC
- ✅ Eliminada tabla Tienda
- ✅ DataLoader actualiza password automáticamente
- ✅ Scripts de mantenimiento y limpieza

### Versión 1.0 (Anterior)
- Estructura inicial
- Datos base

---

**Última Actualización:** Octubre 28, 2025  
**Versión:** 2.0  
**Compatibilidad:** MySQL 5.5.5+, Spring Boot 3.5.6
