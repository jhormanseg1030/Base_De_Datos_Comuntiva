# Base de Datos Comuctiva - Documentación

## 📁 Archivos SQL

### 1. DDL_ACTUALIZADO.sql
**Descripción:** Script de creación de estructura de base de datos (Data Definition Language)

**Contenido:**
- Creación de todas las tablas del sistema
- Definición de claves primarias y foráneas
- Constraints y restricciones de integridad

**Cambios Importantes:**
- ✅ Tabla `Usuario`: Campo `NumDoc` cambiado de `VARCHAR(20)` a `NUMERIC(20)`
- ✅ **NUEVO:** Constraint `UNIQUE (ID_TipDocu, NumDoc)` para prevenir usuarios duplicados
- ✅ Eliminada tabla `Tienda` (ya no es necesaria en el modelo actual)
- ✅ Campo `Password` ampliado a `VARCHAR(500)` para soportar hashes BCrypt

**Uso:**
```sql
-- Ejecutar para crear la base de datos desde cero
mysql -u root < DDL_ACTUALIZADO.sql
```

---

### 2. DML_DATOS_INICIALES.sql
**Descripción:** Datos iniciales necesarios para el funcionamiento del sistema

**Contenido:**
- ✅ Tipos de documento (Cédula, Pasaporte, TI, Cédula Extranjería)
- ✅ Roles del sistema (Administrador, Cliente)
- ✅ **3 Usuarios de prueba:**
  - Admin (NumDoc: 22222222, Password: admin123)
  - Ana (NumDoc: 55555555, Password: 1234)
  - Pedro (NumDoc: 66666666, Password: 1234)
- ✅ Unidades de medida (Kg, g, Lb, Unidad, L, mL)
- ✅ Tipos de vías (Calle, Carrera, Avenida, etc.)
- ✅ Tipos de pago (Efectivo, Débito, Crédito, PSE)
- ✅ Estados de pedidos (Pendiente, En Proceso, En Camino, Entregado, Cancelado)
- ✅ Departamentos y municipios principales de Colombia
- ✅ Transportadoras (Servientrega, Coordinadora, Deprisa)

**Contraseñas:**
Todas las contraseñas están encriptadas con **BCrypt**:
- Hash mostrado: `$2a$10$DowJonesVSTRW0FVz15d9uKLCqH3JsZ.PWypayRII0f.YqK5E9WFG`
- ⚠️ **IMPORTANTE:** El DataLoader de Spring Boot regenera automáticamente el hash correcto

**Uso:**
```sql
-- Ejecutar después de DDL_ACTUALIZADO.sql
mysql -u root < DML_DATOS_INICIALES.sql
```

---

### 3. MANTENIMIENTO.sql
**Descripción:** Script de mantenimiento y limpieza de base de datos

**Funciones:**
1. **Detectar usuarios duplicados** - Consulta para identificar duplicados por TipDoc + NumDoc
2. **Listar todos los usuarios** - Vista completa ordenada por documento
3. **Limpiar duplicados** - Elimina usuarios duplicados manteniendo el de menor ID
4. **Verificar constraint UNIQUE** - Confirma que existe la restricción de unicidad
5. **Actualizar contraseña Admin** - Script comentado para resetear password
6. **Verificar integridad de roles** - Encuentra usuarios sin rol asignado
7. **Estadísticas generales** - Conteo de usuarios, productos, pedidos, compras

**Características de Seguridad:**
- ✅ Desactiva/reactiva `FOREIGN_KEY_CHECKS` durante limpieza
- ✅ Elimina datos relacionados antes de eliminar usuarios (rol_usuario, direcciones, pedidos)
- ✅ Incluye verificación post-limpieza

**Uso:**
```sql
-- Ejecutar periódicamente para mantenimiento
mysql -u root < MANTENIMIENTO.sql
```

⚠️ **ADVERTENCIA:** Hacer backup antes de ejecutar operaciones DELETE

---

## 🔧 Cambios Recientes (Octubre 2025)

### Problema Resuelto: Usuarios Duplicados
**Síntoma:** Error `NonUniqueResultException` al hacer login

**Causa:** Múltiples usuarios con el mismo `ID_TipDocu` y `NumDoc`

**Solución Implementada:**
1. ✅ Limpieza de 14 usuarios duplicados en base de datos
2. ✅ Agregado constraint `UNIQUE (ID_TipDocu, NumDoc)` en tabla Usuario
3. ✅ Modificado `UsuarioRepositories.java`:
   - Método: `findFirstByTipDocAndNumDoc()` retorna `Optional<Usuario>`
   - Incluye `ORDER BY ID_Usuario ASC` para consistencia
4. ✅ Actualizado `DataLoader.java`:
   - Verifica existencia de usuarios antes de crear
   - Actualiza contraseña del Admin si ya existe
   - Previene duplicación de roles

### Problema Resuelto: Contraseña Incorrecta
**Síntoma:** Login retorna "Credenciales inválidas" a pesar de usuario existente

**Causa:** Hash BCrypt en base de datos no coincidía con contraseña esperada

**Solución Implementada:**
1. ✅ `DataLoader.java` ahora SIEMPRE actualiza la contraseña del Admin al iniciar
2. ✅ Usa el `PasswordEncoder` de Spring Boot para generar hash correcto
3. ✅ Log de confirmación: "✅ Contraseña del Admin actualizada correctamente con BCrypt"

---

## 🔐 Autenticación y Seguridad

