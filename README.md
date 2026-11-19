# Examen Parcial 4 — ETPS4 (SwiftUI)

Proyecto práctico desarrollado en **SwiftUI** dentro de **Xcode 14.3.1** (en máquina virtual con macOS Ventura) para la asignatura **ETPS4** de la **Universidad Tecnológica de El Salvador (UTEC)**[cite: 2, 3].

## Información general
- **Asignatura:** ETPS4[cite: 2, 3]
- **Docente:** Ing. Orlando Girón
- **Evaluación:** 4.ª Evaluación Ordinaria / Examen Parcial 4[cite: 2, 3]
- **Dispositivo de referencia:** iPhone 14 Pro (iOS 16.2)
- **Autor / Usuario:** 93Cast *(reemplazar con tu nombre completo y carnet)*[cite: 3, 4]

## Características implementadas
- **Encabezado institucional y navegación:** Muestra el logotipo de la UTEC (`logo` en `Assets.xcassets`), materia, título del parcial, datos del alumno y menú de navegación[cite: 3, 4, 8].
- **Consumo de `movies.json`:** Carga de datos desde el `Bundle` con decodificación mediante `Codable` y `JSONDecoder`, ampliado a **24 películas** (4 originales + 20 agregadas)[cite: 1, 3].
- **Pantalla de listado y barra inferior:** Visualización de películas con miniatura, título, año, género y barra inferior de navegación[cite: 3, 4].
- **Pantalla de detalle:** Muestra póster, nombre de la película, año de estreno, categoría, cantidad de estrellas según el campo `star` del JSON y sinopsis[cite: 1, 4].

## Estructura principal del proyecto
```text
Parcial4Practico2929712023/
├── Parcial4Practico2929712023/
│   ├── Assets.xcassets/          # Catálogo de recursos (logo de UTEC, AppIcon, AccentColor)
│   ├── Preview Content/
│   ├── ContentView.swift         # Pantalla principal de listado y barra inferior
│   ├── HeaderView.swift          # Encabezado institucional y menú de navegación
│   ├── Movie.swift               # Modelo Movie y cargador de movies.json
│   ├── MovieDetailView.swift     # Vista de detalle de la película seleccionada
│   └── movies.json               # Catálogo de 24 películas
└── README.md
