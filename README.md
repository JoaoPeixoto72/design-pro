# design-pro

**Master UX & Design System Orchestrator for Agentic IDEs.** Procedural, multimodal, and verifiable Agent Skill built for Google Antigravity (Gemini 3.8 Flash), Claude Code (Opus 5 / Sonnet 5 / Fable 5), and Codex CLI (GPT-5.6 Sol / Terra / Luna).

Conforme a especificação aberta [Agent Skills](https://agentskills.io), o **design-pro** adota a arquitetura **Hub & References**: uma única skill orquestradora mestre (`SKILL.md`) que carrega sob demanda 21 módulos especializados de referência (`references/`), eliminando o desperdício de tokens no system prompt e garantindo instalação instantânea e atómica.

---

## Porque a Arquitetura Unificada?

Anteriormente, distribuir 21 pastas soltas causava três grandes problemas:
1. **Prompt Bloat**: 21 descrições no menu de ferramentas consumiam milhares de tokens em todas as mensagens.
2. **Hesitação de Roteamento**: O agente hesitava sobre qual mini-skill carregar ao auditar um ecrã ou fluxo complexo.
3. **Fricção de Instalação**: Exigia copiar 21 pastas separadas ou manter dezenas de symlinks frágeis no sistema.

Com a arquitetura unificada:
- **1 Única Pasta**: `.agents/skills/design-pro/`
- **1 Único Ponto de Entrada**: `SKILL.md` (Lead UX Designer & Router)
- **Carregamento Cirúrgico**: O agente consulta apenas o guia relevante em `references/` quando necessário.
- **Rede Canónica Preservada**: 93 referências cruzadas entre disciplinas preservadas e resolvidas de forma consistente.
- **Instalação Atómica**: 1 comando `git clone` ou script de instalação idempotente.

---

## Como Instalar

### Opção A: Linha de Comandos Direta (Recomendado)

**No Google Antigravity:**
```bash
git clone https://github.com/JoaoPeixoto72/design-pro.git .agents/skills/design-pro
```

**No Claude Code:**
```bash
git clone https://github.com/JoaoPeixoto72/design-pro.git .claude/skills/design-pro
```

**No Codex CLI / Cursor:**
```bash
git clone https://github.com/JoaoPeixoto72/design-pro.git .codex/skills/design-pro
```

### Opção B: Scripts de Instalação Automatizados

Se preferir instalar globalmente para todos os agentes ou associar via link simbólico:

**No Linux / macOS / WSL:**
```bash
# Instalação global para Claude Code, Antigravity e Codex
./install.sh

# Ou num projeto específico:
./install.sh --project /caminho/para/o/projeto
```

**No Windows (PowerShell):**
```powershell
# Instalação global
.\install.ps1

# Ou num projeto específico:
.\install.ps1 -Project "C:\caminho\para\o\projeto"
```

---

## Como Funciona

Quando ativado, o **`design-pro`** atua em dois modos:

### 1. Modo Cirúrgico (Surgical Review)
Ideal para tarefas específicas. O orquestrador identifica o domínio e lê apenas a referência necessária:
- *"Revê o fluxo de onboarding da app"* → consulta `references/help-onboarding.md` e `references/forms.md`.
- *"Valida o contraste e acessibilidade dos botões"* → consulta `references/accessibility.md` e `references/visual-design.md`.
- *"Como melhorar a gestão de erros na pesquisa?"* → consulta `references/error-handling.md` e `references/search.md`.

### 2. Modo de Auditoria Holística (Full Product UX Audit)
Ideal para avaliações completas de lançamento de produto (App Store / Google Play / Web Launch). O orquestrador audita os 6 pilares de UX:
1. **Arquitetura de Informação & Navegação**
2. **Acessibilidade & Hierarquia Visual**
3. **Interação, Formulários & Onboarding**
4. **Feedback de Sistema, Notificações & Resiliência Offline**
5. **Autenticação, Privacidade & Autonomia do Utilizador**
6. **Conteúdo, Microcópia & Tom de Voz**

---

## Os 21 Módulos de Referência

Todos os módulos residem em `references/` e são consultados pelo agente sob demanda:

| Módulo | Ficheiro | Foco Principal |
|---|---|---|
| **Acessibilidade** | `references/accessibility.md` | WCAG 2.2 AA, leitores de ecrã, contraste, touch targets (44pt). |
| **Onboarding** | `references/help-onboarding.md` | Time-to-value, compreensão em 10 segundos, primeiro valor. |
| **Formulários** | `references/forms.md` | Validação inline, autofill, estados de submissão, prevenção de erros. |
| **Design Visual** | `references/visual-design.md` | Grid 4/8pt, escala tipográfica, tokens, contraste escuro/claro. |
| **Erros & Feedback** | `references/error-handling.md` | Empty states, 404, recuperação construtiva, mensagens humanas. |
| **Rede & Offline** | `references/network.md` | Sincronização offline, feedback de degradação, UI otimista. |
| **Navegação** | `references/navigation.md` | Estrutura de menus, breadcrumbs, regra dos 3 toques, botão voltar. |
| **Arquitetura de Info** | `references/information-architecture.md` | Modelos mentais, redução de carga cognitiva, categorização. |
| **Autenticação & Contas** | `references/user-account.md` | Fluxos de registo/login sem atrito, perfil, eliminação de conta. |
| **Consentimento & Autonomia** | `references/consent-and-autonomy.md` | Sem dark patterns, cookies claros, GDPR, escada de confirmação. |
| **Notificações** | `references/notifications.md` | Respeito pelo utilizador, canais granulares, toasts e alertas. |
| **Agentes de IA** | `references/ai-agent.md` | Copilots, streaming, visibilidade de raciocínio, transparência. |
| **Automação IA** | `references/ai-automation.md` | Escada de autonomia, desfazer ações de IA, intervenção humana. |
| **Entrada Multimodal** | `references/multimodal-input.md` | Voz, câmara, leitor de código de barras, uploads de ficheiros. |
| **Pesquisa** | `references/search.md` | Velocidade, filtros, estados zero, tolerância a erros de digitação. |
| **Definições** | `references/settings.md` | Preferências, tema escuro/claro, idioma, limpeza de cache. |
| **Conteúdo & Microcópia** | `references/content.md` | Linguagem clara, CTAs orientados a ação, tom de voz consistente. |
| **Geral & Touch** | `references/general.md` | Ergonomia de polegar, áreas seguras, layout shifts (CLS). |
| **Revisão & Auditoria** | `references/review.md` | Protocolo mestre de auditoria, cálculo de severidades e matriz. |
| **Segurança & Privacidade** | `references/safety-privacy.md` | Proteção de dados sensíveis, sessões seguras, integridade. |
| **Utilitários** | `references/utility.md` | Helpers de medição, badges de confiança e micro-interações. |

---

## Estrutura do Repositório

```text
design-pro/
├── SKILL.md                 # Orquestrador mestre (Lead UX Designer & Routing Table)
├── README.md                # Documentação e guia de instalação
├── CHANGELOG.md             # Histórico de versões e alterações
├── AGENTS.md                # Modelo operacional multi-agente
├── LICENSE                  # Licença MIT
├── install.sh               # Script de instalação Bash
├── install.ps1              # Script de instalação PowerShell
├── audit-workflow.yml       # Especificação do workflow de auditoria
├── agent/                   # Modelos de operação, personas e heurísticas
├── adapters/                # Otimizações para Claude Code, Codex e Antigravity
├── templates/               # Modelos e schemas de relatórios de auditoria
└── references/              # Os 21 guias de referência especializados
```

---

## Licença

Distribuído sob a licença [MIT](LICENSE).
