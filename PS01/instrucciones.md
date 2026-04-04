# Instrucciones de entrega del PS 01

## Macroeconomia Internacional | Semestre 2026-I
## Instructor: Carlos Montoro
## EP: Alejandro Ventura & Fernando Condori

---

## 1. Estructura del repositorio

Cada grupo debe crear una carpeta con el siguiente nombre **exacto**:

```
PS01_GrupoXX/
```

donde `XX` es el numero de su grupo (01, 02, ..., 12, etc.).

Dentro de esa carpeta, la estructura debe ser:

```
PS01_GrupoXX/
├── codigo/
│   ├── PS01_analisis.ipynb       # o .py / .R / .m
│   ├── PS01_simulacion.ipynb     # o .py / .R / .m
│   └── datos/                    # CSVs descargados o generados
│       └── peru_trimestral.csv
│       └── ...
├── entregable/
│   ├── PS01_GrupoXX.pdf          # Documento principal con respuestas
│   └── declaracion_IA.pdf        # Declaracion de uso de IA (ver seccion 5)
├── video/
│   └── PS01_GrupoXX_video.mp4    # Video de sustentacion (max 10 min)
└── README.md                     # Breve descripcion de que contiene cada archivo
```

---

## 2. Como subir al repositorio

### Paso 1: Clonar el repositorio (solo la primera vez)

```bash
git clone <URL_DEL_REPOSITORIO>
cd <NOMBRE_DEL_REPO>
```

### Paso 2: Crear su rama de trabajo

**No trabajen directamente en `main`.** Creen una rama con el nombre de su grupo:

```bash
git checkout -b PS01/grupoXX
```

### Paso 3: Agregar sus archivos

Copien su carpeta `PS01_GrupoXX/` dentro del repositorio y luego:

```bash
git add PS01_GrupoXX/
git status    # verificar que se agregaron los archivos correctos
```

**Importante:** Antes de hacer `add`, verifiquen que:
- No estan subiendo archivos innecesarios (`.DS_Store`, `__pycache__`, `.ipynb_checkpoints`)
- Los archivos pesados (videos) estan dentro del limite de GitHub (100 MB por archivo)
- No estan subiendo credenciales, API keys, ni datos sensibles

### Paso 4: Hacer commit

```bash
git commit -m "PS01 GrupoXX: entrega final"
```

Si hacen correcciones despues, haganlas en commits separados con mensajes descriptivos:

```bash
git commit -m "PS01 GrupoXX: correccion grafico pregunta (a)"
```

**No reescriban el historial** (`--amend`, `rebase`, `force push`). Queremos ver la trazabilidad de cambios.

### Paso 5: Push a su rama

```bash
git push origin PS01/grupoXX
```

### Paso 6: Crear un Pull Request

1. Vayan a la pagina del repositorio en GitHub
2. Click en **"Compare & pull request"** (aparece automaticamente despues del push)
3. Titulo: `PS01 GrupoXX — Entrega`
4. En la descripcion, listen brevemente:
   - Integrantes del grupo
   - Pais asignado para la calibracion
   - Lenguaje de programacion usado
5. **No mergeen el PR ustedes mismos.** Los TAs lo revisaremos.

---

## 3. Fecha limite

| | Fecha | Hora |
|---|---|---|
| **Entrega final** | **Sabado 12 de abril de 2026** | **23:59 (hora de Lima, UTC-5)** |

- El timestamp del ultimo commit en su rama antes de las 23:59 es lo que cuenta.
- Commits posteriores a la fecha limite **no seran considerados** salvo autorizacion explicita de los TAs.
- Si tienen problemas tecnicos con git, envien un correo **antes** de la fecha limite con evidencia (capturas de pantalla).

---

## 4. Lenguajes de programacion permitidos

Para todas las preguntas que requieran codigo (replicacion, simulacion, graficos, calibracion), **solo se aceptan** los siguientes lenguajes:

| Lenguaje | Formatos aceptados |
|----------|-------------------|
| **Python** | `.ipynb` (Jupyter Notebook) o `.py` |
| **R** | `.Rmd` (R Markdown) o `.R` |
| **MATLAB** | `.m` o `.mlx` (Live Script) |

- Pueden usar el lenguaje que prefieran. No es necesario que todo el grupo use el mismo.
- El codigo debe ser **reproducible**: cualquier TA debe poder ejecutarlo y obtener los mismos resultados. Incluyan las instrucciones de instalacion de paquetes si usan librerias no estandar.
- En Python: `pip install wbgapi statsmodels pandas matplotlib`
- En R: `install.packages(c("WDI", "mFilter", "ggplot2"))`

---

## 5. Politica de uso de Inteligencia Artificial

**El uso de IA esta permitido**, bajo las siguientes condiciones:

### 5.1 Declaracion de transparencia (obligatoria)

Cada grupo debe incluir un archivo `declaracion_IA.pdf` con el siguiente formato:

