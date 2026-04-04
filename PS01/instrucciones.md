# Instrucciones de entrega — Problem Set 01

## Macroeconomía Internacional | Semestre 2026-I
## Profesor: Carlos Montoro
## Encargados de práctica: Alejandro Ventura & Fernando Condori

---

## 1. Estructura del repositorio

Cada grupo debe crear una carpeta con el siguiente nombre **exacto**:

```
PS01_GrupoXX/
```

donde `XX` es el número de su grupo (01, 02, ..., 12, etc.).

Dentro de esa carpeta, la estructura debe ser:

```
PS01_GrupoXX/
├── codigo/
│   ├── PS01_analisis.ipynb          # Bloque A: descarga de datos y regularidades empíricas
│   ├── PS01_simulacion.ipynb        # Bloque B: simulación y calibración
│   └── datos/                       # Archivos CSV descargados o generados
│       └── ...
├── entregable/
│   ├── PS01_GrupoXX.pdf             # Documento principal con todas las respuestas
│   └── declaracion_IA.pdf           # Declaración de uso de IA (ver sección 5)
├── video/
│   └── PS01_GrupoXX_video.mp4       # Video de sustentación (máx. 10 min)
└── README.md                        # Descripción breve del contenido de cada archivo
```

---

## 2. Entregables y formato de respuestas

El *problem set* tiene cuatro entregables. Cada uno tiene requisitos específicos de formato que deben respetarse para que la entrega sea válida.

### 2.1 Solución escrita (obligatorio)

El archivo `PS01_GrupoXX.pdf` debe contener la solución de **todos y cada uno de los ítems** de las Partes I–V, en orden. Para que sea evaluable, tenga en cuenta lo siguiente:

- **Orden:** las respuestas deben seguir estrictamente la numeración del enunciado (ítem 1, ítem 2, ..., ítem 48). No omita ningún ítem ni cambie el orden.
- **Claridad:** cada respuesta debe comenzar indicando el número de ítem al que corresponde. Las derivaciones matemáticas deben presentarse paso a paso, con cada paso justificado. Las respuestas de interpretación deben ser párrafos completos, no listas de palabras sueltas.
- **Gráficos:** todos los gráficos generados en código deben estar embebidos en el PDF, con título, etiquetas en los ejes y leyenda cuando corresponda. No se aceptan referencias a archivos externos.
- **Formato:** únicamente se acepta **PDF**. No se aceptan archivos Word, LaTeX sin compilar ni ningún otro formato.

### 2.2 Código (obligatorio)

La carpeta `codigo/` debe contener los notebooks de Python con todo el código utilizado en la Parte V. El código debe:

- Ser **reproducible**: cualquier encargado de práctica debe poder ejecutarlo de principio a fin y obtener exactamente los mismos resultados.
- Estar **comentado**: cada bloque debe incluir comentarios que expliquen qué hace y por qué.
- Incluir la **instalación de paquetes** al inicio de cada notebook:

```python
!pip install wbgapi statsmodels pandas matplotlib -q
```

- Usar los **nombres de variables exactos** especificados en la tabla de la Parte V.

### 2.3 Video de sustentación (obligatorio)

El video debe seguir la estructura detallada en la sección 9. Su duración máxima es de 10 minutos y debe estar en formato MP4.

### 2.4 Declaración de IA (obligatorio)

El archivo `declaracion_IA.pdf` debe completarse según el formato de la sección 7, independientemente de si se usó IA o no. El formato del archivo debe ser **PDF**.

---

## 4. Cómo subir al repositorio


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

Copien su carpeta `PS01_GrupoXX/` dentro del repositorio y luego ejecuten:

```bash
git add PS01_GrupoXX/
git status    # verificar que se agregaron los archivos correctos
```

**Antes de hacer `add`, verifiquen que:**
- No están subiendo archivos innecesarios (`.DS_Store`, `__pycache__`, `.ipynb_checkpoints`)
- Los archivos de video están dentro del límite de GitHub (100 MB por archivo)
- No están subiendo credenciales, claves de API ni datos sensibles

### Paso 4: Hacer commit

```bash
git commit -m "PS01 GrupoXX: entrega final"
```

Si realizan correcciones posteriores, háganlas en commits separados con mensajes descriptivos:

```bash
git commit -m "PS01 GrupoXX: corrección gráfico ítem (38)"
```

**No reescriban el historial** (`--amend`, `rebase`, `force push`). Queremos ver la trazabilidad de cambios.

### Paso 5: Push a su rama

```bash
git push origin PS01/grupoXX
```

### Paso 6: Crear un Pull Request

1. Vayan a la página del repositorio en GitHub.
2. Hagan clic en **"Compare & pull request"** (aparece automáticamente después del push).
3. Título: `PS01 GrupoXX — Entrega`.
4. En la descripción, incluyan:
   - Integrantes del grupo
   - País asignado para la calibración
5. **No fusionen el PR ustedes mismos.** Los encargados de práctica lo revisaremos.

---

## 5. Fecha límite

| | Fecha | Hora |
|---|---|---|
| **Entrega final** | **Doming 18 de abril de 2026** | **23:59 (hora de Lima, UTC−5)** |

- El *timestamp* del último commit en su rama antes de las 23:59 es lo que cuenta.
- Los commits posteriores a la fecha límite **no serán considerados**, salvo autorización explícita de los encargados de práctica.
- Si tienen problemas técnicos con Git, envíen un correo **antes** de la fecha límite con evidencia (capturas de pantalla).

---

## 6. Lenguaje de programación

Para todas las preguntas que requieran código — replicación, simulación, gráficos y calibración —, **solo se acepta Python** en los siguientes formatos:

| Formato | Descripción |
|---------|-------------|
| `.ipynb` | Jupyter Notebook (recomendado) |
| `.py` | Script de Python |

