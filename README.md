# startup-founder-ai-cofounder

Plugin de Claude Code que convierte el curso de startups de YC en la fuente de verdad del equipo.

## Qué incluye
- `DOCTRINE.md`: doctrina destilada + índice. Se inyecta en **cada sesión** (inicio, reanudar, limpiar, compactar) con un hook.
- Hook por mensaje: recordatorio de una línea para no perder la doctrina en conversaciones largas.
- `skills/`: `user-interviews`, `idea-and-pivot`, `metrics-review`, `sales-and-first-customers`, `pricing-business-model`, `fundraising`, `cofounder`, `ai-native-build`.
- `agents/yc-advisor.md`: opinión con citas en contexto aislado.
- `curriculum/`: las transcripciones, los `key takeaways` y `_digests/` (resúmenes de los archivos sin takeaways).

## Instalación (cada persona, una vez)
Necesitas acceso al repo (invitación en GitHub y credenciales git configuradas).

```
/plugin marketplace add KenzoDB/startup-founder-ai-cofounder
/plugin install yc-cofounder@startup-founder-ai-cofounder
```

Para que se active solo en el proyecto, copia `templates/project-settings.json` a `.claude/settings.json` del proyecto y pega `templates/CLAUDE.md.snippet` en su `CLAUDE.md`.

## Uso
- Trabaja normal: la doctrina ya está cargada. Claude cita el curso cuando toca.
- Tareas: pídelas con tus palabras (las skills se activan por descripción) o invócalas por nombre.
- Opinión: "pregúntale al yc-advisor si…".
- Para forzar consulta: "según el curso YC…".

## Actualizar
`/plugin marketplace update startup-founder-ai-cofounder`. Los cambios a doctrina y skills, por pull request.

## Mantener
- Material nuevo: añádelo a `curriculum/`, créale un `key takeaways` o un bloque en `_digests/` y una fila en el índice de `DOCTRINE.md`.
- `DOCTRINE.md` debe seguir corta (se paga en tokens en cada sesión).
