# J. DAVIS | Algorithmic Authority Branding Guide

**Directive Type**: Mandatory — UI/UX Designer, Frontend Developer, Documentation SE
**Author**: Jerome Davis
**Last Updated**: 2026-02-09
**Enforced By**: UI/UX Designer (design compliance), Frontend Developer (implementation compliance)
**Logo Reference**: `directives/branding-logo-reference.png` *(place the master logo file at this path)*

---

## Purpose

This directive defines the visual and verbal identity for the J. Davis brand. All user-facing applications, dashboards, presentations, documentation, and digital assets produced by this agent fleet must conform to this guide.

The aesthetic is **"Cyber-Secure Futurism."** It signals elite expertise at the intersection of rigid government security standards and dynamic AI innovation.

This guide is engineered for consistency across human-created and AI-generated outputs — including generative AI tools (image generators, layout tools, copywriting assistants).

---

## 1. Core Brand DNA

### Keywords (Use These When Setting Design Context)

Authoritative, Secure, Futuristic, Structured, Elite, High-Tech, Metallic, Kinetic Energy, Enterprise-Grade.

### Anti-Keywords (What We Are NOT)

Playful, cartoonish, organic, cluttered, "start-up scrappy," distressed textures, hand-drawn, whimsical, rounded/bubbly.

### Brand Positioning

J. Davis operates at the intersection of:

- DoD / Federal Contracting rigor
- AI Governance & Lifecycle Management discipline
- Cybersecurity & Compliance authority
- Enterprise Program & Portfolio Leadership
- Emerging AI Product and Strategy vision

Every visual and verbal output must reinforce this positioning.

---

## 2. Visual Palette

### Primary Colors & Textures

| Element | Role | Hex Reference | Description |
|---------|------|---------------|-------------|
| **Brushed Titanium / Chrome** | Foundation | `#C0C0C0` to `#E8E8E8` gradient | Represents impenetrable security and high value. Brushed metal finish, silver chrome with beveled edges, reflective metallic surface, industrial elegance |
| **Electric Cyan / Plasma Blue** | Energy / AI Accent | `#00F0FF` | Represents AI connectivity and kinetic energy. Glowing cyan light trails, bioluminescent blue nodes, electric blue energy field, holographic interface glow |
| **Deep Sky Blue** | Secondary Accent | `#00A8E8` | Supporting accent for interactive elements, links, and secondary highlights |
| **Charcoal / Dark Gunmetal** | Text / Contrast | `#2D2D2D` to `#1A1A1A` | Primary text color on light backgrounds. Dense, authoritative, high-contrast |
| **Clean White** | Background / Space | `#FFFFFF` to `#F5F5F5` | Clean backgrounds. Never pure white with no relief — use subtle gradient |
| **Neutral Grey Gradient** | Environmental Background | `#E0E0E0` to `#B0B0B0` | Background environments. Minimalist, no clutter, studio lighting feel |

### Color Usage Rules

- **Primary surfaces**: Neutral grey or clean white with subtle gradient
- **Accent elements**: Electric Cyan (`#00F0FF`) for interactive elements, highlights, and data visualization
- **Text**: Charcoal on light backgrounds; white on dark surfaces
- **Never**: Red as a brand color (red is reserved for error states and critical alerts only)
- **Never**: More than two accent colors on a single screen or layout
- **Data visualization**: Use the cyan-to-blue gradient spectrum. Avoid rainbow palettes

### Texture & Material Guidelines

- Prefer clean, flat surfaces with subtle metallic sheen or gradient
- Beveled edges on primary UI containers to evoke the brushed-metal aesthetic
- Subtle glow effects on interactive elements (hover states, active states)
- No heavy drop shadows — use light elevation indicators
- No organic textures (wood, fabric, paper) — keep everything synthetic and precision-engineered

---

## 3. Typography

### Font Hierarchy

| Level | Usage | Font Family | Fallback | Weight | Style |
|-------|-------|-------------|----------|--------|-------|
| **Hero / H1** | Page titles, brand name displays | Eurostile Bold Extended | Montserrat Black, Impact | 800–900 | Uppercase, extended letter-spacing |
| **Section Headers / H2** | Section titles, feature headings | Helvetica Neue | Roboto, Open Sans | 600–700 | Title case or uppercase |
| **Sub-Headers / H3** | Subsection titles, card headers | Helvetica Neue Light | Roboto Condensed | 400–500 | Title case |
| **Body Text** | Paragraphs, descriptions, form labels | Open Sans | Roboto, Arial | 400 | Sentence case |
| **Monospace / Code** | Code blocks, technical values, IDs | JetBrains Mono | Fira Code, Consolas | 400 | As-is |
| **Data / Tables** | Tabular data, metrics, dashboards | Roboto Mono | Source Code Pro | 400 | As-is |

### Typography Rules