---

> **DECLARACION DE USO DE INTELIGENCIA ARTIFICIAL**
>
> **Grupo:** XX
>
> **Integrantes:** [nombres]
>
> **Herramientas de IA utilizadas:**
>
> | Herramienta | Version | Preguntas en las que se uso |
> |------------|---------|----------------------------|
> | ChatGPT | GPT-4o | (c), (f), (k) |
> | Claude | Sonnet 4 | (a) codigo de descarga |
> | GitHub Copilot | — | autocompletado general |
>
> **Prompts clave utilizados:**
>
> - Pregunta (c): *"Explica por que la cuenta corriente de China no es contraciclica a pesar de ser un pais emergente"*
> - Pregunta (f): *"Escribe una funcion en Python que simule una economia pequena y abierta con shocks AR(1)"*
> - Pregunta (k): *"Busca la tabla de calibracion de Neumeyer y Perri (2005) para Corea y resume los parametros"*
>
> **Declaramos que:**
> 1. Las respuestas finales reflejan nuestra comprension del material, no una copia literal de outputs de IA.
> 2. Hemos verificado la exactitud de cualquier informacion proporcionada por IA.
> 3. El analisis economico y las interpretaciones son de nuestra autoria.

---

Si **no usaron IA**, igualmente incluyan el archivo con la declaracion: *"No se utilizo ninguna herramienta de IA para esta entrega."*

### 5.2 ¿Qué está bien y qué no?

| Permitido | No permitido |
|-----------|-------------|
| Usar IA para depurar errores de codigo | Copiar respuestas de IA sin entenderlas |
| Pedir explicaciones de conceptos teoricos | Pegar el enunciado completo y entregar el output |
| Generar borradores de codigo que luego adaptan | Presentar texto generado por IA como propio sin editar |
| Buscar papers y fuentes con IA | Inventar citas o datos que no verificaron |

**Criterio general:** La IA es una herramienta, no un sustituto. Si en la sustentacion (video o Q&A) no pueden explicar lo que entregaron, se asumira que no es trabajo propio.

---

## 6. Politica de colaboracion entre grupos

**La cooperacion entre grupos esta permitida**, con las siguientes reglas:

- Pueden discutir enfoques, compartir tips de codigo, y resolver dudas entre grupos.
- **Las respuestas escritas no pueden ser identicas.** Si dos grupos entregan textos sustancialmente iguales (verificado con herramientas de similitud), ambos recibiran penalizacion.
- El codigo puede ser similar (todos usan la misma funcion base), pero la interpretacion y discusion deben ser propias.
- Si un grupo les ayudo significativamente, **agradezcancerlo en su README.md**.

---

## 7. Video de sustentacion

- **Duracion maxima:** 10 minutos.
- **Formato:** MP4 (si excede 100 MB, subanlo a Google Drive/YouTube no listado y peguen el link en su README.md).
- **Contenido sugerido:**
  1. Breve presentacion del grupo (30 seg)
  2. Hallazgo principal de la tabla maestra (2 min)
  3. Un resultado de simulacion que les parecio interesante (2 min)
  4. Calibracion de su pais: que funciono, que no (3 min)
  5. Conclusion: donde la teoria falla y por que (2 min)
- No es necesario que hablen todos los integrantes, pero todos deben estar presentes.

---

## 8. Sesion de Q&A

Se programara una sesion de preguntas y respuestas con los TAs antes de la fecha de entrega. La fecha y hora se confirmaran en funcion de la disponibilidad de los TAs y se comunicara por el canal oficial del curso.

**Formato:** Virtual (Zoom/Meet), abierta a todos los grupos. Pueden traer preguntas sobre:
- Interpretacion de resultados
- Problemas tecnicos con el codigo o datos
- Dudas sobre la calibracion con literatura

---

## 9. Checklist antes de entregar

Antes de hacer su push final, verifiquen:

- [ ] La carpeta se llama `PS01_GrupoXX/` (con el numero correcto)
- [ ] El PDF tiene las respuestas a **todas** las preguntas (a)-(l)
- [ ] El codigo es reproducible (otro TA puede correrlo sin modificaciones)
- [ ] Los graficos estan incluidos en el PDF (no solo en el notebook)
- [ ] La tabla maestra de 8 paises esta completa
- [ ] La declaracion de IA esta incluida (aunque no hayan usado IA)
- [ ] El video esta subido (o el link en README.md)
- [ ] El README.md describe brevemente el contenido de cada archivo
- [ ] No hay archivos innecesarios (checkpoints, caches, backups)
- [ ] El PR esta creado con titulo y descripcion correctos

---

## 10. Contacto

Para dudas sobre la entrega: contacten a los TAs por el canal oficial del curso.

Para problemas con Git: revisen la [guia oficial de GitHub](https://docs.github.com/en/get-started/quickstart) o pregunten en la sesion de Q&A.
