# SGE – Sistema de Gestión Empresarial (ERP) para la Comercializadora LYRA

**Institución:** Corporación de Estudios Tecnológicos del Norte del Valle (COTECNOVA)
**Programa:** Tecnología en Gestión de Sistemas de Información
**Asignatura:** Software de Gestión Empresarial – 2026
**Docente:** Ingeniero Jhon James Cano Sánchez
**Integrantes:** Manuela Aguirre Toro · Alejandra Díaz Velásquez

---

## Tabla de contenido

1. [Descripción](#1-descripción)
2. [Módulos del sistema](#2-módulos-del-sistema)
3. [Tecnologías](#3-tecnologías)
4. [Requisitos](#4-requisitos)
5. [Instalación desde cero](#5-instalación-desde-cero)
6. [Usuarios de prueba](#6-usuarios-de-prueba)
7. [Manual de uso](#7-manual-de-uso)
8. [Seguridad (RBAC) y auditoría](#8-seguridad-rbac-y-auditoría)
9. [Modelo de datos](#9-modelo-de-datos)
10. [API REST v1](#10-api-rest-v1)
11. [Automatización: eventos, colas y tareas programadas](#11-automatización-eventos-colas-y-tareas-programadas)
12. [Dashboard](#12-dashboard)
13. [Pruebas y calidad](#13-pruebas-y-calidad)
14. [Comandos útiles](#14-comandos-útiles)
15. [Despliegue en producción](#15-despliegue-en-producción)
16. [Documentación del repositorio](#16-documentación-del-repositorio)

---

## 1. Descripción

LYRA es una comercializadora pequeña de productos de consumo y de oficina (tecnología, papelería, aseo, alimentos, ferretería y hogar). Enfrentaba un manejo fragmentado del inventario, ausencia de trazabilidad entre compras y ventas y falta de control sobre quién modificaba los registros críticos.

Es un ERP web que integra catálogos, compras, ventas e inventario (kardex) con control de acceso por roles, auditoría de cambios, una API REST versionada, importación/exportación en Excel, documentos PDF y automatización de alertas.

## 2. Módulos del sistema

| Módulo | Qué hace |
|---|---|
| Productos y categorías | CRUD con búsqueda, paginación, papelera y restauración (Soft Delete). El stock **no se edita a mano**: solo cambia por movimientos del kardex. |
| Clientes y proveedores | CRUD con filtros, estado activo/inactivo, papelera y restauración. |
| Compras | Órdenes `OC-00001`, recepción total o parcial que aumenta el stock (sin exceder lo pedido), factura del proveedor, anulación y orden en PDF. |
| Ventas | Cabecera + detalle, número secuencial `FV-00001`, IVA 19 %, descuento de stock, anulación con devolución de stock, factura en PDF y exportación a Excel por fechas. |
| Inventario (Kardex) | Todo movimiento de existencias queda registrado (entradas, salidas, saldo y cuadre) con bloqueo pesimista; ajustes por conteo físico con motivo obligatorio. |
| Excel | Exportación de productos y ventas; importación masiva de productos con plantilla oficial y validación fila a fila. |
| Auditoría | Registro de cambios (antes/después) y bitácora de seguridad con Spatie Activitylog. |
| Notificaciones | Campana en el menú y correo: stock bajo, recepción de compras y resumen diario. |
| Dashboard | KPIs filtrados por permisos y Top 5 de productos más vendidos. |
| Configuración | Usuarios (varios roles, permisos directos, activar/desactivar), roles y matriz de permisos módulo × acción. |
| API REST v1 | Login con token, consulta de productos y registro/consulta de ventas (Laravel Sanctum). |

## 3. Tecnologías

| Capa | Tecnología |
|---|---|
| Backend | Laravel 13 · PHP 8.3+ |
| Base de datos | MySQL 8.4 |
| Frontend | Blade · Tailwind CSS · Vite · Laravel Breeze |
| Entorno | Laravel Sail (Docker): app, MySQL, worker de colas y Mailpit |
| Autorización | Spatie Laravel-Permission v8.3 |
| Auditoría | Spatie Laravel-Activitylog v5 |
| API | Laravel Sanctum v4 |
| Excel / PDF | Maatwebsite Excel v4 · barryvdh/laravel-dompdf v3 |
| Calidad | PHPUnit ^12.5 · Laravel Pint · GitHub Actions |

## 4. Requisitos

- Docker Desktop (con WSL2 si se trabaja en Windows)
- Git
- Opcional: PHP 8.3+ y Composer (si no se tienen, se usa un contenedor temporal)

## 5. Instalación desde cero

```bash
# 1. Clonar el repositorio e ingresar al directorio
git clone https://github.com/manuela-aguirre/ProyectoFinal-SGE.git sge
cd sge

# 2. Instalar dependencias de PHP (la carpeta vendor/ no viene en el repositorio)
composer install
#    Alternativa con Docker si no hay Composer local:
docker run --rm -u "$(id -u):$(id -g)" -v "$(pwd):/var/www/html" -w /var/www/html \
    laravelsail/php83-composer:latest composer install --ignore-platform-reqs

# 3. Configurar variables de entorno (el .env no viene en el repositorio)
cp .env.example .env
#    .env.example trae SQLite por defecto: ajusta DB_* y MAIL_* como se indica abajo.

# 4. Iniciar los contenedores (Laravel, MySQL 8.4, worker de colas y Mailpit)
./vendor/bin/sail up -d

# 5. Generar la clave de la aplicación y ejecutar migraciones + seeders
./vendor/bin/sail artisan key:generate
./vendor/bin/sail artisan migrate --seed

# 6. Instalar dependencias frontend y compilar assets
./vendor/bin/sail npm install
./vendor/bin/sail npm run build
```

Abrir <http://localhost>. Los correos de prueba se ven en Mailpit: <http://localhost:8025>.

### Variables de entorno para Sail (`.env`)

```env
APP_URL=http://localhost
APP_LOCALE=es

DB_CONNECTION=mysql
DB_HOST=mysql
DB_PORT=3306
DB_DATABASE=sge
DB_USERNAME=sail
DB_PASSWORD=password

QUEUE_CONNECTION=database

MAIL_MAILER=smtp
MAIL_HOST=mailpit
MAIL_PORT=1025
```

> **Reiniciar la base de datos:** `./vendor/bin/sail artisan migrate:fresh --seed`
>
> **Puerto 80 ocupado:** agrega `APP_PORT=8080` en el `.env` y usa <http://localhost:8080>.
>
> **Productos con stock sin movimientos de kardex:** `./vendor/bin/sail artisan kardex:inicializar` registra el stock actual como «inventario inicial».

### Procesos en segundo plano

`compose.yaml` ya incluye un servicio `queue` que ejecuta `queue:work`. Para lanzarlos manualmente durante pruebas en vivo:

```bash
./vendor/bin/sail artisan queue:work      # procesa notificaciones en cola
./vendor/bin/sail artisan schedule:work   # ejecuta las tareas programadas
```

## 6. Usuarios de prueba

Creados por `TestUserSeeder`. Todos usan la contraseña **`password`**.

| Correo | Rol(es) | Permiso directo | Alcance de prueba |
|---|---|---|---|
| `admin@test.com` | admin | — | Acceso completo al ERP y Configuración |
| `vendedor@test.com` | vendedor | — | Productos (ver), Clientes y Ventas |
| `almacenista@test.com` | almacenista | — | Productos, Categorías, Proveedores, Compras y Kardex |
| `contador@test.com` | contador | — | Consultas, exportación de ventas, reportes y auditoría |
| `supervisor@test.com` | vendedor + almacenista | `ver-reportes` | Selector de rol activo tras el login + KPI financiero |

`migrate --seed` ejecuta `DatabaseSeeder`, que además carga: `RolePermissionSeeder` (42 permisos y 4 roles), `CategoriaSeeder`, `ProviderSeeder`, `ProductSeeder`, `ClientSeeder`, `CompraSeeder` y `SaleSeeder`.

## 7. Manual de uso

### Inicio de sesión y rol activo

Se ingresa por <http://localhost> con correo y contraseña. Una cuenta inactiva no puede entrar. Los usuarios con un solo rol van directo al Dashboard, quienes tienen varios (como `supervisor@test.com`) eligen primero con qué rol trabajar en la pantalla «¿Con qué rol desea trabajar?» y pueden cambiarlo luego desde el menú superior de usuario. La barra de navegación muestra solo los módulos autorizados para el rol activo más los permisos directos y la campana indica las notificaciones sin leer.

### Catálogos y carga masiva en Excel

En Productos, Categorías, Clientes y Proveedores se puede buscar por nombre o documento, filtrar por estado o categoría, crear, editar y enviar a la papelera; desde **Papelera** se restauran los registros eliminados lógicamente. En Productos se puede exportar el listado a `.xlsx` o ir a **Importar**: se descarga la plantilla oficial, se diligencian las columnas (`nombre`, `descripcion`, `precio`, `stock`, `categoria`, `proveedor`) y se carga el archivo. Al terminar, el sistema informa registros creados, actualizados y el detalle de las filas omitidas por errores.

### Compras, kardex y ventas

- **Registrar y recibir compras (Almacenista / Admin):** en *Compras → Nueva orden de compra* se elige un proveedor activo y se agregan productos con cantidad y costo unitario; la orden queda pendiente. Al llegar la mercancía se abre *Ver*, se digitan las unidades recibidas por línea (sin exceder lo pendiente) y, opcionalmente, la factura del proveedor, y se pulsa **Registrar recepción**. La orden se descarga en PDF.
- **Kardex y ajustes (Almacenista / Contador / Admin):** en *Inventario → Kardex* se elige el producto y se filtran los movimientos por concepto o fechas para verificar entradas, salidas, saldo y cuadre. Si hay diferencia tras un conteo físico, en **Ajustar inventario** se digita la cantidad real y un motivo de mínimo 10 caracteres.
- **Ventas (Vendedor / Admin):** en *Ventas → Nueva venta* se elige un cliente activo y productos con stock. Al guardar se descuenta el inventario y se genera la factura `FV-xxxxx`, lista para PDF o exportación a Excel por fechas. Solo admin puede anular una venta, lo que devuelve el stock.
- **Auditoría y Configuración (Admin / Contador):** en *Auditoría* se filtran los cambios por módulo, evento, usuario o fechas, viendo el antes y el después. En *Configuración* el administrador crea usuarios, asigna roles o permisos directos, edita roles y actualiza la matriz módulo × acción.

### Flujo de prueba sugerido

1. Con `almacenista@test.com`, crear una **orden de compra** y **recibirla parcialmente**: el stock sube.
2. Intentar recibir **más de lo pedido**: el sistema lo rechaza.
3. Revisar el **Kardex** del producto: aparecen la entrada y el saldo.
4. Con `vendedor@test.com`, registrar una **venta**: el stock baja y se genera `FV-xxxxx`.
5. Intentar vender **más que el stock disponible**: el sistema lo rechaza.
6. Abrir el **PDF** de la factura y de la orden de compra.
7. Con `admin@test.com`, **anular** la venta: el stock se devuelve.
8. Revisar el **Dashboard**: los KPIs reflejan los cambios.
9. Con `vendedor@test.com`, entrar a `/purchases`: responde **403**.
10. Con `contador@test.com`, revisar **Auditoría**.

## 8. Seguridad (RBAC) y auditoría

- **Spatie Laravel-Permission:** 42 permisos con convención `accion-modulo`, organizados en 12 módulos y 9 acciones estándar (`PermissionCatalog` y `config/permisos.php`), y 4 roles: `admin`, `vendedor`, `almacenista` y `contador`.
- **Middleware en controladores:** cada acción declara `permission:*`; sin permiso el sistema responde 403.
- **`@can` en vistas:** botones y enlaces solo aparecen a quien tiene el permiso.
- **Rol activo:** `EnsureActiveRole` obliga a elegir rol a los usuarios con varios roles y cierra la sesión de usuarios desactivados.
- **Permisos directos:** se asignan desde Configuración → Usuarios, además de los del rol.
- **Soft Delete:** productos, categorías, clientes, proveedores, ventas y compras van a la papelera y se restauran.
- **Auditoría:** el trait `Auditable` registra cambios de los modelos de negocio (antes/después) y la bitácora `seguridad` registra inicio, fallo y cierre de sesión y cambios de roles y permisos. Los registros de más de 365 días se depuran cada mes (`activitylog:clean`).
- **Servicios transaccionales:** `SaleService`, `PurchaseService`, `InventoryService` y `AccessControlService` encapsulan las reglas de negocio con `DB::transaction`.

### Matriz de permisos por rol

Los 42 permisos sembrados en `RolePermissionSeeder.php` (✓ = concedido):

| Módulo | Permiso | admin | vendedor | almacenista | contador |
|---|---|:-:|:-:|:-:|:-:|
| Productos | `ver-productos` | ✓ | ✓ | ✓ | ✓ |
| Productos | `crear-productos` | ✓ | — | ✓ | — |
| Productos | `editar-productos` | ✓ | — | ✓ | — |
| Productos | `eliminar-productos` | ✓ | — | — | — |
| Productos | `exportar-productos` | ✓ | — | — | — |
| Productos | `importar-productos` | ✓ | — | — | — |
| Categorías | `ver-categorias` | ✓ | — | ✓ | — |
| Categorías | `crear-categorias` | ✓ | — | — | — |
| Categorías | `editar-categorias` | ✓ | — | — | — |
| Categorías | `eliminar-categorias` | ✓ | — | — | — |
| Clientes | `ver-clientes` | ✓ | ✓ | — | ✓ |
| Clientes | `crear-clientes` | ✓ | ✓ | — | — |
| Clientes | `editar-clientes` | ✓ | ✓ | — | — |
| Clientes | `eliminar-clientes` | ✓ | — | — | — |
| Ventas | `ver-ventas` | ✓ | ✓ | — | ✓ |
| Ventas | `crear-ventas` | ✓ | ✓ | — | — |
| Ventas | `editar-ventas` | ✓ | — | — | — |
| Ventas | `eliminar-ventas` | ✓ | — | — | — |
| Ventas | `exportar-ventas` | ✓ | — | — | ✓ |
| Proveedores | `ver-proveedores` | ✓ | — | ✓ | ✓ |
| Proveedores | `crear-proveedores` | ✓ | — | ✓ | — |
| Proveedores | `editar-proveedores` | ✓ | — | ✓ | — |
| Proveedores | `eliminar-proveedores` | ✓ | — | — | — |
| Compras | `ver-compras` | ✓ | — | ✓ | ✓ |
| Compras | `crear-compras` | ✓ | — | ✓ | — |
| Compras | `editar-compras` | ✓ | — | — | — |
| Compras | `eliminar-compras` | ✓ | — | — | — |
| Compras | `recibir-compras` | ✓ | — | ✓ | — |
| Inventario | `ver-inventario` | ✓ | — | ✓ | ✓ |
| Inventario | `ajustar-inventario` | ✓ | — | ✓ | — |
| Reportes | `ver-reportes` | ✓ | — | — | ✓ |
| Auditoría | `ver-auditoria` | ✓ | — | — | ✓ |
| Usuarios | `ver` / `crear` / `editar-usuarios` (3) | ✓ | — | — | — |
| Roles | `ver` / `crear` / `editar` / `eliminar-roles` (4) | ✓ | — | — | — |
| Permisos | `ver` / `crear` / `eliminar-permisos` (3) | ✓ | — | — | — |

> `supervisor@test.com` combina los roles *vendedor* y *almacenista* (uno activo por sesión) más el permiso directo `ver-reportes`.

## 9. Modelo de datos

El detalle de las tablas de negocio (`productos`, `sales`, `purchases`, `inventory_movements`, `activity_log`) está en [`docs/diccionario.md`](docs/diccionario.md) y el diagrama entidad-relación en [`docs/diagrama_er.png`](docs/diagrama_er.png). El resto del esquema:

| Tabla | Campos principales y llaves | Propósito |
|---|---|---|
| `users` | id (PK), name, tipo_identificacion, numero_identificacion, email (UK), password, active, remember_token | Cuentas de acceso y estado activo/inactivo |
| `categorias` | id (PK), codigo (nullable), nombre, deleted_at | Agrupación de productos (Soft Delete) |
| `clients` | id (PK), document_type (ENUM), document_number (UK), name, email, phone, address, active, deleted_at | Clientes habilitados para ventas |
| `providers` | id (PK), document_type (ENUM), document_number (UK), name, contact_name, email, phone, address, active, deleted_at | Proveedores para productos y compras |
| `sale_details` | id (PK), sale_id (FK cascade), product_id (FK restrict), quantity, unit_price, subtotal | Líneas de cada factura de venta |
| `purchase_details` | id (PK), purchase_id (FK cascade), product_id (FK restrict), quantity, received_quantity, unit_cost, subtotal | Líneas pedidas y recibidas por orden de compra |
| `roles`, `permissions` | id (PK), name, guard_name (web) | Catálogo RBAC de Spatie (4 roles y 42 permisos) |
| `model_has_roles`, `model_has_permissions`, `role_has_permissions` | role_id / permission_id, model_type, model_id | Asignación de roles y permisos (directos y heredados) |
| `personal_access_tokens` | id (PK), tokenable (morphs), name, token (UK), abilities, last_used_at, expires_at | Tokens Bearer de Sanctum con ability `rol:*` |
| `notifications` | id (UUID PK), type, notifiable (morphs), data, read_at | Bandeja de la campana del menú |
| `jobs`, `cache` | id, queue, payload, attempts / key, value, expiration | Colas y caché de permisos |

Cálculo de documentos: `subtotal = Σ (cantidad × precio)` · `IVA = subtotal × 0.19` · `total = subtotal + IVA`.

## 10. API REST v1

Base: `/api/v1`. Autenticación con token Bearer (Laravel Sanctum, ability `rol:*`); las respuestas usan Eloquent API Resources (`ProductResource`, `SaleResource`). El login admite 5 intentos por minuto por IP y las rutas protegidas 60 peticiones por minuto.

Colección Postman: [`docs/api/ERP-API-v1.postman_collection.json`](docs/api/ERP-API-v1.postman_collection.json), con variables `baseUrl`, `email`, `password`, `clientId`, `productId`, `saleId` y `token`, y aserciones automáticas en cada solicitud:

| Solicitud | Método y ruta | Payload / Autorización | Aserciones |
|---|---|---|---|
| Login | `POST /api/v1/login` | JSON: email, password, device_name, role | 201, token no vacío; guarda `{{token}}` |
| Mi usuario | `GET /api/v1/me` | Bearer | 200; usuario, rol activo y permisos |
| Logout | `POST /api/v1/logout` | Bearer | 200; elimina `{{token}}` |
| Listar productos | `GET /api/v1/products` | Bearer | 200; guarda `{{productId}}` con stock > 0 |
| Obtener producto | `GET /api/v1/products/{id}` | Bearer | 200; detalle vía `ProductResource` |
| Crear venta | `POST /api/v1/sales` | Bearer + client_id, sale_date, items | 201; guarda `{{saleId}}` |
| Obtener venta | `GET /api/v1/sales/{id}` | Bearer | 200; factura vía `SaleResource` |
| Error 422 – sin stock | `POST /api/v1/sales` | Bearer + quantity: 99999999 | 422; `errors` contiene `items` |
| Error 401 – sin token | `GET /api/v1/me` | Sin Authorization | 401 Unauthenticated |

Ejemplo de petición:

```http
POST {{baseUrl}}/api/v1/sales
Authorization: Bearer {{token}}
Accept: application/json
Content-Type: application/json

{
  "client_id": 1,
  "sale_date": "2026-11-24",
  "items": [
    { "product_id": 1, "quantity": 1 }
  ]
}
```

## 11. Automatización: eventos, colas y tareas programadas

- **Eventos de dominio:** `SaleRegistered` y `PurchaseReceived` (despachados después del *commit*) con los listeners `CheckLowStock` y `NotifyPurchaseReceived`.
- **Notificaciones en cola** (correo + campana): `LowStockNotification`, `PurchaseReceivedNotification` y `DailySummaryNotification`.
- **Resumen diario:** `erp:resumen-diario` envía a la gerencia ventas, compras y stock bajo del día (por defecto a las 19:00, zona `America/Bogota`); admite `--fecha=Y-m-d`.
- **Parámetros del negocio** (`config/erp.php`): `ERP_LOW_STOCK` (umbral de stock bajo, por defecto 5) y `ERP_DAILY_SUMMARY_AT`.
- **Cron en servidor:** una sola tarea del sistema que ejecuta `php artisan schedule:run` cada minuto.

## 12. Dashboard

| KPI | Permiso requerido |
|---|---|
| Productos, stock bajo (≤ 5) y valor del inventario | `ver-productos` |
| Clientes activos | `ver-clientes` |
| Ventas del mes (cantidad y valor) | `ver-ventas` |
| Compras del mes y órdenes por recibir | `ver-compras` |
| Proveedores activos | `ver-proveedores` |
| Ventas − Compras del mes | `ver-reportes` |
| Top 5 productos más vendidos del mes | `ver-ventas` o `ver-reportes` |
| Productos para reabastecer | `crear-compras` |

## 13. Pruebas y calidad

```bash
./vendor/bin/sail test               # PHPUnit
./vendor/bin/sail bin pint --test    # estilo de código (Laravel Pint)
```

Resultado verificado al cierre del desarrollo: **68 pruebas y 163 aserciones en verde** (≈ 13 s) y **Laravel Pint sin errores en 160 archivos**. Las pruebas cubren reglas de ventas y compras, productos e importación Excel, notificaciones, la matriz RBAC y la autenticación de Breeze. La verificación continua corre en GitHub Actions.

## 14. Comandos útiles

```bash
./vendor/bin/sail up -d                           # levantar contenedores
./vendor/bin/sail down                            # apagar contenedores
./vendor/bin/sail artisan migrate:fresh --seed    # reiniciar la base de datos
./vendor/bin/sail artisan route:list              # ver rutas
./vendor/bin/sail artisan kardex:inicializar      # stock actual como inventario inicial
./vendor/bin/sail artisan erp:resumen-diario      # enviar el resumen diario manualmente
./vendor/bin/sail artisan view:clear              # limpiar caché de vistas
./vendor/bin/sail artisan tinker                  # consola de Laravel
./vendor/bin/sail mysql                           # abrir MySQL
```

## 15. Despliegue en producción

Usa [`.env.production.example`](.env.production.example) como plantilla: se copia como `.env` en el servidor y se completan los valores. Puntos clave: `APP_ENV=production`, `APP_DEBUG=false`, `SESSION_SECURE_COOKIE=true`, `LOG_CHANNEL=daily`, usuario de base de datos con permisos mínimos, correo SMTP real, un worker de colas (`queue:work`) y el cron de `schedule:run`. **Nunca se sube el `.env` real al repositorio.**

## 16. Documentación del repositorio

- [`docs/analisis.md`](docs/analisis.md) – análisis del negocio
- [`docs/diccionario.md`](docs/diccionario.md) – diccionario de datos
- [`docs/diagrama_er.png`](docs/diagrama_er.png) – diagrama entidad-relación
- [`docs/api/ERP-API-v1.postman_collection.json`](docs/api/ERP-API-v1.postman_collection.json) – colección Postman