### Contraseñas BCrypt
- **Algoritmo:** BCrypt con factor de trabajo 10
- **Formato:** `$2a$10$...` (60 caracteres)
- **Generación:** Spring Security `PasswordEncoder`

### Usuarios de Prueba
| Nombre | NumDoc | TipDoc | Password | Rol |
|--------|--------|--------|----------|-----|
| Admin | 22222222 | 1 (CC) | admin123 | Administrador |
| Ana | 55555555 | 1 (CC) | 1234 | Cliente |
| Pedro | 66666666 | 1 (CC) | 1234 | Cliente |

### Constraint de Unicidad
```sql
CONSTRAINT UK_Usuario_TipDoc_NumDoc UNIQUE (ID_TipDocu, NumDoc)
```
- Previene usuarios duplicados con mismo tipo y número de documento
- Genera error MySQL 1062 si se intenta insertar duplicado

---

## 📊 Estructura de Base de Datos

### Tablas Principales
1. **Usuario** - Usuarios del sistema (Admin, Clientes)
2. **Producto** - Catálogo de productos
3. **Pedidos** - Pedidos realizados por clientes
4. **Compra** - Registros de compras con pagos
5. **Carrito** - Carrito de compras temporal
6. **Direcciones** - Direcciones de entrega de usuarios

### Relaciones Clave
- Usuario → Rol_Usuario → Rol (Muchos a Muchos)
- Usuario → Pedidos (Uno a Muchos)
- Pedidos → Compra (Uno a Uno)
- Producto → Unidad_Medida (Muchos a Uno)
- Direcciones → Usuario, Barrio, Vias (Muchos a Uno)

---

## 🚀 Integración con Spring Boot

### DataLoader.java
Componente que ejecuta automáticamente al iniciar el servidor:

**Funciones:**
1. Verifica tipos de documento en BD
2. **Verifica si existe usuario Admin (NumDoc: 22222222)**
3. **Si existe:** Actualiza su contraseña con BCrypt
4. **Si NO existe:** Crea Admin, Ana y Pedro con sus roles

**Log Esperado:**
```
Tipos de documento en la base de datos:
- id: 1, tipo: Cedula de Ciudadania
- id: 2, tipo: Pasaporte
- id: 3, tipo: Tarjeta de Identidad
- id: 4, tipo: Cedula de Extranjeria
⚠️  Actualizando contraseña del usuario Admin...
✅ Contraseña del Admin actualizada correctamente con BCrypt.
```

### application.properties
Configuración de base de datos:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/comuctiva
spring.datasource.username=root
spring.datasource.password=
spring.jpa.hibernate.ddl-auto=update
spring.jpa.show-sql=false
```

---

## 🔄 Flujo de Inicialización

### Primera Vez (BD vacía)
1. Ejecutar `DDL_ACTUALIZADO.sql` - Crea estructura
2. Ejecutar `DML_DATOS_INICIALES.sql` - Inserta datos base
3. Iniciar Spring Boot - DataLoader verifica/complementa datos

### Reinicio de Servidor
1. DataLoader verifica usuario Admin existe
2. **Actualiza su contraseña automáticamente**
3. No duplica roles ni usuarios existentes
4. Listo para login

---

## 📝 Comandos Útiles

### Ver usuarios actuales
```sql
SELECT ID_Usuario, NomUsu, NumDoc, ID_TipDocu, correo 
FROM usuario 
ORDER BY NumDoc;
```

### Verificar contraseñas
```sql
SELECT ID_Usuario, NomUsu, NumDoc, LEFT(password, 30) as password_hash 
FROM usuario;
```

### Detectar duplicados
```sql
SELECT ID_TipDocu, NumDoc, COUNT(*) as cantidad
FROM usuario
GROUP BY ID_TipDocu, NumDoc
HAVING COUNT(*) > 1;
```

### Ver constraint UNIQUE
```sql
SHOW CREATE TABLE usuario;
```

---

## ⚠️ Notas Importantes

1. **Backup:** Siempre hacer backup antes de ejecutar scripts de mantenimiento
2. **Producción:** Cambiar contraseñas de prueba antes de deployment
3. **DataLoader:** El componente es idempotente (puede ejecutarse múltiples veces)
4. **Constraint UNIQUE:** No se puede insertar usuarios con mismo TipDoc + NumDoc
5. **BCrypt:** Las contraseñas NUNCA se almacenan en texto plano

---

## 🐛 Troubleshooting

### Error: NonUniqueResultException
**Causa:** Usuarios duplicados en BD  
**Solución:** Ejecutar `MANTENIMIENTO.sql` sección 3

### Error: Credenciales inválidas (usuario existe)
**Causa:** Hash BCrypt no coincide  
**Solución:** Reiniciar servidor Spring Boot (DataLoader actualiza password)

### Error: 1062 Duplicate entry
**Causa:** Intentando insertar usuario con TipDoc + NumDoc existente  
**Solución:** Verificar datos o eliminar usuario duplicado

### Usuario sin rol
**Causa:** Falta registro en tabla `rol_usuario`  
**Solución:** Ejecutar `MANTENIMIENTO.sql` sección 7 para detectar

---

## 📞 Contacto y Soporte

Para dudas o problemas con la base de datos, consultar:
- Archivo: `POSTMAN_TESTS.md` - Documentación de APIs
- Archivo: `LOGIN_QUICK_START.md` - Guía rápida de login
- Logs del servidor Spring Boot en consola

---

**Última Actualización:** Octubre 28, 2025  
**Versión Base de Datos:** 2.0  
**Compatibilidad:** MySQL 5.5.5+, Spring Boot 3.5.6
