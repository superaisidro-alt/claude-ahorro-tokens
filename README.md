# Ahorro de tokens para Claude Code

Lo que uso para no quedarme sin tokens en Claude Code. Dos skills, dos plantillas y una costumbre.

## Instalar

```sh
git clone <este repo>
cd claude-ahorro-tokens
```

- Windows: `powershell -ExecutionPolicy Bypass -File instalar.ps1`
- Mac / Linux: `sh instalar.sh`

Después, una sola vez:

1. Pegá `plantillas/CLAUDE.md` al final de `~/.claude/CLAUDE.md` (si no existe, crealo).
2. Sumá el bloque `env` de `plantillas/settings.json` a `~/.claude/settings.json`.
3. Reiniciá Claude Code.

## Qué trae

| Pieza | Qué hace |
|---|---|
| `skills/context-budget` | Mide cuánto contexto se comen tus skills, agentes, MCP y CLAUDE.md, y dice qué sacar. **Empezá por acá:** `/context-budget`. |
| `skills/ahorro-tokens` | Reglas que Claude aplica solo: modelo barato por default, respuestas cortas, leer lo justo. |
| `plantillas/CLAUDE.md` | Las mismas reglas, cargadas siempre (respuestas cortas desde el primer mensaje). |
| `plantillas/settings.json` | Los subagentes corren en `sonnet` en vez del modelo principal. |
| `reserva/` | Cómo guardar skills que usás poco sin que gasten contexto. |

## Lo que más ahorra, en orden

1. **`/clear` al cambiar de tema.** Cada mensaje paga todo el historial de la conversación.
2. **Sacar MCP que no usás.** Cada herramienta cuesta ~500 tokens en *todas* las sesiones. Un
   servidor de 30 herramientas pesa más que todas tus skills juntas.
3. **Modelo por tarea.** Opus para decidir, Sonnet para buscar, Haiku para ejecutar algo ya
   definido. Si la orden está bien escrita, alcanza con el barato.
4. **Respuestas cortas.** La salida es lo más caro por token.
5. **Skills en reserva.** Lo instalado y no usado también se paga.

Para ver dónde estás: `/context` (qué ocupa lugar) y `/usage` (cuánto gastaste).

## Créditos

`skills/context-budget` viene de [ECC](https://github.com/affaan-m/ECC), licencia MIT
(ver `skills/context-budget/LICENSE-ECC`). El resto, MIT.
