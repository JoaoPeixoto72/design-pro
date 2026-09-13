# Changelog

## v4.0.1 — 2026-09-13

Limpeza do que a transição para `design-pro` deixou por arrumar.

### Duplicados removidos
- `templates/`: `audit-report-template.md` e `review-report.md` eram byte-a-byte iguais ao `review-report.md.tmpl`, que é o único que o `SKILL.md` cita. Fica um. Sai também o `SKILL.md.tmpl`, que era o molde para escrever *uma* skill nova — não faz sentido num repo de skill única.
- `audit-workflow.yml` na raiz era cópia do `.github/workflows/audit.yml` a menos de um comentário. Fica o que o GitHub corre.

### Instaladores removidos
- Saem o `install.sh` e o `install.ps1`. O repositório é a skill: instalar é `git clone` para a pasta do agente que se quer, e atualizar é `git pull`. O README diz as três linhas.

### Referências mortas ao layout antigo
Depois de `core/` deixar de existir, ficaram apontadores para lá:
- `AGENTS.md` descrevia o repo inteiro pelo layout antigo — `core/ux-*/SKILL.md`, `ux-review` como router, teto de 5 skills. Reescrito para o hub.
- `agent/tool-strategy.md` e `agent/cross-skill-orchestration.md` citavam `ux-accessibility/references/wcag-2.2.md`, que nunca existiu neste repo → `references/accessibility.md`.
- `agent/agent-operating-model.md`, `agent/context-management.md`, `agent/visual-inspection.md`, `adapters/claude.md` e `templates/review-report.md.tmpl` falavam de «category skills» e de `core/`.

### CI reparada
- `.github/workflows/audit.yml` corria `bash core/skill-auditor/scripts/audit.sh core` — caminho que não existe desde que o `skill-auditor` saiu para repositório próprio. Passa a buscá-lo a `JoaoPeixoto72/skill-auditor` e a apontar ao `SKILL.md`, não à pasta: varrer o workspace apanhava também o `SKILL.md` do próprio linter.

### Outros
- `description` do `SKILL.md` passada a inglês, como o resto do conteúdo da skill. É o campo que decide a ativação a partir do que o utilizador escreve.
- Saem os `AUDIT-REPORT-*.md`: são relatórios de desenvolvimento sobre skills de outro repositório, não material que a skill use.

## v4.0.0 — 2026-09-13 (design-pro)

Transição da arquitetura multi-pasta para a arquitetura unificada **Hub & References** sob o nome **design-pro**.

### Arquitetura Unificada (Hub & References)
- **1 Única Skill no Menu**: `design-pro` consolida as 21 categorias num único ponto de entrada orquestrador.
- **21 Módulos em `references/`**: As 21 disciplinas de UX vivem como módulos de consulta sob demanda lidos via ferramentas de leitura (`Read` / `view_file`).
- **Zero Prompt Bloat**: Elimina 21 entradas no system prompt dos agentes.
- **Restauração Completa de Cross-References**: 93 referências cruzadas entre disciplinas restauradas e validadas com resolução relativa interna (`./*.md`).

### Conformidade & Segurança
- **Anti Prompt-Injection Statement**: Adicionado ao `SKILL.md` conforme §7 da POLICY.md (`skill-auditor`).
- **Alinhamento de Ferramentas**: Frontmatter declara `allowed-tools: Read, Glob, Grep` e `disallowed-tools: Edit, Write, MultiEdit, NotebookEdit` (read-only audit).
- **Validação de Templates**: Referência canónica para `templates/review-report.md.tmpl` (§4 da POLICY).

### Instalação Universal
- Suporte a instalação em 1 linha (`git clone`), cópia manual ou scripts `install.sh` / `install.ps1`.

## v3.1 — 2026-09-13

Aplica todos os fixes descobertos na segunda auditoria (`AUDIT-REPORT-skill-auditor-vs-skill-reviewer.md`).

### skill-auditor v4 híbrido

Substitui o `skill-auditor` v3 (61 linhas, 2 campos de frontmatter, sem policy) por um híbrido semântico + mecânico:

- **Frontmatter completo** — `name`, `description`, `argument-hint`, `model`, `effort`, `allowed-tools`, `disallowed-tools`.
- **`POLICY.md` externalizada** — 8 secções (§1–§8) fora do manifesto; o corpo do SKILL.md aponta para lá.
- **`references/model-profiles.md`** — profiles `opus5` / `sol5.6` / `gemini3.8` / `generic` + regra de resolução em 3 passos.
- **`references/finding-model.md`** — enums `Type` (Defect/Concern/Suggestion), `Severity` (Blocker/Major/Minor/Nit), `Confidence` (Observed/Inferred/Unknown), `Verdict` (5 valores decididos pela severity mais alta).
- **`references/example-report.md`** — formato canónico do relatório.
- **`references/anti-injection.md`** — statement obrigatório + heurísticas de detecção.
- **`references/fixtures/hostile-skill/`** — fixture para testar a detecção.
- **Flags `--depth` e `--model`** implementadas (`quick` / `standard` / `deep`).
- **Statement anti prompt-injection** no corpo do SKILL.md.

### Layout

- `scripts/audit.sh` movido da raiz do repo para dentro de `core/skill-auditor/scripts/audit.sh`. Instalação global (`~/.claude/skills/skill-auditor/`) agora leva o linter consigo.
- `install.sh` actualizado para incluir também `skill-auditor` (antes só linkava `ux-*`).
- `.github/workflows/audit.yml` + `audit-workflow.yml` apontam para o novo path.

### Frontmatter das ux-* skills

- Adicionado `allowed-tools: Read, Glob, Grep` em 21 ficheiros `core/ux-*/SKILL.md` que só tinham `name` + `description`.

### Compatibilidade

Breaking: quem invocava `bash scripts/audit.sh .` da raiz tem de passar a `bash core/skill-auditor/scripts/audit.sh core`. O CI hook já foi actualizado; instalações existentes que fizeram `git pull` sem re-instalar mantêm o antigo até correrem `./install.sh`.

## v3.0.0 — 2026-09-06

Release inicial da v3. Ver `AUDIT-REPORT-v3.0.0.md` para o self-audit e correcções aplicadas.