- **Hero text**: Always uppercase. Extended letter-spacing (0.05–0.1em). Metallic or chrome finish when possible
- **Body text**: 16px minimum for readability. Line height 1.5–1.6
- **Never**: Decorative fonts, script fonts, serif fonts (except in formal legal documents where required)
- **Layout philosophy**: Structured grid. Center-aligned or strong left-align. Never chaotic or overlapping

---

## 4. Logo Usage

### Primary Logo

The primary logo consists of:

1. **Shield Icon** — A 3D brushed-metallic shield centered within an orbital lattice of glowing cyan nodes and connection lines. Represents security (shield) within a connected AI ecosystem (lattice)
2. **Name Block** — "J. DAVIS" in hero font (brushed metallic finish, beveled edges, subtle cyan edge lighting)
3. **Title Bar** — "EXECUTIVE ARCHITECT | AI GOVERNANCE & STRATEGY" in sub-hero font beneath the name

### Logo Placement Rules

- Minimum clear space around the logo: 1x the height of the shield icon on all sides
- On dark backgrounds: Logo maintains metallic sheen with increased cyan glow intensity
- On light backgrounds: Logo as designed, with subtle shadow for depth
- **Never**: Distort, rotate, recolor, or separate logo elements
- **Never**: Place the logo on busy/cluttered backgrounds without a clean container
- Minimum display size: 120px height for digital; 1 inch height for print

### Favicon / Small Format

When the logo must be displayed at small sizes (favicons, app icons, thumbnails), use the shield icon only — without the name block or title bar.

---

## 5. UI Component Standards

### Buttons

| State | Background | Text | Border | Effect |
|-------|-----------|------|--------|--------|
| Primary (Default) | `#00A8E8` | White | None | Subtle metallic gradient |
| Primary (Hover) | `#00F0FF` | White | None | Glow effect (cyan) |
| Primary (Active) | `#0088CC` | White | None | Pressed/inset effect |
| Secondary (Default) | Transparent | `#00A8E8` | 1px `#00A8E8` | — |
| Secondary (Hover) | `rgba(0, 240, 255, 0.1)` | `#00F0FF` | 1px `#00F0FF` | Subtle glow |
| Disabled | `#E0E0E0` | `#999999` | None | — |
| Danger / Destructive | `#CC3333` | White | None | Reserved for irreversible actions only |

### Cards & Containers

- Background: White or `#F8F8F8` with subtle border (`#E0E0E0`)
- Border radius: 4–8px (precision corners, never fully rounded)
- Elevation: Light box-shadow (`0 2px 8px rgba(0,0,0,0.08)`)
- Header accent: 2px top border in Electric Cyan (`#00F0FF`) or Deep Sky Blue (`#00A8E8`)

### Navigation

- Sidebar: Dark Gunmetal (`#1A1A1A`) background with cyan accent for active state
- Top bar: Clean white or light grey with subtle bottom border
- Active indicator: Left border accent in Electric Cyan
- Icons: Line-style icons (Lucide, Phosphor, or similar). Never filled/solid icons in navigation

### Data Tables

- Header row: `#2D2D2D` background, white text, uppercase
- Alternating rows: White / `#F5F5F5`
- Row hover: `rgba(0, 240, 255, 0.05)`
- Sortable column indicators: Cyan accent

### Charts & Data Visualization

- Primary data series: `#00A8E8`
- Secondary data series: `#00F0FF`
- Tertiary data series: `#005F8C`
- Background grid: `#E8E8E8` (subtle, never dominant)
- Axis labels: `#666666`
- Annotation text: `#2D2D2D`

### Form Elements

- Input fields: White background, `#E0E0E0` border, 4px radius
- Focus state: Border changes to `#00A8E8`, subtle cyan glow
- Labels: `#2D2D2D`, 14px, semi-bold
- Helper text: `#888888`, 12px
- Error state: `#CC3333` border and text
- Success state: `#00CC66` border and icon

---

## 6. Brand Voice (For Content & Copy)

### Persona

**Role**: Peer-to-peer Executive Strategist
**Background**: Executive Architect in AI Governance with a background in Top Secret cybersecurity
**Authority Level**: Speaks as an equal to C-suite leaders, not as a vendor or consultant pitching services

### Tone Attributes

| Attribute | Description | Example |
|-----------|-------------|---------|
| **Surgical** | Every word earns its place. No filler, no padding | "Ungoverned AI is organizational debt accruing compound interest" |
| **Concise** | Briefing format. Lead with the conclusion | "Three risks. Here's how to mitigate each" |
| **Authoritative** | Speaks from operational experience, not theory | "I've seen this pattern in three DoD programs" |
| **Structured** | Frameworks, systems, numbered steps | "Phase 1: Map. Phase 2: Measure. Phase 3: Manage" |
| **High-Level** | Strategy and risk, not tactics and tools | "Governance-as-Code, not governance-as-afterthought" |

