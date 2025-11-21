# 🌐 Guía de Despliegue - SCOUPE Portfolio

## 📋 Tabla de Contenidos
- [Opción 1: Netlify (Recomendado)](#opción-1-netlify-recomendado)
- [Opción 2: Hostinger con Dominio Personalizado](#opción-2-hostinger-con-dominio-personalizado)
- [Opción 3: GitHub Pages](#opción-3-github-pages)
- [Verificación Post-Despliegue](#verificación-post-despliegue)

---

## Opción 1: Netlify (Recomendado) ⭐

### Por qué Netlify
- ✅ Deploy automático desde Git
- ✅ HTTPS gratuito automático
- ✅ CDN global (carga rápida en todo el mundo)
- ✅ Sin configuración de servidor necesaria
- ✅ Ideal para dominio personalizado de Hostinger

### Pasos para Deploy en Netlify

#### A. Deploy Manual (Más Rápido)
1. Ve a https://app.netlify.com/
2. Haz clic en "Add new site" → "Deploy manually"
3. Arrastra la carpeta completa del proyecto
4. ¡Listo! Tu sitio está en línea en segundos

#### B. Deploy con Git (Recomendado para actualizaciones)
1. Sube tu proyecto a GitHub:
   ```bash
   cd /Users/geinermartinezmoscoso/Desktop/potafolio
   git init
   git add .
   git commit -m "Initial commit - SCOUPE Portfolio"
   git branch -M main
   git remote add origin https://github.com/TU-USUARIO/TU-REPO.git
   git push -u origin main
   ```

2. En Netlify:
   - Clic en "Add new site" → "Import an existing project"
   - Conecta GitHub
   - Selecciona tu repositorio
   - Build settings (ya están en netlify.toml):
     - Build command: `echo 'No build required'`
     - Publish directory: `.`
   - Clic en "Deploy site"

### Conectar tu Dominio de Hostinger a Netlify

#### Paso 1: Configurar en Netlify
1. En tu sitio de Netlify, ve a "Domain settings"
2. Clic en "Add custom domain"
3. Ingresa tu dominio: `tudominio.com`
4. Netlify te dará instrucciones de DNS

#### Paso 2: Configurar DNS en Hostinger

##### Método A: Name Servers (Recomendado - Más Simple)
1. En Netlify, copia los 4 Name Servers (dns1.p0X.nsone.net, etc.)
2. En Hostinger:
   - Ve a "Dominios" → Selecciona tu dominio
   - "Gestión de DNS" → "Change Nameservers"
   - Cambia a "Custom Nameservers"
   - Pega los Name Servers de Netlify
   - Guarda los cambios

**⏱️ Tiempo de propagación: 24-48 horas (usualmente menos de 4 horas)**

##### Método B: Registros DNS (Más Control)
1. En Hostinger, ve a "Dominios" → "Gestión de DNS"
2. Agrega/Modifica estos registros:

```
# Para el dominio principal (tudominio.com)
Tipo: A
Nombre: @
Valor: 75.2.60.5
TTL: 3600

# Para www (www.tudominio.com)
Tipo: CNAME
Nombre: www
Valor: [tu-sitio].netlify.app
TTL: 3600
```

3. Si tienes subdominios existentes, no los elimines

**⏱️ Tiempo de propagación: 1-6 horas**

#### Paso 3: Verificar HTTPS
- Netlify habilitará automáticamente HTTPS
- Esto puede tardar de 10 minutos a 1 hora
- Puedes verificar en "Domain settings" → "HTTPS"

---

## Opción 2: Hostinger con Dominio Personalizado 🏠

Si prefieres alojar directamente en Hostinger:

### Paso 1: Acceder al Panel de Hostinger
1. Inicia sesión en hPanel de Hostinger
2. Ve a "Administrador de archivos" o usa FTP

### Paso 2: Subir Archivos

#### A. Usando el Administrador de Archivos Web
1. Ve a "Administrador de archivos"
2. Navega a la carpeta `public_html` (o la raíz de tu dominio)
3. **IMPORTANTE**: Borra cualquier archivo `index.html` o `index.php` existente
4. Sube todos los archivos de tu proyecto:
   - `index.html` (página principal)
   - Carpeta `pages/`
   - Carpeta `assets/`
   - Todas las imágenes (*.png, *.svg, etc.)

#### B. Usando FTP (Más Rápido para muchos archivos)
1. En hPanel, ve a "FTP Accounts" para obtener credenciales
2. Usa FileZilla o Cyberduck:
   - Host: tudominio.com o ftp.tudominio.com
   - Usuario: [tu usuario FTP]
   - Contraseña: [tu contraseña FTP]
   - Puerto: 21
3. Sube todos los archivos a `public_html/`

### Paso 3: Configurar Redirecciones (Opcional)
Crea un archivo `.htaccess` en `public_html/`:

```apache
# Redirigir index2.html a la nueva ubicación
Redirect 301 /index2.html /pages/automatizacion.html
Redirect 301 /index2 /pages/automatizacion.html

# URLs amigables
RewriteEngine On
RewriteRule ^automatizacion$ /pages/automatizacion.html [L]
RewriteRule ^ia$ /pages/automatizacion.html [L]

# Forzar HTTPS (si tienes SSL)
RewriteEngine On
RewriteCond %{HTTPS} off
RewriteRule ^(.*)$ https://%{HTTP_HOST}%{REQUEST_URI} [L,R=301]

# Habilitar compresión
<IfModule mod_deflate.c>
  AddOutputFilterByType DEFLATE text/html text/plain text/xml text/css text/javascript application/javascript
</IfModule>

# Habilitar caché
<IfModule mod_expires.c>
  ExpiresActive On
  ExpiresByType image/jpg "access plus 1 year"
  ExpiresByType image/jpeg "access plus 1 year"
  ExpiresByType image/gif "access plus 1 year"
  ExpiresByType image/png "access plus 1 year"
  ExpiresByType text/css "access plus 1 month"
  ExpiresByType application/javascript "access plus 1 month"
</IfModule>
```

### Paso 4: Configurar SSL (HTTPS)
1. En hPanel, ve a "SSL"
2. Activa "Let's Encrypt SSL" para tu dominio
3. Espera 15-30 minutos para que se active

---

## Opción 3: GitHub Pages 📄

### Paso 1: Subir a GitHub
```bash
cd /Users/geinermartinezmoscoso/Desktop/potafolio
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/TU-USUARIO/TU-REPO.git
git push -u origin main
```

### Paso 2: Activar GitHub Pages
1. En tu repositorio de GitHub, ve a "Settings"
2. "Pages" en el menú lateral
3. Source: "Deploy from a branch"
4. Branch: `main`, folder: `/ (root)`
5. Guarda los cambios

### Paso 3: Dominio Personalizado (Opcional)
1. En GitHub Pages settings, agrega tu dominio en "Custom domain"
2. En Hostinger, agrega estos registros DNS:
```
Tipo: A
Nombre: @
Valor: 185.199.108.153

Tipo: A
Nombre: @
Valor: 185.199.109.153

Tipo: A
Nombre: @
Valor: 185.199.110.153

Tipo: A
Nombre: @
Valor: 185.199.111.153

Tipo: CNAME
Nombre: www
Valor: TU-USUARIO.github.io
```

---

## Verificación Post-Despliegue ✅

### Checklist de Funcionalidad
- [ ] Página principal carga correctamente
- [ ] Navegación entre secciones funciona
- [ ] Link a "Automatización IA" funciona
- [ ] Animaciones Lottie se reproducen
- [ ] Imágenes cargan correctamente
- [ ] Formularios están visibles
- [ ] Sitio es responsivo (móvil, tablet, desktop)
- [ ] HTTPS está activo (candado en el navegador)

### Herramientas de Verificación
1. **Velocidad**: https://pagespeed.web.dev/
2. **SSL**: https://www.ssllabs.com/ssltest/
3. **Responsividad**: Usa DevTools de Chrome (F12 → Toggle device toolbar)
4. **Links rotos**: https://www.deadlinkchecker.com/

### Optimizaciones Post-Deploy

#### Para mejorar velocidad:
1. Comprime imágenes: https://tinypng.com/
2. Minifica HTML/CSS/JS (opcional, Netlify lo hace automático)
3. Usa WebP para imágenes (convierte PNG/JPG a WebP)

---

## 🆘 Solución de Problemas

### Problema: "El sitio no carga"
✅ **Solución**: 
- Verifica que `index.html` esté en la raíz
- Revisa la consola del navegador (F12)
- En Hostinger, asegúrate de que los archivos estén en `public_html`

### Problema: "Las animaciones no funcionan"
✅ **Solución**:
- Verifica que la carpeta `assets/animations/` exista
- Revisa las rutas en el código (deben ser relativas)
- Verifica que los archivos .json estén presentes

### Problema: "El dominio no funciona"
✅ **Solución**:
- Espera 24-48 horas para propagación DNS
- Verifica configuración DNS en Hostinger
- Usa https://dnschecker.org/ para verificar propagación

### Problema: "HTTPS no funciona"
✅ **Solución**:
- En Netlify: Se activa automáticamente, espera 1 hora
- En Hostinger: Activa Let's Encrypt SSL manualmente
- Fuerza HTTPS con .htaccess o configuración del hosting

---

## 📞 Soporte

¿Necesitas ayuda? Contacta:
- **Netlify Support**: https://docs.netlify.com/
- **Hostinger Support**: Chat en vivo disponible 24/7 en hPanel
- **GitHub Pages Docs**: https://docs.github.com/pages

---

## 🎉 ¡Felicidades!

Tu sitio está listo para el mundo. No olvides:
1. Probar en diferentes dispositivos
2. Compartir en redes sociales
3. Configurar Google Analytics (opcional)
4. Agregar Google Search Console
5. Crear un sitemap.xml para SEO

**¡Éxito con tu proyecto SCOUPE! 🚀**
