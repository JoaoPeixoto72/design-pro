# design-pro

**Master UX & Design System Orchestrator for Agentic IDEs.** Procedural, multimodal, and verifiable Agent Skill built for Google Antigravity (Gemini 3.8 Flash), Claude Code (Opus 5 / Sonnet 5 / Fable 5), and Codex CLI (GPT-5.6 Sol / Terra / Luna).

Conforme a especificação aberta [Agent Skills](https://agentskills.io), o **design-pro** adota a arquitetura **Hub & References**: uma única skill orquestradora mestre (`SKILL.md`) que carrega sob demanda 21 módulos especializados de referência (`references/`), eliminando o desperdício de tokens no system prompt e garantindo instalação instantânea e atómica.

---

## Porque a Arquitetura Unificada?

Distribuir 21 pastas soltas custava duas coisas:

1. **Fricção de instalação.** Copiar 21 pastas, ou manter 21 symlinks. Renomear uma disciplina obrigava a reinstalar. Hoje é um `git clone`, e um `git pull` actualiza.
2. **Encaminhamento por concurso.** Com 21 skills, quem decide qual carregar são 21 `description` a competir pelo mesmo pedido, cada uma escrita sem ver as outras. Uma tabela única, onde as 21 alternativas estão lado a lado, decide com o contexto todo à vista — e diz explicitamente qual é o guia secundário.

E o que ganha: **1 pasta**, **1 ponto de entrada**, carregamento a pedido de 1–2 guias, e as **93 referências cruzadas** entre disciplinas intactas.

### O que esta arquitetura NÃO poupa

Tokens. Vale a pena dizê-lo, porque é fácil assumir o contrário.

| | parado | uma revisão com 2 guias |
|---|---|---|
| Skill única (esta) | ~90 tokens | ~90 + ~2500 (`SKILL.md`) + ~1700 (2 guias) = **~4300** |
| 21 skills soltas | ~1300 tokens | ~1300 + ~1700 = **~3000** |

Com 21 skills, as `description` **são** o router: o agente encaminha a partir do que o harness já lhe mostra, sem ler nada. Aqui, o `SKILL.md` tem de ser carregado inteiro antes de se saber que guia interessa. Um router que se lê é estruturalmente mais caro do que descrições que já estão à vista.

Ou seja: poupa enquanto não se usa, e gasta mais assim que se usa. A troca aceita-se pelos dois pontos acima, não por contagem de tokens. *(Estimativas por caracteres, não por tokenizador — a ordem de grandeza aguenta-se, os valores exactos não.)*

---

## Como Instalar

Não há script de instalação, e não é preciso: com a arquitetura unificada o
repositório **é** a skill. Instalar é cloná-lo para a pasta que o agente lê, e
atualizar é um `git pull` lá dentro. Escolha só o agente que quer.

**No Claude Code:**
```bash
git clone https://github.com/JoaoPeixoto72/design-pro.git .claude/skills/design-pro
```

**No Google Antigravity:**
```bash
git clone https://github.com/JoaoPeixoto72/design-pro.git .agents/skills/design-pro
```

**No Codex CLI / Cursor:**
```bash
git clone https://github.com/JoaoPeixoto72/design-pro.git .codex/skills/design-pro
```

Para instalar globalmente em vez de num projeto, troque o caminho pelo do seu
diretório pessoal — `~/.claude/skills/design-pro`, `~/.gemini/config/skills/design-pro`
ou `~/.codex/skills/design-pro`.

---

## Como Funciona

Quando ativado, o **`design-pro`** atua em dois modos:

### 1. Modo Cirúrgico (Surgical Review)
Ideal para tarefas específicas. O orquestrador identifica o domínio e lê apenas a referência necessária:
- *"Revê o fluxo de onboarding da app"* → consulta `references/help-onboarding.md` e `references/forms.md`.
- *"Valida o contraste e acessibilidade dos botões"* → consulta `references/accessibility.md` e `references/visual-design.md`.
- *"Como melhorar a gestão de erros na pesquisa?"* → consulta `references/error-handling.md` e `references/search.md`.

### 2. Modo de Auditoria Holística (Full Product UX Audit)
Ideal para avaliações completas de lançamento de produto (App Store / Google Play / Web Launch). O orquestrador audita os 7 pilares de UX:
1. **Arquitetura de Informação & Navegação**
2. **Acessibilidade & Hierarquia Visual**
3. **Interação, Formulários & Onboarding**
4. **Feedback de Sistema, Notificações & Resiliência Offline**
5. **Autenticação, Privacidade & Autonomia do Utilizador**
6. **Conteúdo, Microcópia & Tom de Voz**
7. **Fundamentos da App & Prontidão para a Loja**

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
| **Consentimento & Autonomia** | `references/consent-and-autonomy.md` | Consentimento para ações que o agente toma por nós: pré-visualização, escada de confirmação, undo, escopos revogáveis. |
| **Notificações** | `references/notifications.md` | Respeito pelo utilizador, canais granulares, toasts e alertas. |
| **Agentes de IA** | `references/ai-agent.md` | Produtos em que a IA **é** a superfície: planeia, age e reporta. Confiança, autonomia, reversibilidade. |
| **Automação IA** | `references/ai-automation.md` | Funcionalidades de IA dentro de um produto normal: botão resumir, recomendações, filtro inteligente. |
| **Entrada Multimodal** | `references/multimodal-input.md` | Voz, câmara, leitor de código de barras, uploads de ficheiros. |
| **Pesquisa** | `references/search.md` | Velocidade, filtros, estados zero, tolerância a erros de digitação. |
| **Definições** | `references/settings.md` | Preferências, tema escuro/claro, idioma, limpeza de cache. |
| **Conteúdo & Microcópia** | `references/content.md` | Linguagem clara, CTAs orientados a ação, tom de voz consistente. |
| **Fundamentos & Loja** | `references/general.md` | Ícone, splash, atualização forçada, sync na nuvem, backup, widgets, versionamento. |
| **Revisão & Auditoria** | `references/review.md` | Protocolo de revisão em passagem única: escopo, evidência, relatório, regras de paragem. |
| **Segurança & Privacidade** | `references/safety-privacy.md` | Biometria, passkeys, prompts de permissão, 2FA, GDPR, gestão multi-dispositivo. |
| **Utilitários** | `references/utility.md` | Favoritos, marcadores, partilha nativa, área de transferência, personalização. |

---

## Estrutura do Repositório

```text
design-pro/
├── SKILL.md                 # Orquestrador mestre (Lead UX Designer & Routing Table)
├── README.md                # Documentação e guia de instalação
├── CHANGELOG.md             # Histórico de versões e alterações
├── AGENTS.md                # Modelo operacional multi-agente
├── LICENSE                  # Licença MIT
├── .github/workflows/       # CI: corre o linter do skill-auditor em cada push
├── agent/                   # Modelos de operação, personas e heurísticas
├── adapters/                # Otimizações para Claude Code, Codex e Antigravity
├── templates/               # Modelo de relatório de revisão
└── references/              # Os 21 guias de referência especializados
```

---

## Licença

Distribuído sob a licença [MIT](LICENSE).
