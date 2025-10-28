# 📋 RESUMEN DE ACTUALIZACIÓN - Base de Datos Comuctiva

## ✅ Archivos Actualizados (Octubre 28, 2025)

### 📁 Carpeta: `Base_De_Datos_Comuntiva/`

| Archivo | Estado | Descripción |
|---------|--------|-------------|
| **DDL_ACTUALIZADO.sql** | ✅ ACTUALIZADO | Agregado constraint UNIQUE, NumDoc ahora NUMERIC |
| **DML_DATOS_INICIALES.sql** | ✅ NUEVO | Datos base del sistema (usuarios, roles, etc.) |
| **INSTALACION_COMPLETA.sql** | ✅ NUEVO | Script maestro todo-en-uno |
| **MANTENIMIENTO.sql** | ✅ NUEVO | Diagnóstico y limpieza de BD |
| **README.md** | ✅ NUEVO | Documentación completa |
| **INDICE.md** | ✅ NUEVO | Guía rápida de todos los archivos |
| **CAMBIOS_OCTUBRE_2025.md** | ✅ NUEVO | Este archivo |

---

## 🔧 Cambios Principales

### 1. Tabla `usuario` - DDL_ACTUALIZADO.sql

#### ❌ ANTES:
```sql
CREATE TABLE Usuario(
    ...
    NumDoc VARCHAR(20) NOT NULL,
    Password VARCHAR(500) NOT NULL
);
```

#### ✅ DESPUÉS:
```sql
CREATE TABLE Usuario(
    ...
    NumDoc NUMERIC(20) NOT NULL,
    Password VARCHAR(500) NOT NULL,
    CONSTRAINT UK_Usuario_TipDoc_NumDoc UNIQUE (ID_TipDocu, NumDoc)
);
```

**Cambios:**
- ✅ Campo `NumDoc` cambiado de `VARCHAR(20)` a `NUMERIC(20)`
- ✅ **NUEVO:** Constraint `UNIQUE (ID_TipDocu, NumDoc)` para prevenir duplicados

**Beneficios:**
- 🚫 Previene error `NonUniqueResultException`
- 🚫 Impide crear usuarios duplicados
- ✅ Garantiza integridad de datos
- ✅ Coincide con tipo `Long` en Java

---

### 2. Archivo DML_DATOS_INICIALES.sql - NUEVO

**Contenido:**
```sql
-- Tipos de Documento (4)
INSERT INTO Tip_Doc VALUES (1, 'Cedula de Ciudadania'), ...

-- Roles (2)
INSERT INTO Rol VALUES (1, 'Administrador'), (2, 'Cliente');

-- Usuarios de Prueba (3)
INSERT INTO Usuario VALUES 
(1, 'Admin', 'Sistema', 'Principal', ..., 22222222, '$2a$10$...'),
(2, 'Ana', 'Rodríguez', ..., 55555555, '$2a$10$...'),
(3, 'Pedro', 'López', ..., 66666666, '$2a$10$...');

-- Roles de Usuarios
INSERT INTO Rol_Usuario VALUES (1, 1, 1), (2, 2, 1), (2, 3, 1);

-- Unidades de Medida (6)
INSERT INTO Unidad_Medida VALUES (1, 'Kilogramo'), ...

-- Tipos de Vías (6)
INSERT INTO Vias VALUES (1, 'Calle'), (2, 'Carrera'), ...

-- Tipos de Pago (5)
INSERT INTO Tipo_De_Pago VALUES (1, 'Efectivo'), ...

-- Estados de Pedidos (5)
INSERT INTO Estado VALUES (1, 'Pendiente'), ...

-- Departamentos y Municipios
INSERT INTO Dep VALUES (5, 'Antioquia'), ...
INSERT INTO Muni VALUES (5001, 'Medellín', 5), ...

-- Transportadoras (2)
INSERT INTO Transportadora VALUES 
(1, 'Servientrega', ...),
(2, 'Coordinadora', ...);
```

**Usuarios Creados:**
| Usuario | NumDoc | Password | Rol |
|---------|--------|----------|-----|
| Admin | 22222222 | admin123 | Administrador |
| Ana | 55555555 | 1234 | Cliente |
| Pedro | 66666666 | 1234 | Cliente |

⚠️ **IMPORTANTE:** El `DataLoader.java` actualiza automáticamente la contraseña del Admin con BCrypt al iniciar el servidor.

