# Reserva

Skills y agentes que no querés cargados en cada sesión, pero sí tener a mano.

Todo lo que está en `~/.claude/skills/` y `~/.claude/agents/` suma texto a cada conversación.
Lo que usás poco, movelo a `~/.claude/reserva/` (esta carpeta la crea el instalador).

Cuando lo necesites:

- Una vez: pedile a Claude "leé `~/.claude/reserva/<archivo>` y usalo para esto".
- Seguido: copialo de vuelta a `~/.claude/skills/` o `~/.claude/agents/`.
