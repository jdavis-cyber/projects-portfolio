# eBook Forge

A zero-install, single-file document editor for creating, formatting, and exporting print-ready documents. Import Word or PDF files, edit in a WYSIWYG galley-proof view, and export via Print/PDF — all from a single HTML file that runs in any modern browser.

Built for environments where installing software isn't an option. No admin privileges, no dependencies, no build step. Double-click and go.

---

## Quick Start

**Option A — Double-click** (simplest)

Open `index.html` in any modern browser. Done.

**Option B — Local server** (recommended for PDF import)

```bash
python3 -m http.server 8000
# Open http://localhost:8000
```

Or with Node.js:

```bash
npx http-server .
```

> A local server avoids `file://` protocol restrictions that some browsers enforce on PDF processing.

## Requirements

- A modern web browser (Chrome, Edge, Firefox, Safari)
- An internet connection on first load (CDN libraries are cached after that)
- A Google Gemini API key (optional — only needed for the AI Repair feature)

No installation. No build tools. No admin privileges.

---

## Features

### Document Import
- **Word (.docx)** — Converts to structured HTML via Mammoth.js
- **PDF** — Extracts text content via pdf.js
- Drag-and-drop or click to upload
- Multiple files import as separate chapters

### WYSIWYG Editor
- Galley-proof layout sized to US Letter (8.5" x 11")
- **Live page break indicators** — dashed cyan lines show exactly where each page will break when printed, with page number labels
- Rich formatting toolbar: bold, italic, lists, headings, alignment
- Image sizing (small/medium/large) and positioning (left/center/right)
- Explicit page break insertion for precise print layout control
- 20-step undo history

### Chapter Management
- Sidebar navigation with chapter list
- Drag-and-drop chapter reordering
- Double-click to rename chapters inline
- Per-chapter word count tracking

### Export
- **Print / PDF** — Browser print dialog with clean page breaks, page numbering, and proper pagination
- Cover image support for front page

### AI Repair (Optional)
- Select garbled text or broken tables and click Repair
- Uses Google Gemini API to reconstruct content
- API key stored in your browser's localStorage (never sent anywhere except Google's API)
- Content reflow for cleaning up imported formatting

### Local Persistence
- Your work auto-saves to IndexedDB (via localforage)
- Close the tab, reopen it later — your chapters and cover image are restored
- No server, no cloud, no account required

---

## Tech Stack

Everything loads from CDNs on first visit and caches in the browser. The entire application is a single HTML file.

| Component | Library | Purpose |
|-----------|---------|---------|
| UI Framework | React 18 | Component rendering |
| Styling | Tailwind CSS | Utility-first CSS |
| Transpilation | Babel (in-browser) | JSX compilation |
| Icons | Lucide React | UI iconography |
| Word Import | Mammoth.js 1.4.2 | .docx to HTML conversion |
| PDF Import | pdf.js 3.4.120 | PDF text extraction |
| Persistence | localforage 1.10.0 | IndexedDB abstraction |
| AI (optional) | Google Gemini API | Text and table repair |
| Fonts | Google Fonts | Open Sans, Montserrat, JetBrains Mono, Merriweather |

---

## Keyboard Shortcuts

| Action | Shortcut |
|--------|----------|
| Bold | Ctrl/Cmd + B |
| Italic | Ctrl/Cmd + I |
| Underline | Ctrl/Cmd + U |

Standard `contentEditable` shortcuts are supported by the browser.

---

## API Key Setup (Optional)

The AI Repair feature requires a Google Gemini API key. To configure it:

1. Click the key icon in the toolbar
2. Paste your Gemini API key
3. Click Save

Your key is stored in `localStorage` and only sent to Google's Gemini API endpoint when you use the Repair feature. It is never transmitted anywhere else.

If you don't need AI repair, the app works fully without an API key.

---

## Why a Single HTML File?

Many program managers, analysts, and knowledge workers operate in IT-restricted environments where:

- Installing software requires admin approval and weeks of lead time
- Desktop apps need security review and whitelisting
- Cloud tools may be blocked or require procurement
- Python/Node.js may not be available

A single HTML file sidesteps all of this. It runs in the browser that's already on every machine. The CDN libraries cache after first load, so it works on spotty connections too.

---

## Troubleshooting

**PDF import doesn't work when opening the file directly**
Use a local server (`python3 -m http.server 8000`). Some browsers restrict `file://` protocol access for PDF processing.

**AI Repair isn't working**
Check that you've entered a valid Gemini API key (click the key icon in the toolbar) and that you have internet access.

**My work disappeared**
Your data is stored in IndexedDB, which is scoped to the origin (domain + port). If you switch from `file://` to `localhost:8000` (or change the port), the browser treats it as a different origin. Stick to the same access method.

---

## License

MIT

---

## Author

Jerome Davis
