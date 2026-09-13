# design-pro

**Model-agnostic UX & Design System skills for agentic IDEs.** Procedural, multimodal, and verifiable Agent Skills built for Google Antigravity (Gemini 3.8 Flash), Claude Code (Opus 5 / Sonnet 5 / Fable 5), and Codex CLI (GPT-5.6 Sol / Terra / Luna).

Conforme a especificação aberta [Agent Skills](https://agentskills.io), cada skill é autónoma, sem scripts intermediários ou dependências frágeis de symlinks.

---

## O que é o Design-Pro?

O **design-pro** é uma suite profissional de 21 skills de UX e design de produto, otimizadas para modelos de raciocínio de 2026:
- **Single-pass com Stopping Rules:** Evita que os modelos entrem em loops infinitos de verificação ou gastem tokens desnecessários.
- **Protocolo de Evidência com Confiança:** Toda a falha exige classificação de `Confidence` (`Observed` / `Inferred` / `Unknown`), eliminando alucinações sobre coisas invisíveis em prints ou estados estáticos.
- **Suporte Nativo a Agentes e Multimodalidade:** Cobertura de ponta para aplicações onde a IA é a interface (`ux-ai-agent`), entradas de voz/câmara/scan (`ux-multimodal-input`) e concessão de autonomia com escada de confirmação (`ux-consent-and-autonomy`).

---

## Como Instalar (Zero Scripts, Sem Complicações)

Não precisa de correr scripts de instalação nem de configurar symlinks. O design-pro é compatível com **dois métodos imediatos**:

### Método 1: Copiar e Colar (Drop-in)

Copie qualquer pasta `ux-*` (ou o repositório inteiro) diretamente para a pasta de skills do seu agente:

| Ferramenta | No Projeto Atual | Global (Todo o Sistema) |
|---|---|---|
| **Google Antigravity** | `<projeto>/.agents/skills/` | `~/.gemini/config/skills/` |
| **Claude Code** | `<projeto>/.claude/skills/` | `~/.claude/skills/` |
| **Codex CLI** | `<projeto>/.codex/skills/` | `~/.codex/skills/` |

### Método 2: Linha de Comandos (1 linha no Terminal)

**No Google Antigravity (no projeto atual):**
```bash
git clone https://github.com/JoaoPeixoto72/design-pro.git .agents/skills/design-pro
```

**No Claude Code:**
```bash
git clone https://github.com/JoaoPeixoto72/design-pro.git .claude/skills/design-pro
```

**Ou com o GitHub CLI:**
```bash
gh repo clone JoaoPeixoto72/design-pro .agents/skills/design-pro
```

---

## Catálogo de Skills (21 Categorias)

```
design-pro/
├── ux-review/                  # Router principal + contrato unificado de relatório (máx. 5 skills por review)
├── ux-visual-design/           # Design system, hierarquia visual, tipografia e espaçamento
├── ux-accessibility/           # WCAG 2.2 AA, leitor de ecrã, contraste e European Accessibility Act (EAA)
├── ux-navigation/              # Estrutura de ecrãs, fluxos e gestos nativos de retorno
├── ux-forms/                   # Formulários, validação inline, prevenção de erros e teclado
├── ux-search/                  # Pesquisa, sugestões, filtros e relevância
├── ux-information-architecture/# Taxonomia, categorização e organização de conteúdo
├── ux-content/                 # Microcópia, clareza textual e tom de voz
├── ux-error-handling/          # Gestão de falhas, mensagens explicativas, desfazer e empty states
├── ux-network/                 # Estados offline, retry gracioso e conectividade intermitente
├── ux-help-onboarding/         # Onboarding progressivo, valor antes da fricção e dicas contextuais
├── ux-user-account/            # Registo, login, recuperação de password e gestão de sessões
├── ux-safety-privacy/          # RGPD / GDPR, termos, segurança e consentimento de dados
├── ux-settings/                # Definições, preferências de conta e persistência
├── ux-notifications/           # Gestão de alertas, opt-in granular e canais
├── ux-utility/                 # Partilha, favoritos e ferramentas de produtividade
├── ux-general/                 # Prontidão para App Store / Google Play e integridade geral
├── ux-ai-automation/           # Funcionalidades de IA DENTRO de um produto tradicional
├── ux-ai-agent/                # UX de produtos onde o próprio PRODUTO É UM AGENTE autónomo
├── ux-multimodal-input/        # Entradas de câmara, microfone, voz em direto, OCR e paste de prints
├── ux-consent-and-autonomy/    # Escada de confirmação, dry-runs, orçamentos e autonomia de ações
│
├── agent/                      # 12 modelos operacionais partilhados de agente
└── templates/                  # Contrato canónico de relatório de revisão
```

---

## Como Usar

Para fazer uma revisão de UX a um ecrã, funcionalidade ou app:

```text
Review the onboarding flow in my app.
```
ou
```text
/ux-review [ecrã, fluxo ou componente]
```

O router `ux-review` selecionará automaticamente as skills mais relevantes (limitadas a no máximo 5 para máxima eficiência de contexto) e devolverá o relatório estruturado com:
1. **Summary** (Qualidade geral, maior risco, maior força)
2. **Findings** (com `Item`, `Verdict`, `Evidence`, `Severity` e `Confidence`)
3. **Top fixes** (3 a 5 correções concretas e ordenadas por impacto)

---

## Licença

MIT — veja [LICENSE](LICENSE).
