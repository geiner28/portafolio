# 🚀 Portafolio SCOUPE - Sitio Web Profesional

Sitio web corporativo de SCOUPE con sección especializada en automatización con IA.

## 📁 Estructura del Proyecto

```
potafolio/
├── index.html                 # Página principal (Home)
├── pages/
│   └── automatizacion.html   # Página de Automatización con IA
├── assets/
│   └── animations/           # Archivos JSON de animaciones Lottie
│       ├── animacion1.json
│       ├── animacion2.json
│       ├── animacion3.json
│       ├── animacion4.json
│       └── animacion5.json
├── netlify.toml              # Configuración de Netlify
├── _redirects                # Reglas de redireccionamiento
└── README.md                 # Este archivo
```

## 🌐 Despliegue en Netlify

### Opción 1: Deploy mediante Drag & Drop

1. Ve a [Netlify](https://app.netlify.com/)
2. Inicia sesión o crea una cuenta
3. Haz clic en "Add new site" → "Deploy manually"
4. Arrastra toda la carpeta del proyecto a la zona de drop
5. ¡Listo! Tu sitio estará disponible en unos segundos

### Opción 2: Deploy mediante Git (Recomendado)

1. Sube tu proyecto a un repositorio de GitHub
2. En Netlify, haz clic en "Add new site" → "Import an existing project"
3. Conecta tu cuenta de GitHub
4. Selecciona tu repositorio
5. Netlify detectará automáticamente la configuración desde `netlify.toml`
6. Haz clic en "Deploy site"

### Opción 3: Deploy mediante Netlify CLI

```bash
# Instalar Netlify CLI
npm install -g netlify-cli

# Iniciar sesión
netlify login

# Desplegar el sitio
netlify deploy --prod
```

## 🔗 Conectar Dominio Personalizado de Hostinger

### Paso 1: En Netlify

1. Ve a tu sitio en Netlify
2. Ve a "Domain settings"
3. Haz clic en "Add custom domain"
4. Ingresa tu dominio (ej: `tudominio.com`)
5. Netlify te mostrará los registros DNS que necesitas configurar

### Paso 2: En Hostinger

1. Inicia sesión en tu panel de Hostinger
2. Ve a "Dominios" → Selecciona tu dominio
3. Haz clic en "DNS / Nameservers"
4. Agrega los siguientes registros:

**Opción A: Usar Name Servers de Netlify (Recomendado)**
- En Netlify, copia los Name Servers (aparecen como dns1.p0X.nsone.net, etc.)
- En Hostinger, cambia los Name Servers a los de Netlify

**Opción B: Configurar registros DNS manualmente**
```
Tipo: A
Host: @
Value: 75.2.60.5
TTL: 3600

Tipo: CNAME
Host: www
Value: [tu-sitio].netlify.app
TTL: 3600
```

### Paso 3: Habilitar HTTPS

Netlify habilitará automáticamente HTTPS con Let's Encrypt. Este proceso puede tardar unos minutos.

## 🎨 Características del Sitio

- ✅ Diseño responsive (móvil, tablet, desktop)
- ✅ Animaciones Lottie para mejor experiencia visual
- ✅ Sección especializada en Automatización con IA
- ✅ Formularios de contacto
- ✅ SEO optimizado
- ✅ Rendimiento optimizado

## 🔧 Mantenimiento

### Actualizar contenido

1. Edita los archivos HTML según necesites
2. Sube los cambios a tu repositorio (si usas Git)
3. Netlify desplegará automáticamente los cambios

### Agregar nuevas páginas

1. Crea nuevos archivos HTML en la carpeta `pages/`
2. Actualiza los enlaces de navegación en `index.html`
3. Si es necesario, agrega redirecciones en `_redirects`

## 📱 Navegación del Sitio

- **Home**: `/` o `/index.html` - Página principal con todos los servicios
- **Automatización IA**: `/pages/automatizacion.html` - Sección especializada en IA
- **URLs amigables**: 
  - `/automatizacion` → redirige a la página de IA
  - `/ia` → redirige a la página de IA

## 🛠️ Tecnologías Utilizadas

- HTML5
- CSS3 (Tailwind CSS via CDN)
- JavaScript vanilla
- Lottie Player para animaciones
- Animate.css para animaciones CSS

## 📞 Soporte

Para más información sobre el proyecto o soporte técnico, contacta a:
- Email: contacto@scoupe.com
- Teléfono: +1 (555) 123-4567

---

**Nota**: Este sitio está optimizado para ser desplegado en Netlify, pero también puede ser hospedado en cualquier servidor web estático (GitHub Pages, Vercel, etc.) con mínimas modificaciones.
