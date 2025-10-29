# E-commerce Deportivo "VitalCrossfit" - Documentación

## 📋 Tabla de Contenidos

1. [Descripción General](#descripción-general)
2. [Arquitectura del Sistema](#arquitectura-del-sistema)
3. [Tecnologías Utilizadas](#tecnologías-utilizadas)
4. [Estructura del Proyecto](#estructura-del-proyecto)
5. [Instalación y Configuración](#instalación-y-configuración)
6. [API Documentation](#api-documentation)
7. [Base de Datos](#base-de-datos)
8. [Autenticación y Autorización](#autenticación-y-autorización)
9. [Características Principales](#características-principales)
10. [Despliegue](#despliegue)
11. [Scripts y Comandos](#scripts-y-comandos)
12. [Contribución](#contribución)

---

## 🚀 Descripción General

**VitalCrossfit** es una plataforma de e-commerce especializada en productos deportivos, fitness y crossfit. El sistema está construido con una arquitectura full-stack moderna que incluye un backend robusto en Node.js/Express y un frontend dinámico en React.

### 🎯 Objetivos del Proyecto

- Proporcionar una experiencia de compra optimizada para entusiastas del fitness
- Ofrecer gestión completa de productos, categorías y usuarios
- Implementar un sistema de cupones y descuentos
- Integrar inteligencia artificial para asistencia especializada
- Garantizar seguridad y escalabilidad

---

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

---

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

---

## 📁 Estructura del Proyecto

### Backend (`/backEx`)

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
│   ├── servicios/            # Servicios reutilizables
│   └── util/                 # Utilidades
├── uploads/                  # Archivos subidos
│   ├── categorias/           # Imágenes de categorías
│   └── productos/            # Imágenes de productos
├── service/                  # Servicios externos
└── index.js                 # Punto de entrada
```

### Frontend (`/frontEx`)

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

---

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

**Configuración de `.env`:**

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

-- Ejecutar sincronización (opcional)
cd backEx
node src/scripts/syripts.js
```

### 5. Ejecutar la Aplicación

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

---

## 🔌 API Documentation

### Endpoints Principales

#### Autenticación (`/api/v1/auth`)

| Método | Endpoint                 | Descripción                          |
| ------ | ------------------------ | ------------------------------------ |
| POST   | `/register`              | Registro de usuarios/administradores |
| POST   | `/login`                 | Inicio de sesión                     |
| POST   | `/refresh-token-usuario` | Refrescar token usuario              |
| POST   | `/refresh-token-admin`   | Refrescar token admin                |

#### Productos (`/api/v1/productos`)

| Método | Endpoint   | Descripción                 |
| ------ | ---------- | --------------------------- |
| GET    | `/all`     | Listar todos los productos  |
| GET    | `/activos` | Productos activos           |
| GET    | `/:id`     | Obtener producto por ID     |
| POST   | `/`        | Crear producto (con imagen) |
| PUT    | `/:id`     | Actualizar producto         |
| DELETE | `/:id`     | Eliminar producto           |
| PATCH  | `/:id`     | Cambiar estado (lógico)     |

#### Categorías (`/api/v1/categorias`)

| Método | Endpoint   | Descripción          |
| ------ | ---------- | -------------------- |
| GET    | `/all`     | Listar categorías    |
| GET    | `/activos` | Categorías activas   |
| POST   | `/`        | Crear categoría      |
| PUT    | `/:id`     | Actualizar categoría |

#### Usuarios (`/api/v1/usuarios`)

| Método | Endpoint   | Descripción        | Permisos    |
| ------ | ---------- | ------------------ | ----------- |
| GET    | `/all`     | Todos los usuarios | Admin       |
| GET    | `/activos` | Usuarios activos   | Admin       |
| POST   | `/`        | Crear usuario      | Público     |
| PUT    | `/:id`     | Actualizar usuario | Owner/Admin |

#### Administradores (`/api/v1/administradores`)

| Método | Endpoint | Descripción              | Permisos   |
| ------ | -------- | ------------------------ | ---------- |
| GET    | `/`      | Listar administradores   | Admin      |
| POST   | `/`      | Crear administrador      | Full Admin |
| PUT    | `/:id`   | Actualizar administrador | Admin      |

#### Chatbot IA (`/api/v1/chatbot`)

| Método | Endpoint | Descripción              |
| ------ | -------- | ------------------------ |
| POST   | `/`      | Consulta al asistente IA |

#### Archivos (`/api/v1/files`)

| Método | Endpoint              | Descripción          |
| ------ | --------------------- | -------------------- |
| POST   | `/upload/:idProducto` | Subir archivo        |
| GET    | `/:idProducto`        | Archivos de producto |
| GET    | `/download/:fileName` | Descargar archivo    |

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

---

## 🗃️ Base de Datos

### Modelos Principales

#### Usuario

```javascript
{
  id: INTEGER (PK, Auto Increment),
  nombre: STRING(50),
  apellido: STRING(50),
  email: STRING (Unique),
  contrasena: STRING (Hash),
  rol: ENUM('bronce', 'plata', 'oro'),
  activo: BOOLEAN (Default: true)
}
```

#### Producto

```javascript
{
  id: INTEGER (PK, Auto Increment),
  nombre: STRING(50),
  descripcion: STRING,
  precio: DECIMAL(10,2),
  imagenUrl: STRING,
  especificaciones: STRING,
  idCategoria: INTEGER (FK),
  oferta: BOOLEAN,
  descuento: INTEGER,
  activo: BOOLEAN
}
```

#### Relaciones

- Usuario (1) ↔ (1) Carrito
- Usuario (1) ↔ (N) Orden
- Categoría (1) ↔ (N) Producto
- Producto (1) ↔ (N) Archivo
- Producto (1) ↔ (N) CuponDescuento

### Scopes de Sequelize

```javascript
// Scopes predefinidos
Usuario.scope("activos"); // Usuarios activos
Usuario.scope("withPassword"); // Incluir contraseña
Producto.scope("activos"); // Productos activos
```

---

## 🔐 Autenticación y Autorización

### Sistema de Roles

#### Roles de Usuario

- **Bronce**: Usuario básico (gasto < $100.000)
- **Plata**: Usuario medio ($100.000 - $500.000)
- **Oro**: Usuario premium (> $500.000)

#### Roles de Administrador

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

---

## ✨ Características Principales

### 1. Gestión de Productos

- ✅ CRUD completo de productos
- ✅ Subida múltiple de imágenes
- ✅ Categorización
- ✅ Sistema de ofertas y descuentos
- ✅ Búsqueda y filtrado avanzado

### 2. Sistema de Usuarios

- ✅ Registro y autenticación segura
- ✅ Roles y permisos
- ✅ Gestión de carrito de compras
- ✅ Historial de pedidos

### 3. Panel de Administración

- ✅ Dashboard con métricas
- ✅ Gestión de categorías
- ✅ Control de cupones
- ✅ Administración de usuarios

### 4. Asistente IA Especializado

- ✅ Chatbot para consultas de fitness
- ✅ Temáticas limitadas a entrenamiento
- ✅ Cache de respuestas
- ✅ Rate limiting

### 5. Sistema de Archivos

- ✅ Upload seguro de imágenes
- ✅ Validación de tipos y tamaños
- ✅ Servicio de archivos estáticos
- ✅ Eliminación en cascada

### 6. Comercio Electrónico

- ✅ Carrito de compras
- ✅ Proceso de checkout
- ✅ Sistema de cupones
- ✅ Gestión de inventario

---

## 🚀 Despliegue

### Configuración para Producción

**Variables de Entorno de Producción:**

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

- Endpoint de salud: `/health`
- Logs estructurados
- Manejo centralizado de errores

---

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
# Sincronizar modelos
node src/scripts/syripts.js

# Reset completo (¡CUIDADO!)
await sequelize.sync({ force: true });
```

---

## 🤝 Contribución

### Estructura de Commits

```
feat: Nueva funcionalidad
fix: Corrección de bugs
docs: Documentación
style: Cambios de formato
refactor: Refactorización
test: Pruebas
```

### Guías de Estilo

- **Backend**: JavaScript ES6+ con módulos
- **Frontend**: React con hooks
- **Base de Datos**: Sequelize con validaciones
- **API**: RESTful con respuestas estandarizadas

---

## 📞 Soporte y Contacto

Para issues y soporte:

1. Revisar documentación
2. Verificar logs del servidor
3. Revisar respuestas de la API
4. Contactar al equipo de desarrollo

---

## 🔄 Estado del Proyecto

**Versión**: 1.0.0  
**Estado**: Desarrollo Activo  
**Última Actualización**: octubre 2025

### Próximas Características

- [ ] Pasarela de pago integrada
- [ ] Sistema de reseñas y calificaciones
- [ ] Notificaciones push
- [ ] App móvil nativa
- [ ] Analytics avanzado

---

## 📄 Licencia

Este proyecto está bajo la Licencia MIT. Ver archivo `LICENSE` para más detalles.

---

## Creador:

Carlos E. Rodriguez

**VitalCrossfit** - Potenciando tu entrenamiento, un producto a la vez. 💪