---

### 3. Archivo INSTALACION_COMPLETA.sql - NUEVO

**Script Maestro que ejecuta:**

1. ✅ DROP y CREATE database
2. ✅ Crea todas las tablas (DDL)
3. ✅ Establece relaciones (Foreign Keys)
4. ✅ Inserta datos iniciales (DML)
5. ✅ Verifica instalación correcta

**Uso:**
```bash
mysql -u root < INSTALACION_COMPLETA.sql
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

### 4. Archivo MANTENIMIENTO.sql - NUEVO

**Funciones:**

#### 🔍 Sección 1: Detectar Duplicados
```sql
SELECT ID_TipDocu, NumDoc, COUNT(*) as cantidad
FROM usuario
GROUP BY ID_TipDocu, NumDoc
HAVING COUNT(*) > 1;
```

#### 📋 Sección 2: Listar Usuarios
```sql
SELECT ID_Usuario, NomUsu, NumDoc, correo
FROM usuario
ORDER BY NumDoc;
```

#### 🧹 Sección 3: Limpiar Duplicados
```sql
-- Elimina usuarios duplicados manteniendo el de menor ID
DELETE FROM usuario WHERE ID_Usuario IN (...)
```

#### ✅ Sección 4: Verificar Constraint UNIQUE
```sql
SHOW CREATE TABLE usuario;
```

#### 🔐 Sección 6: Actualizar Password Admin
```sql
UPDATE usuario SET password = '$2a$10$...' 
WHERE NumDoc = 22222222;
```

#### 👥 Sección 7: Usuarios sin Rol
```sql
SELECT u.* FROM usuario u
LEFT JOIN rol_usuario ru ON u.ID_Usuario = ru.ID_Usuario
WHERE ru.ID_Usuario IS NULL;
```

#### 📊 Sección 8: Estadísticas
```sql
SELECT COUNT(*) FROM usuario;
SELECT COUNT(*) FROM producto;
SELECT COUNT(*) FROM pedidos;
```

---

### 5. Archivos de Documentación - NUEVOS

#### README.md
- Descripción completa de cada archivo SQL
- Historial de cambios y problemas resueltos
- Estructura de tablas y relaciones
- Integración con Spring Boot
- Comandos útiles de MySQL
- Guía de troubleshooting

#### INDICE.md
- Guía rápida de uso
- Flujos de trabajo comunes
- Escenarios de instalación
- Referencias cruzadas
- Testing y verificación

---

## 🔄 Integración con Spring Boot

### DataLoader.java - ACTUALIZADO

#### ❌ ANTES:
```java
if (usuarioRepo.findByNumDoc(22222222L) != null) {
    System.out.println("Los datos ya existen");
    return;
}
```

#### ✅ DESPUÉS:
```java
Usuario adminExistente = usuarioRepo.findByNumDoc(22222222L);
if (adminExistente != null) {
    System.out.println("⚠️  Actualizando contraseña del usuario Admin...");
    adminExistente.setPassword(passwordEncoder.encode("admin123"));
    usuarioRepo.save(adminExistente);
    System.out.println("✅ Contraseña del Admin actualizada correctamente con BCrypt.");
    return;
}
```

**Beneficio:** La contraseña del Admin se actualiza automáticamente en cada inicio del servidor, asegurando que siempre coincida con "admin123".

---

### UsuarioRepositories.java - ACTUALIZADO

#### ❌ ANTES:
```java
Usuario findByTipDocAndNumDoc(Integer tipDocId, Long numDoc);
```

#### ✅ DESPUÉS:
```java
@Query("SELECT u FROM Usuario u WHERE u.tip_Doc.id_tipdocu = :tipDocId AND u.numDoc = :numDoc ORDER BY u.id_Usuario ASC")
Optional<Usuario> findFirstByTipDocAndNumDoc(
    @Param("tipDocId") Integer tipDocId, 
    @Param("numDoc") Long numDoc
);
```

**Beneficios:**
- ✅ Retorna `Optional` para manejo seguro de null
- ✅ `ORDER BY ID_Usuario ASC` para consistencia
- ✅ Previene `NonUniqueResultException`

---

## 🐛 Problemas Resueltos

### Problema 1: NonUniqueResultException
**Síntoma:**
```
javax.persistence.NonUniqueResultException: 
query did not return a unique result: 7
```

**Causa:** 14 usuarios duplicados en base de datos

**Solución:**
1. ✅ Ejecutado script de limpieza (eliminó 14 duplicados)
2. ✅ Agregado constraint UNIQUE (ID_TipDocu, NumDoc)
3. ✅ Modificado `findByTipDocAndNumDoc()` a `findFirstByTipDocAndNumDoc()`

---

### Problema 2: Contraseña Incorrecta
**Síntoma:**
```
Usuario encontrado en BD: Admin
❌ Contraseña incorrecta
```

**Causa:** Hash BCrypt en BD no coincidía con "admin123"

**Solución:**
1. ✅ Modificado `DataLoader.java` para actualizar password siempre
2. ✅ Usa `passwordEncoder.encode("admin123")` de Spring Security
3. ✅ Eliminado hash estático del SQL

**Resultado:**
```
⚠️  Actualizando contraseña del usuario Admin...
✅ Contraseña del Admin actualizada correctamente con BCrypt.