El código debe ser **reproducible**: cualquier encargado de práctica debe poder ejecutarlo y obtener los mismos resultados. Para ello, incluyan al inicio de cada notebook la instalación de los paquetes necesarios:

```python
!pip install wbgapi statsmodels pandas matplotlib -q
```

---

## 7. Política de uso de Inteligencia Artificial

**El uso de IA está permitido**, bajo las siguientes condiciones.

### 7.1 Declaración de transparencia (obligatoria)

Cada grupo debe incluir un archivo `declaracion_IA.pdf` con el siguiente formato:

---

> **DECLARACIÓN DE USO DE INTELIGENCIA ARTIFICIAL**
>
> **Grupo:** XX
>
> **Integrantes:** [nombres]
>
> **Herramientas de IA utilizadas:**
>
> | Herramienta | Versión | Ítems en los que se usó |
> |-------------|---------|--------------------------|
> | ChatGPT | GPT-4o | (c), (f) |
> | Claude | Sonnet 4 | código ítem (38) |
> | GitHub Copilot | — | autocompletado general |
>
> **Prompts clave utilizados:**
>
> - Ítem (c): *"Explica por qué la cuenta corriente de China no es contracíclica a pesar de ser un país emergente."*
> - Ítem (38): *"Escribe una función en Python que descargue datos del Banco Mundial con wbgapi."*
>
> **Declaramos que:**
> 1. Las respuestas finales reflejan nuestra comprensión del material, no una copia literal de los resultados de IA.
> 2. Hemos verificado la exactitud de cualquier información proporcionada por IA.
> 3. El análisis económico y las interpretaciones son de nuestra autoría.

---

Si **no utilizaron IA**, igualmente incluyan el archivo con la declaración: *"No se utilizó ninguna herramienta de IA para esta entrega."*

### 7.2 ¿Qué está permitido y qué no?

| Permitido | No permitido |
|-----------|-------------|
| Usar IA para depurar errores de código | Copiar respuestas de IA sin comprenderlas |
| Pedir explicaciones de conceptos teóricos | Pegar el enunciado completo y entregar el resultado |
| Generar borradores de código que luego adaptan | Presentar texto generado por IA como propio sin editar |
| Buscar artículos y fuentes con IA | Inventar citas o datos que no verificaron |

**Criterio general:** La IA es una herramienta, no un sustituto. Si durante la sustentación no pueden explicar lo que entregaron, se asumirá que no es trabajo propio.

---

## 8. Política de colaboración entre grupos

**La cooperación entre grupos está permitida**, con las siguientes reglas:

- Pueden discutir enfoques, compartir consejos de código y resolver dudas entre grupos.
- **Las respuestas escritas no pueden ser idénticas.** Si dos grupos entregan textos sustancialmente iguales (verificado con herramientas de similitud), ambos recibirán penalización.
- El código puede ser similar — todos usan la misma función base —, pero la interpretación y la discusión deben ser propias.
- Si otro grupo los ayudó de forma significativa, **agradézcanlo en su `README.md`**.

---

## 9. Video de sustentación

- **Duración máxima:** 10 minutos.
- **Formato:** MP4. Si el archivo excede 100 MB, súbanlo a Google Drive o YouTube (no listado) y peguen el enlace en su `README.md`.
- **Estructura sugerida** (los tiempos son orientativos, no estrictos):

| Segmento | Contenido | Tiempo sugerido |
|----------|-----------|-----------------|
| Presentación | Integrantes del grupo y país asignado | 30 seg |
| Parte I | Ingreso permanente y matriz compañera: resultado que más les sorprendió | 1 min |
| Parte II | IRF más interesante: transitoria, permanente o anticipada | 2 min |
| Partes III y IV | Equilibrio mundial y *saving glut*: mecanismo central y resultado numérico | 2 min |
| Parte V — Bloque A | Regularidad empírica que más se desvía de la teoría y por qué | 2 min |
| Parte V — Bloque B | Calibración de su país: parámetro más difícil de ajustar | 1 min 30 seg |
| Cierre | Dónde falla el modelo y qué fricción añadirían | 1 min |

- No es necesario que hablen todos los integrantes, pero todos deben estar presentes en el video.

---

## 10. Sesión de preguntas y respuestas

Se programará una sesión de preguntas y respuestas con los encargados de práctica antes de la fecha de entrega. La fecha y hora se comunicarán por el canal oficial del curso.

**Ejemplos de dudas que pueden traer:**
- Interpretación de resultados empíricos o teóricos
- Problemas técnicos con el código o los datos
- Dudas sobre la calibración con la literatura

---

## 11. Lista de verificación antes de entregar

Antes de hacer su *push* final, verifiquen cada punto:

- [ ] La carpeta se llama `PS01_GrupoXX/` con el número correcto
- [ ] El PDF contiene las respuestas a **todos** los ítems de las Partes I–V
- [ ] El código está en Python (`.ipynb` o `.py`) y es reproducible
- [ ] Los gráficos están incluidos en el PDF, no solo en el notebook
- [ ] La tabla maestra de los ocho países está completa (Bloque A)
- [ ] La declaración de IA está incluida (aunque no hayan usado IA)
- [ ] El video está subido o el enlace figura en el `README.md`
- [ ] El `README.md` describe brevemente el contenido de cada archivo
- [ ] No hay archivos innecesarios (*checkpoints*, cachés, copias de seguridad)
- [ ] El Pull Request está creado con título y descripción correctos

---

## 12. Contacto

Para dudas sobre la entrega, contacten a los encargados de práctica por el canal oficial del curso.

Para problemas con Git, revisen la [guía oficial de GitHub](https://docs.github.com/en/get-started/quickstart) o consulten en la sesión de preguntas y respuestas.
