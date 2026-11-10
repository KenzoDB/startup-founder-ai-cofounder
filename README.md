# startup-founder-ai-cofounder

**Un "cofundador de IA" para nuestra startup.** Es un plugin de Claude Code que le da a Claude el conocimiento del curso de startups de Y Combinator (YC) y le obliga a usarlo como **fuente de verdad** cada vez que trabajamos: cómo elegir una idea, hablar con usuarios, vender, poner precio, medir, levantar dinero, elegir cofundador y trabajar con IA.

> Este README está escrito para **cualquier persona del equipo, aunque nunca haya usado Claude**. Si ya lo usas a diario, salta a [Uso diario](#5-uso-diario-qué-escribirle).

---

## Índice
1. [Qué es esto (en 2 minutos)](#1-qué-es-esto-en-2-minutos)
2. [Antes de empezar: lo que necesitas](#2-antes-de-empezar-lo-que-necesitas)
3. [Instalación paso a paso (Windows)](#3-instalación-paso-a-paso-windows)
4. [Tu primera conversación](#4-tu-primera-conversación)
5. [Uso diario: qué escribirle](#5-uso-diario-qué-escribirle)
6. [Las 8 skills y el asesor](#6-las-8-skills-y-el-asesor)
7. [Cómo escribir buenas peticiones](#7-cómo-escribir-buenas-peticiones)
8. [Permisos: qué te va a preguntar y qué responder](#8-permisos-qué-te-va-a-preguntar-y-qué-responder)
9. [Buenas prácticas y errores típicos](#9-buenas-prácticas-y-errores-típicos)
10. [Si algo falla](#10-si-algo-falla)
11. [Actualizar el plugin](#11-actualizar-el-plugin)
12. [Preguntas frecuentes](#12-preguntas-frecuentes)
13. [Para quien mantiene el repo](#13-para-quien-mantiene-el-repo)
14. [Glosario](#14-glosario)

---

## 1. Qué es esto (en 2 minutos)

**Claude Code** es una herramienta de Anthropic en la que conversas con Claude (una IA) y, además de responderte, puede **leer y escribir archivos de tu ordenador** y **ejecutar tareas**. La usamos en la carpeta del proyecto de la startup (`PsicologIA`), así que Claude puede ver nuestros documentos 01-10, el CRM, etc.

Por sí sola, Claude sabe de startups "en general". Este plugin le añade nuestro **conocimiento de referencia**: las transcripciones del curso de YC y un resumen de sus ideas clave. Con el plugin instalado, pasa esto:

| Sin el plugin | Con el plugin |
|---|---|
| Claude responde con consejos genéricos de internet. | Claude responde según el curso de YC y **dice de qué archivo lo saca**. |
| Si le preguntas por precios, improvisa. | Aplica reglas concretas del curso ("cobra más de lo que crees", "sin pruebas gratuitas en B2B"…). |
| Puede olvidar cómo pensar a mitad de una conversación larga. | Recibe un recordatorio automático en **cada mensaje**. |
| Si el curso no dice nada sobre un tema, lo inventa. | Está instruido para decirte **"el curso no cubre esto"**. |

### Qué incluye
- **Doctrina siempre activa:** un resumen de 13 principios YC (`DOCTRINE.md`) que Claude recibe automáticamente al empezar **cualquier** conversación.
- **8 skills:** "recetas" para tareas concretas (guion de entrevistas, plan de ventas, revisión de métricas…). Se activan solas cuando lo que pides encaja.
- **1 asesor (`yc-advisor`):** para pedir una **opinión con citas** sobre una decisión.
- **El curso completo** (`curriculum/`): transcripciones, resúmenes por charla ("key takeaways") y resúmenes extra (`_digests/`).

### Qué NO es
- No es un oráculo: **las decisiones son nuestras**. Claude aconseja con evidencia del curso; el equipo decide.
- No sustituye hablar con usuarios reales. De hecho, ¡el curso insiste en eso!
- No lo sabe todo: solo cubre lo que está en el curso. Si algo no está, debe decirlo.

---

## 2. Antes de empezar: lo que necesitas

1. **Un ordenador con Windows 11** (o macOS/Linux; esta guía es para Windows).
2. **Una cuenta de Claude con acceso a Claude Code.** Claude Code requiere un plan de pago de Claude (Pro, Max, Team o Enterprise) o una cuenta de la API de Anthropic con crédito. Pregunta a quien administre el equipo qué cuenta usar. *Nadie debe compartir su contraseña: cada persona entra con su propia cuenta.*
3. **Git para Windows** (https://git-scm.com/download/win). Claude Code lo necesita en Windows. Instálalo con las opciones por defecto.
4. **Node.js** (versión LTS, https://nodejs.org), **solo si** vas a instalar Claude Code con `npm` (ver paso 3.2). Si usas la aplicación de escritorio de Claude (ver 3.1), puedes saltártelo.
5. **La carpeta del proyecto `PsicologIA`** sincronizada en tu ordenador (por OneDrive). Dentro hay una carpeta oculta `.claude/` y un archivo `CLAUDE.md`: **no los borres ni los muevas**, son los que activan el plugin automáticamente.

> **Nota:** Las instrucciones de instalación de Claude Code cambian con el tiempo. Si algún paso no coincide con lo que ves, consulta la documentación oficial: https://docs.claude.com (busca "Claude Code") o pregunta en el chat del equipo.

---

## 3. Instalación paso a paso (Windows)

Hay dos formas de usar Claude Code. **Elige una** (la A es más fácil si nunca has usado una terminal).

### 3.1 Opción A (más fácil): aplicación de escritorio de Claude
1. Descarga la aplicación **Claude** desde https://claude.ai/download e instálala.
2. Ábrela e **inicia sesión** con tu cuenta.
3. Entra en la pestaña **Code** (o "Claude Code").
4. Elige como carpeta de trabajo la carpeta del proyecto: `…\Desktop\PsicologIA` (o donde la tengas sincronizada).
5. Ve directamente al [paso 3.3](#33-instalar-el-plugin-una-sola-vez).

### 3.2 Opción B: terminal (para quien se maneje)
1. Abre **PowerShell** (tecla Windows, escribe `PowerShell`, Enter).
2. Instala Claude Code (necesitas Node.js y Git ya instalados):
   ```
   npm install -g @anthropic-ai/claude-code
   ```
3. Comprueba que funciona:
   ```
   claude --version
   ```
   Debe mostrar un número de versión. Si dice "no se reconoce el comando", cierra y vuelve a abrir PowerShell; si sigue igual, revisa la sección [Si algo falla](#10-si-algo-falla).
4. Ve a la carpeta del proyecto (ajusta la ruta a la tuya):
   ```
   cd "$HOME\OneDrive\Desktop\PsicologIA"
   ```
5. Arranca Claude Code:
   ```
   claude
   ```
   La primera vez te pedirá **iniciar sesión** (se abre el navegador). Después verás un cuadro de texto donde escribir. Si pregunta si **confías en esta carpeta**, responde que sí (es la nuestra).

### 3.3 Instalar el plugin (una sola vez)
Hay que decirle a Claude Code de dónde descargar el plugin y activarlo.

**Forma 1: desde dentro de Claude Code.** Con Claude Code abierto en la carpeta del proyecto, escribe estas dos líneas (una por una, pulsando Enter tras cada una):
```
/plugin marketplace add KenzoDB/startup-founder-ai-cofounder
```
```
/plugin install yc-cofounder@startup-founder-ai-cofounder
```
Si te pregunta dónde instalarlo ("scope"), elige **user** (para ti en todos tus proyectos) o **project** (solo este proyecto); cualquiera funciona.

**Forma 2: desde PowerShell** (sin abrir Claude Code):
```
claude plugin marketplace add KenzoDB/startup-founder-ai-cofounder
```
```
claude plugin install yc-cofounder@startup-founder-ai-cofounder
```

> **Si da error al descargar:** prueba con la dirección completa:
> ```
> claude plugin marketplace add https://github.com/KenzoDB/startup-founder-ai-cofounder.git
> ```

> **Nota sobre la carpeta del proyecto:** como `PsicologIA` ya trae un archivo `.claude/settings.json` que habilita el plugin, **es posible que Claude Code te proponga instalarlo él solo** al abrir la carpeta por primera vez. Si lo hace, acepta. Si no, haz la instalación manual de arriba.

### 3.4 Comprobar que está instalado
En PowerShell:
```
claude plugin list
```
Debes ver una entrada **`yc-cofounder@startup-founder-ai-cofounder`** con estado **enabled** (activado).

Otra comprobación, ya dentro de Claude Code (**reinicia Claude Code antes** si lo tenías abierto durante la instalación):
```
/plugin
```
Verás la lista de plugins instalados.

---

## 4. Tu primera conversación

### 4.1 Cómo empezar
1. Abre Claude Code **en la carpeta `PsicologIA`** (en la app de escritorio, eligiéndola como carpeta de trabajo; en terminal, con `cd` + `claude`). Importante: si lo abres en otra carpeta, no tendrá nuestros documentos ni la configuración del proyecto.
2. Verás un cuadro de texto abajo. **Escribes en español, con tus palabras, como a un compañero.** Pulsa **Enter** para enviar.
3. Mientras trabaja verás mensajes tipo "leyendo archivo…", "buscando…". Es normal. Espera a que termine.

### 4.2 Prueba de humo (30 segundos)
Pega esto y pulsa Enter:

> ¿Tienes cargada la doctrina YC? Dime en 5 líneas qué principios aplicas al trabajar con nosotros.

**Respuesta correcta:** debe listar principios como "habla con usuarios antes de construir", "cosas que no escalan", "cobra más de lo que crees", "pocas métricas", etc.
**Si dice que no sabe de qué hablas:** el plugin no está activo. Ve a [Si algo falla](#10-si-algo-falla).

### 4.3 Segunda prueba: que consulte el curso
> Quiero preparar las entrevistas con psicólogos. ¿Qué dice el curso sobre qué preguntar y qué evitar?

**Respuesta correcta:** debería nombrar archivos del curso (por ejemplo *How to talk to users*) y darte las preguntas recomendadas y las que hay que evitar.

---

## 5. Uso diario: qué escribirle

**La regla de oro:** habla normal. El plugin ya está "siempre activo": no tienes que escribir ningún comando especial. Estos son ejemplos reales, listos para copiar y adaptar.

### 5.1 Hablar con usuarios / validar
- *"Prepárame el guion de entrevista para psicólogos sobre cómo gestionan hoy sus citas."*
- *"Aquí tengo las notas de 3 entrevistas [pega o indica el archivo]. Agrúpalas en problemas y dime cuál es el más importante."*
- *"Revisa mi cuestionario `03-cuestionario-jovenes.md`: ¿hay preguntas que el curso desaconseja?"*

### 5.2 Idea, pivote, decisiones grandes
- *"Puntúa nuestra idea según los 4 factores del curso y dime si seguimos, profundizamos o pivotamos."*
- *"Pregúntale al yc-advisor si deberíamos pivotar de psicólogos independientes a clínicas."*
- *"Dame una segunda opinión sobre esta decisión: [descríbela en 3-4 líneas]."*

### 5.3 Ventas y primeros clientes
- *"Diseña un plan de ventas outbound de 4 semanas para conseguir los 5 primeros clientes, con el embudo numérico."*
- *"Escribe un email frío para una universidad siguiendo las reglas del curso."*
- *"Prepárame la llamada con [institución]: objeciones, preguntas y siguiente paso."*

### 5.4 Precios y modelo de negocio
- *"¿Cuánto deberíamos cobrar? Tenemos miedo de cobrar demasiado."*
- *"Compara qué modelo de negocio nos conviene: suscripción, por alumno atendido, etc."*

### 5.5 Métricas
- *"Estos son nuestros números del mes [pégalos]. ¿Qué dicen y qué hacemos?"*
- *"Define las 4-5 métricas que deberíamos medir ahora, antes de lanzar."*

### 5.6 Dinero y equipo
- *"¿Deberíamos levantar una ronda ya? ¿Qué pide el curso antes de hablar con inversores?"*
- *"Tenemos desacuerdo sobre quién es CEO. Ayúdame a preparar la conversación."*

### 5.7 Trabajar con IA
- *"¿Cómo organizamos un flujo de trabajo con IA para construir la plataforma?"*

### 5.8 Tareas cotidianas (también funciona, pero sin molestar)
Para tareas pequeñas ("corrige este typo", "redacta un email de agradecimiento") Claude **no consulta el curso**: no hace falta y ahorra tiempo y dinero. Si en ese caso *sí* quieres que lo use, díselo: *"…según el curso YC"*.

---

## 6. Las 8 skills y el asesor

Una **skill** es una "receta" que Claude sigue cuando lo que pides encaja. **No tienes que invocarlas**: se activan solas por lo que escribes. Si quieres forzar una, nómbrala (por ejemplo: *"Usa la skill pricing-business-model para…"*).

| Skill | Se activa cuando hablas de… | Qué te da |
|---|---|---|
| `user-interviews` | entrevistas, cuestionarios, validar un problema | Guion con las preguntas del curso, qué evitar, dónde encontrar entrevistados, análisis de notas |
| `idea-and-pivot` | evaluar la idea, pivotar, "¿seguimos?" | Puntuación en 4 factores, señales de pivote, recomendación justificada |
| `sales-and-first-customers` | vender, primeros clientes, emails fríos, pilotos | Plan de embudo con cifras, emails, checklist de piloto |
| `pricing-business-model` | precios, modelo de negocio, retención | Recomendación de precio/modelo y un experimento para validarla |
| `metrics-review` | métricas, KPIs, runway, retención | Qué medir, cómo leer los números, 2-3 acciones prioritarias |
| `fundraising` | inversores, rondas, SAFE, pitch | Plan de ronda o crítica del pitch |
| `cofounder` | cofundadores, equity, CEO, conflictos | Checklist y guía para conversaciones difíciles |
| `ai-native-build` | cómo trabajar con IA, agentes, desarrollo | Flujo de trabajo con IA aplicado a nuestro caso |

### El asesor `yc-advisor`
Es como **pedir una segunda opinión a un mentor que solo ha leído el curso**. Se usa para decisiones, no para tareas. Trabaja aparte (no llena tu conversación) y te devuelve siempre:
1. **Recomendación** (una frase).
2. **Por qué** (con el archivo de origen entre corchetes).
3. **Tensiones** (si dos charlas del curso se contradicen).
4. **Lagunas** (qué no cubre el curso o qué datos faltan).
5. **Siguiente acción** concreta y barata.

**Cómo invocarlo:** *"Pregúntale al yc-advisor si…"* o *"Dame la opinión del asesor YC sobre…"*.

---

## 7. Cómo escribir buenas peticiones

Claude es tan bueno como el contexto que le das. Receta de 4 ingredientes:

1. **Qué quieres** ("un guion de entrevista", "una opinión", "un plan").
2. **Contexto** (quién es el cliente, qué hemos hecho ya, qué números tenemos). Puedes decir *"mira el documento 02"*: puede leerlo.
3. **Restricciones** (tiempo, presupuesto, tono, longitud: *"en máximo una página"*).
4. **Formato** (tabla, lista, email listo para copiar…).

| ❌ Vago | ✅ Mejor |
|---|---|
| "Ayúdame con las ventas" | "Plan de ventas de 4 semanas para conseguir 5 universidades como clientes. Tenemos una lista semilla en `08-lista-semilla-crm.csv`. Quiero el embudo con cifras en una tabla." |
| "¿Qué opinas del precio?" | "Queremos cobrar a instituciones. ¿Cuánto y cómo? Dime también un experimento para validarlo esta semana." |

### Trucos que funcionan
- **Pide que cite:** *"Cita los archivos del curso que uses."* (por defecto lo hace, pero recuérdalo si no).
- **Pide la versión corta primero:** *"Resumen en 5 líneas y luego, si quiero, el detalle."* Ahorra lectura y coste.
- **Corrige sin miedo:** *"No, eso no. Nuestro cliente son instituciones, no psicólogos."* Claude se adapta.
- **Si la respuesta es larga o rara,** pregunta: *"¿En qué parte del curso te basas para decir eso?"* Te dirá el archivo y puedes comprobarlo.
- **Una cosa por mensaje** funciona mejor que cinco mezcladas.
- **Empieza una conversación nueva** cuando cambies de tema (comandos: ver sección siguiente).

### Comandos útiles dentro de Claude Code
Se escriben en el cuadro de texto, empezando por `/`:

| Comando | Para qué sirve |
|---|---|
| `/help` | Ver ayuda y comandos disponibles |
| `/clear` | Empezar una conversación nueva (la doctrina se vuelve a cargar sola) |
| `/plugin` | Ver/gestionar los plugins instalados |
| `/exit` (o Ctrl+C dos veces) | Salir |

---

## 8. Permisos: qué te va a preguntar y qué responder

Claude Code **te pregunta antes de hacer cosas que cambian algo** (escribir un archivo, ejecutar un comando). Es una protección. Reglas simples:

| Te pregunta… | Respuesta recomendada |
|---|---|
| **Leer** archivos del proyecto o del curso | Permitir (es seguro). |
| **Crear o editar** un documento (por ejemplo, un plan nuevo) | Mira el nombre del archivo: si es lo que pediste, permitir. Si va a **modificar un documento existente del equipo** (01-10, CRM…), asegúrate de que es lo que querías. |
| **Ejecutar un comando** que no entiendes | Pulsa denegar y pregunta *"¿qué hace este comando y por qué lo necesitas?"* |
| Algo que menciona **borrar, enviar o publicar** | Denegar salvo que lo hayas pedido explícitamente. |

**Consejo:** si no quieres que toque archivos, dilo al empezar: *"Solo respóndeme en el chat, no modifiques ningún archivo."*
Si por error se modifica un archivo, **OneDrive guarda el historial de versiones**: clic derecho en el archivo → *Historial de versiones* para recuperar la anterior.

**Privacidad:** no pegues datos personales sensibles de pacientes ni contraseñas en la conversación. Para documentos del equipo con datos de entrevistados, usa iniciales o códigos.

---

## 9. Buenas prácticas y errores típicos

**Haz:**
- Verifica lo importante. Claude puede equivocarse o resumir mal: si va a influir en una decisión, abre el archivo citado.
- Dale los datos reales (números, notas de entrevistas). Sin datos, solo puede dar consejos generales.
- Usa el asesor para decisiones grandes, y las skills para tareas.
- Guarda lo valioso: pídele *"guarda esto como `11-plan-ventas.md` en la carpeta del proyecto"* y revisa antes de aprobar.

**Evita:**
- ❌ Tratarlo como autoridad absoluta: es el curso de YC, no la verdad universal; hay tensiones entre charlas y a veces no aplican a nuestro caso (p. ej., salud mental es sector de alto riesgo).
- ❌ Dejar que "invente" cifras. Si no tiene datos, debe decirlo; si ves números sospechosos, pregunta de dónde salen.
- ❌ Pegar documentos enormes sin necesidad: indica el nombre del archivo y que lo lea.
- ❌ Abrir Claude Code fuera de la carpeta del proyecto y esperar que conozca nuestro contexto.
- ❌ Editar a mano `.claude/`, `CLAUDE.md` o este repo sin avisar al equipo.

**Sobre el coste:** cada conversación consume cuota/crédito de la cuenta. Las tareas pequeñas cuestan poco; una consulta compleja con varias lecturas del curso, bastante más. Para ahorrar: sé concreto, no repitas el mismo contexto, y empieza conversaciones nuevas al cambiar de tema.

---

## 10. Si algo falla

| Síntoma | Qué hacer |
|---|---|
| `claude` "no se reconoce como comando" | Cierra y abre PowerShell. Si sigue: reinstala Node.js (LTS) y repite `npm install -g @anthropic-ai/claude-code`. |
| Claude responde "no tengo cargada la doctrina YC" | 1) `claude plugin list` y comprueba que `yc-cofounder` está *enabled*. 2) Cierra Claude Code y ábrelo de nuevo **en la carpeta `PsicologIA`**. 3) Si no aparece en la lista, repite el [paso 3.3](#33-instalar-el-plugin-una-sola-vez). |
| `marketplace add` da error de conexión/permiso | Usa la URL completa: `claude plugin marketplace add https://github.com/KenzoDB/startup-founder-ai-cofounder.git`. Comprueba tu conexión. |
| Aparece pero no cita archivos del curso | Pídelo: *"Según el curso YC, y citando los archivos…"*. Si la tarea es muy pequeña, es normal que no lo consulte. |
| Responde en inglés | Escribe *"Responde en español."* |
| Respuesta lenta | Es normal si está leyendo varios archivos. Espera a que termine. |
| Pide permisos y no sé qué contestar | Lee la sección [8](#8-permisos-qué-te-va-a-preguntar-y-qué-responder). Ante la duda, deniega y pregunta. |
| Cambió un documento que no debía | Recupera la versión anterior con el historial de OneDrive (clic derecho → *Historial de versiones*). |
| Nada de lo anterior funciona | Avisa en el chat del equipo con una captura del error. |

---

## 11. Actualizar el plugin

Cuando el equipo mejore la doctrina o las skills, recibirás la nueva versión así:
```
claude plugin marketplace update startup-founder-ai-cofounder
```
```
claude plugin update yc-cofounder@startup-founder-ai-cofounder
```
Después, **reinicia Claude Code** para aplicar los cambios. Para ver qué versión tienes: `claude plugin list`.

---

## 12. Preguntas frecuentes

**¿Tengo que escribir algo especial para que use el curso?**
No. Está siempre activo. Solo si quieres forzarlo: *"según el curso YC"* o *"pregúntale al yc-advisor"*.

**¿Puede Claude cambiar nuestros documentos sin que yo lo sepa?**
No: te pide permiso antes de escribir. Además OneDrive guarda versiones anteriores.

**¿Ve nuestros documentos?**
Sí, los de la carpeta en la que abres Claude Code (nuestro proyecto). Por eso conviene abrirlo siempre ahí.

**¿Puedo usarlo en otro proyecto?**
Sí: el plugin sirve en cualquier carpeta si lo instalaste en alcance *user*. Pero la configuración automática (CLAUDE.md, settings) solo viene con `PsicologIA`.

**¿Qué pasa si el curso dice una cosa y yo creo otra?**
Perfecto: dilo. *"No estoy de acuerdo porque…, ¿qué dice el curso al respecto?"* El objetivo es pensar mejor, no obedecer. Las decisiones son del equipo.

**¿Qué hago si dos charlas del curso se contradicen?**
Claude debe señalarlo ("tensiones"). Ejemplo: lanzar pronto (lean startup) frente a arrancar más ambicioso (Collison). Decidid según vuestro contexto.

**¿El repo es público? ¿Hay algún problema?**
Sí, el repo es público y contiene transcripciones de un curso de terceros. Es una decisión consciente del equipo; si algún día cambia, se avisará aquí.

**No sé escribir bien prompts. ¿Algún atajo?**
Copia los ejemplos de la sección 5 y cambia los datos. O dile a Claude: *"Voy a pedirte [objetivo]. Hazme las preguntas que necesites antes de empezar."*

---

## 13. Para quien mantiene el repo

Estructura:
```
startup-founder-ai-cofounder/
├── .claude-plugin/          plugin.json (versión) y marketplace.json
├── DOCTRINE.md              doctrina + índice (se inyecta en cada sesión; mantenla corta)
├── hooks/hooks.json         SessionStart + UserPromptSubmit
├── scripts/                 session-context.sh, prompt-reminder.sh
├── skills/                  8 skills (una carpeta cada una, con SKILL.md)
├── agents/yc-advisor.md     asesor con citas
├── curriculum/              transcripciones, "key takeaways" y _digests/
└── templates/               settings y snippet de CLAUDE.md para otros proyectos
```

Reglas:
- Español; toda afirmación de doctrina debe poder rastrearse a un archivo de `curriculum/`.
- Las skills apuntan a archivos, no copian transcripciones.
- Material nuevo del curso: añádelo a `curriculum/`, crea su `key takeaways` o un bloque en `_digests/` y una fila en el índice de `DOCTRINE.md`.
- **Tras cambiar algo, sube la versión en `.claude-plugin/plugin.json`** (por ejemplo 1.0.1 → 1.0.2) y haz `push`; si no, `claude plugin update` dirá que ya está en la última versión.
- Cambios a doctrina y skills, por pull request.
- Para activarlo en otro proyecto: copia `templates/project-settings.json` a `.claude/settings.json` y pega `templates/CLAUDE.md.snippet` en su `CLAUDE.md`.

---

## 14. Glosario

| Término | Qué significa |
|---|---|
| **Claude** | La IA de Anthropic con la que conversas. |
| **Claude Code** | La herramienta (app o terminal) que permite a Claude trabajar con archivos y tareas de tu ordenador. |
| **Plugin** | Un "paquete de extensión" que añade capacidades a Claude Code. Este es `yc-cofounder`. |
| **Marketplace** | Un repositorio desde el que se descargan plugins. El nuestro es este repo. |
| **Skill** | Una receta guardada para un tipo de tarea; Claude la usa solo cuando encaja. |
| **Subagente / asesor** | Un "ayudante" de Claude que trabaja aparte y devuelve solo el resultado (`yc-advisor`). |
| **Hook** | Un pequeño automatismo que ocurre solo (aquí: cargar la doctrina al empezar y recordarla en cada mensaje). |
| **Doctrina** | Resumen de los principios del curso de YC que Claude aplica siempre. |
| **Key takeaways** | Resumen corto de cada charla del curso; se consulta antes que la transcripción larga. |
| **Prompt** | Lo que le escribes a Claude. |
| **Terminal / PowerShell** | Ventana de texto para escribir comandos. |
| **Repo (repositorio)** | Carpeta de código/archivos versionada en GitHub. |
| **YC (Y Combinator)** | La aceleradora de startups cuyo curso usamos como fuente. |
| **Product-market fit** | Que hay un grupo de clientes que de verdad quiere y paga por el producto. |
| **SAFE** | Contrato simple para recibir inversión sin fijar aún las acciones. |
| **Runway / burn** | Cuántos meses de caja quedan / cuánto se gasta al mes. |
| **Churn / retención** | Clientes que se van / clientes que se quedan. |