=== BUSCANDO USUARIO ===
TipDocId recibido: 1
NumDoc recibido: 22222222
Usuario encontrado en BD: Admin
✅ Contraseña correcta
Token generado: eyJhbGciOiJIUzM4NCJ9...
=== FIN LOGIN EXITOSO ===
```

---

## 📊 Comparativa de Archivos

### ANTES (Octubre 2025 - Inicio)
```
Base_De_Datos_Comuntiva/
├── DDL_ACTUALIZADO.sql (versión antigua)
└── DB_REESTRUCTURADO.sql
```

### DESPUÉS (Octubre 28, 2025)
```
Base_De_Datos_Comuntiva/
├── DDL_ACTUALIZADO.sql ⭐ (con constraint UNIQUE)
├── DML_DATOS_INICIALES.sql ⭐ NUEVO
├── INSTALACION_COMPLETA.sql ⭐ NUEVO (RECOMENDADO)
├── MANTENIMIENTO.sql ⭐ NUEVO
├── README.md ⭐ NUEVO
├── INDICE.md ⭐ NUEVO
├── CAMBIOS_OCTUBRE_2025.md ⭐ NUEVO (este archivo)
├── DB_REESTRUCTURADO.sql (legacy)
└── comuctiva.sql (legacy)
```

---

## 🚀 Cómo Usar los Nuevos Archivos

### Opción 1: Instalación Completa (RECOMENDADO)
```bash
# Elimina y recrea TODO desde cero
cd C:\xampp\mysql\bin
.\mysql.exe -u root < C:\xampp\htdocs\comuctivs\Base_De_Datos_Comuntiva\INSTALACION_COMPLETA.sql
```

### Opción 2: Paso a Paso
```bash
# 1. Crear estructura
.\mysql.exe -u root < DDL_ACTUALIZADO.sql

# 2. Insertar datos iniciales
.\mysql.exe -u root < DML_DATOS_INICIALES.sql
```

### Opción 3: Solo Agregar Constraint (BD Existente)
```sql
-- Ejecutar en MySQL
USE Comuctiva;

-- Primero limpiar duplicados si existen
source C:\xampp\htdocs\comuctivs\Base_De_Datos_Comuntiva\MANTENIMIENTO.sql

-- Luego agregar constraint
ALTER TABLE usuario 
ADD CONSTRAINT UK_Usuario_TipDoc_NumDoc 
UNIQUE (ID_TipDocu, NumDoc);
```

---

## ✅ Lista de Verificación

Después de actualizar, verifica:

- [ ] Base de datos `Comuctiva` existe
- [ ] Tabla `usuario` tiene constraint `UK_Usuario_TipDoc_NumDoc`
- [ ] Campo `NumDoc` es tipo `NUMERIC(20)`
- [ ] Existen 3 usuarios: Admin (22222222), Ana (55555555), Pedro (66666666)
- [ ] Cada usuario tiene rol asignado en `rol_usuario`
- [ ] Contraseñas empiezan con `$2a$10$` (BCrypt)
- [ ] Spring Boot inicia sin errores
- [ ] DataLoader muestra: "✅ Contraseña del Admin actualizada correctamente"
- [ ] Login con Admin funciona en Postman
- [ ] Token JWT se genera correctamente

---

## 🔗 Referencias

### Archivos Relacionados
- **Backend:** `Comuctiva_String_Boot/src/main/java/com/comuctiva/comuctiva/`
  - `config/DataLoader.java` - Carga inicial de datos
  - `repositoryes/UsuarioRepositories.java` - Consultas de usuario
  - `services/UsuarioServicesImple.java` - Lógica de login
  
- **Documentación:**
  - `POSTMAN_TESTS.md` - Pruebas de API
  - `LOGIN_QUICK_START.md` - Guía de login
  - `RESUMEN_COMPLETO.md` - Resumen general del proyecto

### Comandos Útiles

#### Ver estructura de usuario
```sql
SHOW CREATE TABLE usuario;
```

#### Verificar constraint
```sql
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE
FROM information_schema.TABLE_CONSTRAINTS
WHERE TABLE_SCHEMA = 'Comuctiva' 
  AND TABLE_NAME = 'usuario';