### Voice Rules

- **Speak like a briefing, not a blog post.** Focus on systems, risk mitigation, and strategic leverage
- **Lead with the BLUF** (Bottom Line Up Front). Conclusion first, evidence second
- **Use military or engineering precision.** "Execute," "deploy," "operationalize" — not "try," "maybe," "hopefully"
- **No fluff.** Every sentence must advance the argument or provide actionable intelligence
- **Frameworks over opinions.** Present structured analysis, not personal takes

### Anti-Voice (What We Never Sound Like)

- Casual blog voice ("Hey guys, so I was thinking...")
- Sales pitch voice ("This amazing solution will revolutionize...")
- Academic hedging ("It could potentially be argued that perhaps...")
- Startup hype ("We're disrupting the governance space!")

---

## 7. Environmental & Background Guidelines

### Application Backgrounds

- Clean, neutral grey gradient — never busy or cluttered
- Subtle depth through layered containers, not background imagery
- If decorative elements are used, limit to subtle network node patterns or data flow lines at low opacity (5–10%)

### Presentation / Slide Backgrounds

- Primary: Clean grey gradient (`#E8E8E8` to `#D0D0D0`)
- Accent slides: Dark Gunmetal (`#1A1A1A`) with cyan accent elements
- **Never**: Stock photos as backgrounds, busy patterns, or textured surfaces

### Marketing / Asset Backgrounds

- Use the "minimalist futuristic data environment" aesthetic
- Subtle holographic network node patterns
- Frosted glass panels with glowing blue data lines
- Studio lighting feel — clean, controlled, professional
- Shallow depth of field for product-focused assets

---

## 8. Generative AI Prompt Templates

These are copy-paste prompt structures for generating brand-consistent assets.

### Asset Cover / Hero Image

```
A high-quality, 3D render in the style of Cyber-Secure Futurism. The central focus is a brushed metallic shield icon glowing with electric cyan data streams. The background is a clean, minimalist grey gradient with subtle holographic network node patterns. The title text is '[TITLE]' in a bold, metallic, industrial sans-serif font. Below it, 'J. DAVIS | EXECUTIVE ARCHITECT'. The overall vibe is premium, secure, and futuristic.
```

### Virtual Background / Webinar

```
A professional virtual background for a cybersecurity executive. A clean, minimalist, futuristic operations center. Subtle glowing blue data lines and network nodes form abstract constellations on frosted glass panels in the background. The main structure is brushed metal and neutral grey panels. Shallow depth of field. No clutter. Secure and high-tech atmosphere.
```

### Social Media Header

```
A wide-format professional banner in Cyber-Secure Futurism style. Brushed titanium surface with electric cyan accent lines forming a subtle circuit pattern. Clean and minimal. Space for text overlay on the left third. 16:9 aspect ratio. Premium, authoritative, enterprise-grade.
```

### Dashboard / App Screenshot

```
A clean, modern web application dashboard in Cyber-Secure Futurism style. Dark sidebar navigation with cyan active indicators. White content area with data cards showing metrics. Charts use blue-cyan color palette. Typography is clean industrial sans-serif. Minimal, structured, no clutter. Enterprise security application aesthetic.
```

---

## 9. Compliance & Consistency Enforcement

### Design Review Checklist

Before any user-facing output is delivered, the UI/UX Designer or Frontend Developer must verify:

- [ ] Color palette uses only approved hex values (no rogue colors)
- [ ] Typography follows the font hierarchy (no decorative or serif fonts)
- [ ] Layout follows structured grid (no chaotic or overlapping elements)
- [ ] Interactive elements follow button/form state specifications
- [ ] Data visualizations use the approved chart color palette
- [ ] Logo usage follows placement and sizing rules
- [ ] Brand voice in any UI copy follows tone and voice rules
- [ ] Backgrounds are clean and uncluttered
- [ ] No anti-pattern elements present (playful, cartoonish, organic, etc.)

### Agent Applicability

| Agent | Branding Guide Obligation |
|-------|--------------------------|
| **UI/UX Designer** | **Primary enforcer.** All wireframes, mockups, and design specifications must conform to this guide. Flag deviations before implementation |
| **Frontend Developer** | **Implementation enforcer.** All coded interfaces must implement the design specifications from this guide. Verify color values, fonts, and component styles match |
| **Documentation SE** | **Documentation compliance.** Ensure any user-facing documentation (help pages, guides, onboarding) follows the typography and voice guidelines |
| **Backend Developer** | Ensure API responses include proper error messages following brand voice guidelines |
| **Program Analyst** | Reference this guide when producing executive-facing governance dashboards or reports |

---

*Version*: 1.0
*Last Updated*: 2026-02-09
*Maintained By*: Human Director (Jerome Davis)
*Applies To*: All agents producing user-facing outputs
*Brand Identity*: J. Davis — Algorithmic Authority
