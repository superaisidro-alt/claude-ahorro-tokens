---
name: ahorro-tokens
description: Use when the user says they are running out of tokens, hitting usage limits, that sessions get expensive or slow, or before delegating work to a subagent. Picks the cheapest model that can do the job, keeps replies short, and avoids loading context that is not needed.
---

# Ahorro de tokens

Reglas para gastar menos sin trabajar peor. Aplicarlas en silencio; no explicarlas en cada respuesta.

## 1. El modelo barato es el default

Antes de mandar trabajo a un subagente, elegir el modelo a propósito.

- **Barato (`haiku`)**: la tarea ya está definida — pasos numerados, archivos señalados, qué
  probar y qué evidencia devolver. Eso es ejecución.
- **Medio (`sonnet`)**: buscar en el código, investigar, tareas con algo de criterio.
- **Caro (`opus`)**: falta decidir el diseño, hay arquitectura en juego, o un error sale caro
  (plata, datos, seguridad).
- Si el barato entrega mal, se reenvía al caro con lo que hizo. Al revés, nunca.

Una orden bien escrita es la señal de que alcanza con el barato.

## 2. Respuestas cortas

- Primero lo que hay que hacer, en una línea. El porqué, en otra, sólo si hace falta.
- Viñetas cortas. Sin repetir el pedido, sin resumir lo que ya se vio, sin cierres de cortesía.
- No pegar archivos enteros en la respuesta: citar `archivo:línea`.

## 3. Leer lo justo

- Buscar (`Grep`/`Glob`) antes de leer. Leer el rango de líneas que importa, no el archivo entero.
- No releer un archivo que se acaba de editar para "confirmar".
- Salidas largas de comandos: filtrar con `head`, `tail`, `grep` o `--quiet`.
- Exploraciones grandes (barrer muchos archivos): un subagente `Explore` barato, que devuelva
  sólo la conclusión.

## 4. Definir antes de construir

Preguntar lo que cambia el resultado, y nada más. En cuanto no quedan dudas, construir.
Las vueltas de ida y vuelta por cosas que no cambian el trabajo son las que más gastan.

## 5. Sesión limpia

- Tema nuevo → `/clear`. Arrastrar una conversación vieja paga todo el historial en cada mensaje.
- Sesión larga del mismo tema → `/compact` antes de que se llene.
- `/context` muestra qué está ocupando lugar; `/usage` muestra el consumo.

## 6. Cargar sólo lo que se usa

Cada skill, agente y servidor MCP instalado suma texto a **todas** las sesiones, se use o no.

- Lo que se usa poco va a una carpeta de reserva fuera de `~/.claude/skills` y `~/.claude/agents`.
  Cuando hace falta, se copia de vuelta o se lee y se le pasa a un subagente.
- Los MCP son lo más pesado (~500 tokens por herramienta). Desconectar los que no se usan y
  preferir la CLI cuando existe (`gh`, `git`, `npm`, `vercel`, `supabase`).
- Para medirlo: skill `context-budget`.
