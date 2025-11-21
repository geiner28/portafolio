#!/bin/bash
# Script de verificación para el proyecto SCOUPE

echo "═══════════════════════════════════════════════════════════"
echo "  Verificación del Proyecto SCOUPE Portfolio"
echo "═══════════════════════════════════════════════════════════"
echo ""

# Verificar estructura de archivos
echo "✓ Verificando estructura de archivos..."
echo ""

if [ -f "index.html" ]; then
    echo "  ✅ index.html encontrado"
else
    echo "  ❌ index.html NO encontrado"
fi

if [ -f "pages/automatizacion.html" ]; then
    echo "  ✅ pages/automatizacion.html encontrado"
else
    echo "  ❌ pages/automatizacion.html NO encontrado"
fi

if [ -d "assets/animations" ]; then
    echo "  ✅ Carpeta assets/animations/ encontrada"
    json_count=$(find assets/animations -name "*.json" | wc -l)
    echo "     → $json_count archivos JSON encontrados"
else
    echo "  ❌ Carpeta assets/animations/ NO encontrada"
fi

if [ -f "netlify.toml" ]; then
    echo "  ✅ netlify.toml encontrado"
else
    echo "  ❌ netlify.toml NO encontrado"
fi

if [ -f "_redirects" ]; then
    echo "  ✅ _redirects encontrado"
else
    echo "  ❌ _redirects NO encontrado"
fi

if [ -f "README.md" ]; then
    echo "  ✅ README.md encontrado"
else
    echo "  ❌ README.md NO encontrado"
fi

if [ -f "DEPLOY.md" ]; then
    echo "  ✅ DEPLOY.md encontrado"
else
    echo "  ❌ DEPLOY.md NO encontrado"
fi

echo ""
echo "═══════════════════════════════════════════════════════════"
echo "  Estadísticas del Proyecto"
echo "═══════════════════════════════════════════════════════════"
echo ""

# Contar archivos
html_files=$(find . -name "*.html" -not -path "./.vscode/*" | wc -l)
json_files=$(find . -name "*.json" -not -path "./.vscode/*" | wc -l)
png_files=$(find . -name "*.png" -not -path "./.vscode/*" | wc -l)
svg_files=$(find . -name "*.svg" -not -path "./.vscode/*" | wc -l)

echo "  📄 Archivos HTML: $html_files"
echo "  🎬 Archivos JSON (animaciones): $json_files"
echo "  🖼️  Archivos PNG: $png_files"
echo "  🎨 Archivos SVG: $svg_files"

echo ""
echo "═══════════════════════════════════════════════════════════"
echo "  Próximos Pasos"
echo "═══════════════════════════════════════════════════════════"
echo ""
echo "  1. Abre DEPLOY.md para instrucciones de despliegue"
echo "  2. Elige tu plataforma (Netlify recomendado)"
echo "  3. Sigue los pasos para conectar tu dominio"
echo ""
echo "  Para más información, lee README.md"
echo ""
echo "═══════════════════════════════════════════════════════════"
echo "                    ¡Proyecto Listo! 🚀"
echo "═══════════════════════════════════════════════════════════"
