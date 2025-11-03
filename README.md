# E-commerce Deportivo "VitalCrossfit" - Documentación

## 🎥 Videos Demostrativos

Para complementar esta documentación, hemos preparado videos demostrativos que muestran las principales funcionalidades de VitalCrossfit:

### 📱 Video de Publicidad - App en Acción

[![Publicidad VitalCrossfit - E-commerce Deportivo](https://img.youtube.com/vi/3WsJLowIr34/0.jpg)](https://youtu.be/3WsJLowIr34)

**Ver video de publicidad: [https://youtu.be/3WsJLowIr34](https://youtu.be/3WsJLowIr34)**

### 🎬 Video Demostrativo Completo

[![Demo VitalCrossfit - E-commerce Deportivo](https://img.youtube.com/vi/JSJEFx--G4U/0.jpg)](https://youtu.be/JSJEFx--G4U)

**Ver video demostrativo completo: [https://youtu.be/JSJEFx--G4U](https://youtu.be/JSJEFx--G4U)**

### 🌐 Presentación Web del Proyecto

**📊 Sitio web de presentación: [https://rodrdevs80.github.io/presentacion_vitalCrossfit_html/](https://rodrdevs80.github.io/presentacion_vitalCrossfit_html/)**

Esta página web incluye:

- Información detallada sobre el proyecto
- Características principales
- Tecnologías utilizadas
- Capturas de pantalla
- Demostraciones visuales

### 📋 Contenido de los Videos

**Video de Publicidad (0:30)**

- Vista general de la aplicación en acción
- Interfaz moderna y atractiva
- Experiencia de usuario fluida

**Video Demostrativo Completo**

- **00:00-02:00**: Introducción y visión general del proyecto
- **02:00-05:00**: Panel de administración y gestión de productos
- **05:00-08:00**: Funcionalidades para usuarios y proceso de compra
- **08:00-10:00**: Asistente IA especializado en fitness
- **10:00-12:00**: Sistema de cupones y características avanzadas

---

📋 Tabla de Contenidos

- Descripción General
- Arquitectura del Sistema
- Tecnologías Utilizadas
- Estructura del Proyecto
- Instalación y Configuración
- Base de Datos
- API Documentation
- Autenticación y Autorización
- Características Principales
- Despliegue
- Scripts y Comandos
- Contribución

## 🚀 Descripción General

VitalCrossfit es una plataforma de e-commerce especializada en productos deportivos, fitness y crossfit. El sistema está construido con una arquitectura full-stack moderna que incluye un backend robusto en Node.js/Express y un frontend dinámico en React.

### 🎯 Objetivos del Proyecto

- Proporcionar una experiencia de compra optimizada para entusiastas del fitness
- Ofrecer gestión completa de productos, categorías y usuarios
- Implementar un sistema de cupones y descuentos
- Integrar inteligencia artificial para asistencia especializada
- Garantizar seguridad y escalabilidad

## 🏗️ Arquitectura del Sistema

### Diagrama de Arquitectura

```
Cliente (React) ←→ API Gateway (Express) ←→ Servicios ←→ Base de Datos (MySQL)
         ↑                              ↑              ↑
         │                              │              │
   Estado Local                    Middleware        Modelos
   (Context)                    (Auth, Uploads)    (Sequelize)
```

### Componentes Principales

- **Frontend**: Aplicación React con Vite
- **Backend**: API RESTful con Express.js
- **Base de Datos**: MySQL con Sequelize ORM
- **Autenticación**: JWT con roles múltiples
- **Almacenamiento**: Sistema de archivos local con Multer
- **IA**: Integración con Groq AI

## 🛠️ Tecnologías Utilizadas

### Backend

| Tecnología | Versión | Propósito               |
| ---------- | ------- | ----------------------- |
| Node.js    | >=18    | Runtime del servidor    |
| Express    | 5.1.0   | Framework web           |
| Sequelize  | 6.37.7  | ORM para MySQL          |
| MySQL2     | 3.15.1  | Driver de base de datos |
| JWT        | 9.0.2   | Autenticación           |
| Bcrypt     | 6.0.0   | Hash de contraseñas     |
| Multer     | 2.0.2   | Manejo de archivos      |
| Nodemailer | 7.0.10  | Envío de emails         |
| Groq SDK   | 0.32.0  | Integración con IA      |

### Frontend

| Tecnología   | Versión | Propósito               |
| ------------ | ------- | ----------------------- |
| React        | 19.1.0  | Biblioteca UI           |
| Vite         | 6.3.5   | Build tool              |
| Tailwind CSS | 4.1.7   | Framework CSS           |
| Material-UI  | 7.3.4   | Componentes UI          |
| React Router | 7.6.2   | Navegación              |
| Axios        | 1.9.0   | Cliente HTTP            |
| Chart.js     | 4.5.1   | Gráficos y estadísticas |

### Seguridad

- **Helmet**: Headers de seguridad
- **CORS**: Control de acceso cross-origin
- **Express Rate Limit**: Limitación de peticiones
- **JWT**: Tokens de autenticación
- **Bcrypt**: Encriptación de contraseñas

## 📁 Estructura del Proyecto

### Backend (/backEx)

```
backEx/
├── src/
│   ├── config/                 # Configuraciones
│   │   ├── db/                # Configuración de base de datos
│   │   └── ia/                # Configuración de IA
│   ├── controllers/           # Lógica de negocio
│   ├── middleware/            # Middlewares personalizados
│   │   ├── auth.middleware.js # Autenticación JWT
│   │   ├── errorHander.js     # Manejo de errores
│   │   └── multer.middleware.js # Upload de archivos
│   ├── models/               # Modelos de Sequelize
│   ├── routes/               # Definición de rutas
│   ├── scripts/              # Scripts de base de datos
│   │   ├── syripts.js        # Script principal de inicialización
│   │   └── DBvitalCrossFit.sql # Script SQL completo de la base de datos
│   ├── servicios/            # Servicios reutilizables
│   └── util/                 # Utilidades
├── uploads/                  # Archivos subidos
│   ├── categorias/           # Imágenes de categorías
│   └── productos/            # Imágenes de productos
├── service/                  # Servicios externos
└── index.js                 # Punto de entrada
```

### Frontend (/frontEx)

```
frontEx/
├── src/
│   ├── Admin/               # Panel de administración
│   ├── components/          # Componentes reutilizables
│   ├── context/             # Context de React
│   ├── pages/               # Páginas de la aplicación
│   ├── routes/              # Configuración de rutas
│   ├── services/            # Servicios API
│   └── App.jsx             # Componente principal
├── public/                  # Archivos estáticos
└── package.json
```

## ⚙️ Instalación y Configuración

### Prerrequisitos

- Node.js 18 o superior
- MySQL 8.0 o superior
- pnpm (recomendado) o npm

### 1. Clonar el Repositorio

```bash
git clone <repository-url>
cd vitalcrossfit
```

### 2. Configuración del Backend

```bash
cd backEx

# Instalar dependencias
pnpm install

# Configurar variables de entorno
cp .env.example .env
```

Configuración de .env:

```env
# Servidor
PORT=3000
API_RAIZ=/api/v1
NODE_ENV=development

# Base de Datos
DB_NAME=vitalcrossfit
DB_USER=root
DB_PASSWORD=tu_password
DB_HOST=localhost
DB_PORT=3306
DB_DIALECT=mysql

# Autenticación JWT
JWT_SECRET=tu_jwt_secret_muy_seguro
JWT_REFRESH_SECRET=tu_refresh_secret_muy_seguro

# Email
USER_GMAIL=tu_email@gmail.com
PASS_APP=tu_password_de_aplicacion

# IA
GROQ_API_KEY=tu_groq_api_key
```

### 3. Configuración del Frontend

```bash
cd ../frontEx

# Instalar dependencias
pnpm install

# Configurar variables de entorno (opcional)
cp .env.example .env
```

### 4. Base de Datos

```sql
-- Crear base de datos
CREATE DATABASE vitalcrossfit CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### 5. Ejecutar Script de Inicialización

```bash
cd backEx

# Ejecutar script de inicialización de la base de datos
node src/scripts/syripts.js
```

**⚠️ Importante:** El script `syripts.js` realiza las siguientes acciones:

- Sincroniza todos los modelos con la base de datos
- Crea las tablas necesarias
- Inserta datos de ejemplo para categorías, productos y usuarios
- Configura relaciones entre modelos

### 6. Ejecutar la Aplicación

**Backend:**

```bash
cd backEx
pnpm run dev
```

**Frontend:**

```bash
cd frontEx
pnpm run dev
```

La aplicación estará disponible en:

- Frontend: http://localhost:5173
- Backend API: http://localhost:3000
- Presentación Web: https://rodrdevs80.github.io/presentacion_vitalCrossfit_html/

## 🗃️ Base de Datos

### Estructura de la Base de Datos

La aplicación utiliza MySQL como sistema de gestión de base de datos. El esquema completo se encuentra definido en el archivo SQL:

```
backEx/src/scripts/DBvitalCrossFit.sql
```

### Recrear la Base de Datos

#### Método 1: Ejecutar Script SQL (Recomendado)

1. **Acceder a MySQL:**

   ```bash
   mysql -u root -p
   ```

2. **Ejecutar el script completo:**

   ```sql
   SOURCE ruta/completa/hacia/backEx/src/scripts/DBvitalCrossFit.sql
   ```

   _Ejemplo en Windows:_

   ```sql
   SOURCE C:\Users\TuUsuario\proyecto\backEx\src\scripts\DBvitalCrossFit.sql
   ```

   _Ejemplo en Linux/Mac:_

   ```sql
   SOURCE /home/tuusuario/proyecto/backEx/src/scripts/DBvitalCrossFit.sql
   ```

#### Método 2: Importar desde Línea de Comandos

```bash
mysql -u root -p vitalcrossfit < backEx/src/scripts/DBvitalCrossFit.sql
```

#### Método 3: Usar Sequelize Sync (Desarrollo)

Como alternativa, puedes usar la sincronización automática de Sequelize (solo para desarrollo):

```javascript
// En backEx/index.js, descomenta la línea:
await sequelize.sync({ alter: true });
```

**⚠️ Importante:** Este método solo en desarrollo, ya que puede modificar la estructura pero no incluye datos de prueba.

### Contenido del Script SQL

El archivo `DBvitalCrossFit.sql` incluye:

- ✅ Creación de la base de datos `vital_crossfit_tienda2`
- ✅ Definición completa de todas las tablas
- ✅ Relaciones y constraints foreign key
- ✅ Datos de prueba para:
  - Administradores
  - Categorías
  - Productos
  - Usuarios
  - Cupones de descuento
  - Y más...

### Verificación

Después de ejecutar el script, verifica que la base de datos se creó correctamente:

```sql
USE vital_crossfit_tienda2;
SHOW TABLES;
SELECT COUNT(*) as total_tablas FROM information_schema.tables
WHERE table_schema = 'vital_crossfit_tienda2';
```

### Resolución de Problemas

**Error de permisos:**

```sql
GRANT ALL PRIVILEGES ON vital_crossfit_tienda2.* TO 'tu_usuario'@'localhost';
FLUSH PRIVILEGES;
```

**Error de encoding:**
Asegúrate de que MySQL use UTF-8:

```sql
SET NAMES utf8mb4;
```

### Backup de Base de Datos

Para crear un backup de la base de datos:

```bash
mysqldump -u root -p vital_crossfit_tienda2 > backup_vitalcrossfit_$(date +%Y%m%d).sql
```

### Modelos y Esquema

La base de datos contiene las siguientes tablas principales:

- `administradores` - Gestión de administradores del sistema
- `usuarios` - Usuarios registrados en la plataforma
- `categorias` - Categorías de productos
- `productos` - Catálogo de productos
- `carritos` - Carritos de compra de usuarios
- `ordenes` - Órdenes de compra
- `cuponesdescuento` - Sistema de cupones
- `archivo` - Archivos e imágenes de productos
- `mensajes` - Reseñas y comentarios de productos

Cada tabla incluye timestamps automáticos (`fechaCreacion`, `fechaActualizacion`) y campos de estado (`activo`) para borrado lógico.

## 🔌 API Documentation

### Endpoints Principales

#### Autenticación (/api/v1/auth)

| Método | Endpoint               | Descripción                          |
| ------ | ---------------------- | ------------------------------------ |
| POST   | /register              | Registro de usuarios/administradores |
| POST   | /login                 | Inicio de sesión                     |
| POST   | /refresh-token-usuario | Refrescar token usuario              |
| POST   | /refresh-token-admin   | Refrescar token admin                |

#### Productos (/api/v1/productos)

| Método | Endpoint | Descripción                 |
| ------ | -------- | --------------------------- |
| GET    | /all     | Listar todos los productos  |
| GET    | /activos | Productos activos           |
| GET    | /:id     | Obtener producto por ID     |
| POST   | /        | Crear producto (con imagen) |
| PUT    | /:id     | Actualizar producto         |
| DELETE | /:id     | Eliminar producto           |
| PATCH  | /:id     | Cambiar estado (lógico)     |

#### Categorías (/api/v1/categorias)

| Método | Endpoint | Descripción          |
| ------ | -------- | -------------------- |
| GET    | /all     | Listar categorías    |
| GET    | /activos | Categorías activas   |
| POST   | /        | Crear categoría      |
| PUT    | /:id     | Actualizar categoría |

#### Usuarios (/api/v1/usuarios)

| Método | Endpoint | Descripción        | Permisos    |
| ------ | -------- | ------------------ | ----------- |
| GET    | /all     | Todos los usuarios | Admin       |
| GET    | /activos | Usuarios activos   | Admin       |
| POST   | /        | Crear usuario      | Público     |
| PUT    | /:id     | Actualizar usuario | Owner/Admin |

#### Administradores (/api/v1/administradores)

| Método | Endpoint | Descripción              | Permisos   |
| ------ | -------- | ------------------------ | ---------- |
| GET    | /        | Listar administradores   | Admin      |
| POST   | /        | Crear administrador      | Full Admin |
| PUT    | /:id     | Actualizar administrador | Admin      |

#### Chatbot IA (/api/v1/chatbot)

| Método | Endpoint | Descripción              |
| ------ | -------- | ------------------------ |
| POST   | /        | Consulta al asistente IA |

#### Archivos (/api/v1/files)

| Método | Endpoint            | Descripción          |
| ------ | ------------------- | -------------------- |
| POST   | /upload/:idProducto | Subir archivo        |
| GET    | /:idProducto        | Archivos de producto |
| GET    | /download/:fileName | Descargar archivo    |

### Ejemplos de Uso

**Autenticación:**

```javascript
// Login
const response = await fetch("/api/v1/auth/login", {
  method: "POST",
  headers: { "Content-Type": "application/json" },
  body: JSON.stringify({
    email: "usuario@ejemplo.com",
    contrasena: "password123",
  }),
});
```

**Crear Producto:**

```javascript
const formData = new FormData();
formData.append("nombre", "Producto Ejemplo");
formData.append("descripcion", "Descripción del producto");
formData.append("precio", "99.99");
formData.append("portada", imageFile);

const response = await fetch("/api/v1/productos", {
  method: "POST",
  body: formData,
});
```

## 🔐 Autenticación y Autorización

### Sistema de Roles

**Roles de Usuario**

- **Bronce**: Usuario básico (gasto < $100.000)
- **Plata**: Usuario medio ($100.000 - $500.000)
- **Oro**: Usuario premium (> $500.000)

**Roles de Administrador**

- **Admin**: Gestión básica
- **Full Admin**: Acceso completo

### Middleware de Autenticación

```javascript
// Proteger ruta
router.get("/ruta-protegida", protect, (req, res) => {
  // req.user contiene usuario autenticado
});

// Requerir rol específico
router.get(
  "/admin-only",
  protect,
  authorizeAdministrador("admin", "fulladmin"),
  (req, res) => {
    /* ... */
  }
);
```

### Tokens JWT

- **Access Token**: 30 minutos de duración
- **Refresh Token**: 7 días de duración
- **Algoritmo**: HS256

## ✨ Características Principales

### 1. Gestión de Productos

✅ CRUD completo de productos  
✅ Subida múltiple de imágenes  
✅ Categorización  
✅ Sistema de ofertas y descuentos  
✅ Búsqueda y filtrado avanzado

### 2. Sistema de Usuarios

✅ Registro y autenticación segura  
✅ Roles y permisos  
✅ Gestión de carrito de compras  
✅ Historial de pedidos

### 3. Panel de Administración

✅ Dashboard con métricas  
✅ Gestión de categorías  
✅ Control de cupones  
✅ Administración de usuarios

### 4. Asistente IA Especializado

✅ Chatbot para consultas de fitness  
✅ Temáticas limitadas a entrenamiento  
✅ Cache de respuestas  
✅ Rate limiting

### 5. Sistema de Archivos

✅ Upload seguro de imágenes  
✅ Validación de tipos y tamaños  
✅ Servicio de archivos estáticos  
✅ Eliminación en cascada

### 6. Comercio Electrónico

✅ Carrito de compras  
✅ Proceso de checkout  
✅ Sistema de cupones  
✅ Gestión de inventario

## 🚀 Despliegue

### Configuración para Producción

Variables de Entorno de Producción:

```env
NODE_ENV=production
PORT=3000
API_RAIZ=/api/v1

# Base de datos producción
DB_HOST=production-db-host
DB_PASSWORD=strong_production_password

# Seguridad
JWT_SECRET=very_strong_jwt_secret_production
```

### Optimizaciones

- Compresión Gzip habilitada
- Rate limiting configurado
- Headers de seguridad con Helmet
- Logging con Morgan
- Cache para respuestas IA

### Monitoreo

- Endpoint de salud: /health
- Logs estructurados
- Manejo centralizado de errores

## 📜 Scripts y Comandos

### Backend

```bash
pnpm run dev      # Desarrollo con watch mode
pnpm run start    # Producción
```

### Frontend

```bash
pnpm run dev      # Desarrollo
pnpm run build    # Build para producción
pnpm run preview  # Preview del build
```

### Base de Datos

```bash
# Sincronizar modelos y cargar datos iniciales
node src/scripts/syripts.js

# Ejecutar script SQL completo
mysql -u root -p < src/scripts/DBvitalCrossFit.sql

# Reset completo (¡CUIDADO!)
await sequelize.sync({ force: true });
```

**📝 Nota sobre los Scripts de Base de Datos:**

- **`syripts.js`**: Script de Node.js que usa Sequelize para sincronizar modelos
- **`DBvitalCrossFit.sql`**: Script SQL completo con toda la estructura y datos de prueba
- Ambos métodos son válidos, el script SQL es más completo e incluye datos de prueba realistas

## 🤝 Contribución

### Estructura de Commits

- `feat`: Nueva funcionalidad
- `fix`: Corrección de bugs
- `docs`: Documentación
- `style`: Cambios de formato
- `refactor`: Refactorización
- `test`: Pruebas

### Guías de Estilo

- **Backend**: JavaScript ES6+ con módulos
- **Frontend**: React con hooks
- **Base de Datos**: Sequelize con validaciones
- **API**: RESTful con respuestas estandarizadas

## 📞 Soporte y Contacto

Para issues y soporte:

- Revisar documentación
- Verificar logs del servidor
- Revisar respuestas de la API
- Contactar al equipo de desarrollo

## 🔄 Estado del Proyecto

- **Versión**: 1.0.0
- **Estado**: Desarrollo Activo
- **Última Actualización**: octubre 2025

### Próximas Características

- [ ] Pasarela de pago integrada
- [ ] Sistema de reseñas y calificaciones
- [ ] Notificaciones push
- [ ] App móvil nativa
- [ ] Analytics avanzado

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver archivo LICENSE para más detalles.

**Creador:**  
Carlos E. Rodriguez

---

**VitalCrossfit - Potenciando tu entrenamiento, un producto a la vez.** 💪
