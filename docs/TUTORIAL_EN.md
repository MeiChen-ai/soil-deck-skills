# 📗 Complete English Tutorial: SOIL Teaching Deck Skills (`soil-deck-skills`)

> This guide is designed for students in the **AI and Language Learning** course. It explains the pedagogical theory behind the **SOIL 6-Engine Workflow**, how to choose among the three included skills (`soil-html-deck`, `soil-teaching-deck`, `soil-image-deck`), and how to get the best results when building language learning materials.
> For one-step installation and copy-and-paste prompts, see the main [README.md](../README.md).

---

## 1. Why Teaching Slides Need a Pedagogical Workflow (Not Just Slide Templates)

When you hand a reading passage, grammar rule, or lesson plan to a standard AI and ask for slides, it typically summarizes each paragraph into 5–6 bullet points and repeats the same title-plus-bullets layout on every page. For language learners, this creates **high extraneous cognitive load**—students end up reading walls of text instead of noticing target language patterns.

The **SOIL Teaching Deck Workflow** (developed by Prof. Chun-Yi Lee) solves this by guiding the AI through **six sequential engines** before generating any slide code:

| Engine | Name | Core Pedagogical Question | What the AI Produces |
| :---: | :--- | :--- | :--- |
| **Engine 1** | **Concept Positioning** | What is the single core takeaway, and what misconceptions block learners? | 1 Big Idea, 3 Sub-Ideas, 3 Common Misconceptions (❌ Myth ➔ ✅ Fix), 1 Takeaway Sentence, Minimal Fact Pack, and On-Slide vs. Spoken Script split |
| **Engine 2** | **Context Positioning** | Why should learners care, and how is understanding paced? | 3-Act Rhythm: **Hook / Motivation (15–20%) ➔ Build Understanding (60–70%) ➔ Call to Action / Practice (15–20%)** |
| **Engine 3** | **Page Architecture** | What pedagogical job does each individual slide perform? | Slide-by-slide role table (Cover, Question Hook, Myth-Busting Flip, Side-by-Side Comparison, Process Flow, Case Study, Summary, Action) with **Strictly 1 Core Message per Slide** |
| **Engine 4** | **Cognitive Editing** | How do we reduce cognitive load and guide learner noticing? | Slide refinement using 6 cognitive lenses: **Reduce Noise, Chunking, Bridge Info, Visual Hierarchy, Reading Flow, Stepwise Pacing** |
| **Engine 5** | **Style Construction** | How do typography, color, and layout serve comprehension? | Locked color palette, poster-grade font size hierarchy, alignment grid, and YAML design specification |
| **Engine 6** | **Production & QA** | How do we compile and verify a bug-free final file? | Standalone `.html` or editable `.pptx` output + automated validation & visual inspection |

---

## 2. Deep Dive into the 3 Included Skills

### Skill 1: `soil-html-deck` (Interactive Single-File Web Deck `.html`)
* **When to Choose It**: Whenever you are building an **interactive microlearning module**, a grammar/vocabulary/pragmatics walkthrough, a self-paced review deck, or a slide deck to embed inside a **Teaching Cockpit**.
* **How It Works**:
  1. Plans the concept, 3-act flow, and slide roles (Engines 1–4).
  2. Writes a `spec.yaml` contract (`soil_interactive_deck_v1`) and routes each slide's semantic structure to a purposeful interaction via `references/interaction-router.md`:
     * **Comparison / Myth vs. Reality** ➔ Before/After Toggle or Click-to-Reveal Cards.
     * **Sequence / Dialogue Turns** ➔ Interactive Stepper.
     * **Classification / Register / Politeness Levels** ➔ Category Filter or Tabs.
     * **Comprehension / Pragmatics Check** ➔ Interactive Mini-Quiz with hint-first feedback.
  3. Compiles a **single, portable, 100% offline `.html` file** with all CSS, JS, and Base64 assets embedded (`scripts/embed_assets.py`), then verifies offline portability and accessibility (`scripts/verify_html.py`).

### Skill 2: `soil-teaching-deck` (Editable PowerPoint `.pptx` + Diagnostic Revision)
* **When to Choose It**: When you need a native `.pptx` file that you can open and edit in Microsoft PowerPoint, Apple Keynote, or Google Slides, or when you want to audit and improve an existing `.pptx` deck.
* **Four Operating Modes**:
  1. **Full Workflow Mode (From Material)**: Paste your lesson notes, article, or worksheet and walk through Engines 1–6 to generate a `.pptx` via `PptxGenJS`.
  2. **Diagnostic Revision Mode (From Existing `.pptx`)**: Point the AI to an existing `.pptx` file. It extracts the slide text and visuals, evaluates each slide against Engine 4's 6 cognitive editing principles, outputs a prioritized **Cognitive Editing Report**, and rebuilds the slides you approve.
  3. **From Scratch Mode (Topic Only)**: Give a topic and target learner level; the AI helps gather examples and misconceptions before running Engines 1–6.
  4. **Style Definition Mode**: Reverse-engineers a reference slide or image into a reusable style specification.

### Skill 3: `soil-image-deck` (Visual-First Full-Image / Plate `.pptx`)
* **When to Choose It**: When you want a NotebookLM-style, high-impact visual presentation where every slide is anchored by a custom AI illustration.
* **Two Output Modes (`output_mode`)**:
  * **`baked`**: Short display text is rendered directly inside the AI-generated full-bleed illustration. Ideal for lesson hooks, visual storytelling, and social/workshop showcases.
  * **`plate`**: Generates a text-free designed background plate with reserved high-contrast zones, then overlays editable native text boxes. Ideal when you want rich visuals while keeping text editable.

---

## 3. Optional Dependencies Helper

* **`soil-html-deck`** works out of the box in any browser and only uses Python (`PyYAML`, `Pillow`) for spec validation.
* **`soil-teaching-deck`** uses Node.js + `pptxgenjs` to generate `.pptx` files.

If your computer does not have these packages installed yet, simply paste this prompt into **Antigravity** or **OpenCode**:
```text
Please check if PyYAML, Pillow, python-pptx, markitdown, and the Node.js package pptxgenjs are installed on my computer, and automatically install any missing ones for me.
```