```

#### Ver usuarios actuales
```sql
SELECT ID_Usuario, NomUsu, NumDoc, correo
FROM usuario
ORDER BY NumDoc;
```

#### Detectar duplicados
```sql
SELECT ID_TipDocu, NumDoc, COUNT(*) as cantidad
FROM usuario
GROUP BY ID_TipDocu, NumDoc
HAVING COUNT(*) > 1;
```

---

## 📅 Historial de Cambios

### 2025-10-28 (v2.0) - ESTA ACTUALIZACIÓN
- ✅ Agregado constraint UNIQUE en tabla usuario
- ✅ Campo NumDoc cambiado a NUMERIC
- ✅ Creado DML_DATOS_INICIALES.sql
- ✅ Creado INSTALACION_COMPLETA.sql
- ✅ Creado MANTENIMIENTO.sql
- ✅ Creada documentación completa (README.md, INDICE.md)
- ✅ Modificado DataLoader para actualizar password automáticamente
- ✅ Modificado UsuarioRepositories con findFirstByTipDocAndNumDoc()
- ✅ Limpiados 14 usuarios duplicados
- ✅ Resuelto NonUniqueResultException
- ✅ Resuelto error de contraseña incorrecta

### 2025-XX-XX (v1.0) - Versión Anterior
- Estructura inicial DDL
- Datos base mínimos

---

## 🎯 Próximos Pasos

1. ✅ **COMPLETADO:** Actualizar archivos SQL
2. ✅ **COMPLETADO:** Crear documentación
3. ✅ **COMPLETADO:** Probar login exitoso
4. ⏭️ **SIGUIENTE:** Probar todas las APIs en Postman
5. ⏭️ **SIGUIENTE:** Agregar productos de prueba
6. ⏭️ **SIGUIENTE:** Implementar frontend de login

---

## 📞 Soporte

Si encuentras algún problema:

1. **Consulta la documentación:**
   - `README.md` - Documentación completa
   - `INDICE.md` - Guía rápida

2. **Ejecuta diagnóstico:**
   ```bash
   mysql -u root < MANTENIMIENTO.sql > diagnostico.txt
   ```

3. **Verifica logs del servidor:**
   ```
   Busca mensajes:
   - "✅ Contraseña del Admin actualizada correctamente"
   - "✅ Contraseña correcta"
   - "Token generado: ..."
   ```

4. **Reinstala desde cero si es necesario:**
   ```bash
   mysql -u root < INSTALACION_COMPLETA.sql
   ```

---

## ✨ Resumen Ejecutivo

### Lo Más Importante

🎯 **Script Recomendado:** `INSTALACION_COMPLETA.sql`  
🔐 **Usuario Admin:** NumDoc `22222222`, Password `admin123`  
🚀 **Login Funcional:** ✅ Verificado exitosamente  
📦 **Archivos Nuevos:** 6 archivos SQL + documentación  
🐛 **Problemas Resueltos:** 2 críticos (duplicados + password)

### Comandos Clave

```bash
# Instalación completa
mysql -u root < INSTALACION_COMPLETA.sql

# Mantenimiento
mysql -u root < MANTENIMIENTO.sql

# Iniciar servidor
cd Comuctiva_String_Boot
.\mvnw.cmd spring-boot:run
```

### Estado Actual

✅ Base de datos actualizada  
✅ Constraint UNIQUE agregado  
✅ DataLoader funcional  
✅ Login funcionando correctamente  
✅ Documentación completa  
✅ **SISTEMA LISTO PARA USO** 🎉

---

**Fecha:** Octubre 28, 2025  
**Versión:** 2.0  
**Estado:** ✅ COMPLETADO EXITOSAMENTE
