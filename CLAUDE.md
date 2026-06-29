# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

CapivaraJumper is a GameMaker Studio 2 (v2026.0.0.16) platformer/jumper game featuring a capivara (capybara). The game targets a portrait mobile resolution (180x320 internal, scaled to 540x960 viewport). Export targets include Windows, Opera GX, and Reddit.

## Building and Running

This is a GameMaker Studio 2 project — open `CapivaraJumper.yyp` in the GameMaker IDE to build and run. There is no command-line build system. All code editing can be done directly on `.gml` files; the IDE picks up changes automatically.

Game speed: 60 FPS.

## Architecture

### Room Flow

```
rm_menu → rm_jogo (gameplay)
rm_menu → rm_record (high score screen) → rm_menu
```

`rm_jogo` is listed first in `RoomOrderNodes` so it is the first room loaded, but `rm_menu` is the actual entry point placed in the room after `rm_jogo` in the order — confirm in the IDE.

### Global State (`scripts/scr_globais/scr_globais.gml`)

Two global variables used across rooms:
- `global.pontos` — current session score
- `global.record` — all-time high score (default: 100)

### Player (`obj_player_capivara`)

Uses a **function-pointer state machine**: `estado` holds a function reference and `Step_0.gml` simply calls `estado()` each frame. Currently only `estadoCaindo` (falling state) is defined. New states should follow the same pattern — define a function and assign it to `estado`.

### UI Button Pattern ("Placas")

All interactive menu buttons share the same structure:
- `Create`: initializes `mouseSobre = 0`, `mouseClick = 0`, `escala_textoX/Y = 1`
- `Mouse_10` (Enter): sets `mouseSobre = 1` and scales text to 1.1
- `Mouse_11` (Leave): resets `mouseSobre = 0` and scale to 1
- `Step`: `if (mouseSobre && mouseClick) { room_goto(...) }`
- `Draw`: `draw_self()` + draw text with `draw_text_transformed` or `draw_text_ext`

Objects using this pattern: `obj_placa_menu` (→ rm_jogo), `obj_placa_record` (→ rm_record), `obj_placa_mostrar_record` (→ rm_jogo), `obj_placa_voltar` (→ rm_menu).

### Platforms

`obj_plataforma_tronco` is the only collidable platform object. Three platform sprites exist (`spr_plataforma_tronco`, `spr_plataforma_folha`, `spr_plataforma_movel`) — movel (moving) and folha (leaf) variants are not yet implemented as objects.

## Naming Conventions

All identifiers use Portuguese. Standard GameMaker prefixes apply:
- `obj_` — objects
- `spr_` — sprites
- `rm_` — rooms
- `scr_` — scripts
- `fnt_` — fonts

# Convenções de Projeto (GameMaker)

> Cole este bloco no final do `CLAUDE.md` de cada projeto GameMaker.
> Ajuste o que precisar — isso é um ponto de partida, não regra fixa.

## Organização de pastas (IDE)

Cores das pastas no Asset Browser:

| Pasta              | Cor              |
|---------------------|------------------|
| `rooms`             | Azul bem clarinho |
| `objetos`           | Azul bem clarinho |
| `sprites`           | Azul bem clarinho |
| `scripts`           | Verde clarinho     |

> Nota: a cor de pasta no GameMaker é salva no arquivo `.yy` da pasta
> (propriedade `colour`/`color`). Claude Code pode tentar editar esse valor
> diretamente, mas **confirme visualmente na IDE depois**, já que o editor
> pode sobrescrever ao salvar manualmente.

## Organização dos arquivos de script

- **Um único arquivo** para todas as variáveis globais e constantes
  (ex: `scr_globals` ou `scr_constantes`)
- **Funções customizadas** ficam em arquivo(s) separado(s), claramente
  identificados (ex: `scr_functions`, `scr_player_functions`)
- Nunca misturar declaração de globals/constants com lógica de funções
  no mesmo arquivo

## Convenção de nomenclatura

| Tipo                          | Padrão       | Exemplo                              |
|--------------------------------|--------------|---------------------------------------|
| Funções                        | `snake_case` | `calcular_dano_final()`               |
| Variáveis (instância/global)   | `camelCase`  | `velocidadeHorizontalMaxima`          |
| Variáveis locais               | `camelCase` com prefixo `var _` | `var _nomeCompleto;` |

**Regra de oro: nunca abreviar.** Nome completo e descritivo sempre, mesmo
que fique longo. `velocidadeHorizontalMaxima` é melhor que `velHMax`.

## Prefixos de assets

| Tipo       | Prefixo  |
|------------|----------|
| Sprites    | `spr_`   |
| Objetos    | `obj_`   |
| Fonts      | `fnt_`   |
| Rooms      | `rm_`    |
| Sounds     | `snd_`   |
| Scripts    | `scr_`   |
| Sequences  | `seq_`   |

> Esses assets normalmente são criados/nomeados na IDE do GameMaker
> diretamente por você — avise o Claude Code que pode sugerir nomes
> seguindo o padrão, mas a criação do asset em si é manual.

## Idioma (sugestão)

- **Inglês** para termos técnicos/genéricos que já fazem parte do
  vocabulário padrão de game dev e do próprio GameMaker:
  `speed`, `state`, `timer`, `position`, `input`, `max`, `min`, etc.
- **Português** para termos específicos do conteúdo/mundo do jogo:
  `pontos`, `capivara`, `plataforma`, `fase`, etc.
- Critério simples: "isso já tem nome pronto em inglês no game dev?"
  → inglês. "Isso é específico da história/mundo do meu jogo?" → português.
- Consistência dentro do mesmo contexto é mais importante que a regra
  perfeita — ajuste caso a caso.
