# 📘 SOIL 教學簡報技能集（`soil-deck-skills`）完整中文教學講義

> 本講義為 **「AI & Language Learning」** 課程學生專用進階手冊，詳細介紹 `soil-deck-skills` 的六顆引擎教學設計原理、三個子技能的運作流程，以及課堂實作避坑指南。
> 快速安裝與複製即用 Prompt 請見主頁 [README.md](../README.md)。

---

## 一、 為什麼做「教學簡報」跟做「一般商業簡報」完全不同？

當你把一段英文課文、文法規則或教案丟給一般 AI 說「幫我做成投影片」時，AI 通常會做兩件事：
1. 把每一段文字濃縮成 5～6 點條列（Bullet points）。
2. 每頁套同一個「標題＋條列文字」版型。

這樣做出來的簡報對學習者來說是**高認知負荷（High Cognitive Load）**的「閱讀測驗」，而不是幫助理解的教學工具。

**SOIL 教學簡報工作流（SOIL Teaching Deck Workflow）** 透過 **六顆引擎** 強制 AI 先完成教學設計，再動手寫簡報程式碼：

| 引擎順序 | 名稱 | 解決的核心教學問題 | 產出物 |
| :---: | :--- | :--- | :--- |
| **引擎 1** | **概念定位師**<br>(Concept Positioning) | 這堂課到底要讓學習者帶走什麼？他們最常搞錯什麼？ | 1 個總概念、3 個子概念、3 個常見誤解（❌➔✅）、帶走一句話、投影片 vs. 口頭講稿分工表 |
| **引擎 2** | **脈絡定位師**<br>(Context Positioning) | 學習者為什麼要在乎？怎麼安排理解節奏？ | 三段式節奏：**引起動機（15–20%）➔ 維持注意（60–70%）➔ 喚起行動（15–20%）** |
| **引擎 3** | **頁面架構師**<br>(Page Architecture) | 每一頁扮演什麼教學角色？ | 逐頁角色表（封面、問題引入、迷思澄清、雙欄比較、流程、案例、總結、行動頁），嚴格遵守**「一頁一重點」** |
| **引擎 4** | **認知編修師**<br>(Cognitive Editing) | 怎麼降低學習者的認知負荷、幫他們注意到關鍵特徵（Noticing）？ | 套用六個認知詞：**降雜訊、區塊化、增資訊、結構化、順脈絡、步驟化** |
| **引擎 5** | **風格建構師**<br>(Style Construction) | 視覺階層與配色如何服務理解？ | 鎖定配色、標題／內文字級比例、格線對齊與 YAML 設計系統 |
| **引擎 6** | **簡報總導演**<br>(Production & QA) | 如何把設計轉成高品質且無破版的檔案？ | 輸出 `.html` 或 `.pptx`，並執行離線與版面檢驗 |

---

## 二、 三個技能的深度比較與選用指南

### 1. `soil-html-deck`（互動網頁教學簡報 `.html`）
* **何時選它**：當你在做 **Microlearning（微學習單元）**、語言點導覽（Walkthrough）、課前自學教材，或是想放進 **Teaching Cockpit（教學駕駛艙）** 時。
* **為什麼強**：
  * 它不是死板的圖片投影片，而是具備原生 HTML/CSS/JS 互動能力的單一 `.html` 檔（不需網路、不需伺服器，雙擊就能在任何瀏覽器打開）。
  * 內建 **Interaction Router（互動路由器）**：根據每一頁的知識關係自動挑選最合適的互動方式：
    * **對比／迷思翻轉（Comparison / Myth vs. Reality）** ➔ 前後切換按鈕（Toggle）或雙欄點擊揭曉（Click-to-reveal）。
    * **步驟／語用流程（Sequence / Process）** ➔ 步驟引導器（Stepper）。
    * **分類／詞性與語氣歸納（Classification）** ➔ 分類篩選器（Filter / Tabs）。
    * **理解檢核（Practice / Check）** ➔ 即時回饋小測驗（選錯時先給提示，符合 SLA 的 Elicitation / Hint-first 原則）。
* **內建自動化檢驗腳本**：
  * `scripts/validate_interactive_spec.py`：檢查 YAML 規格是否完整。
  * `scripts/embed_assets.py`：把所有圖片轉成 Base64 內嵌進單一 HTML 檔。
  * `scripts/verify_html.py`：確保最終 HTML 100% 可離線開啟、無遺失外部資源。

### 2. `soil-teaching-deck`（可編輯 PowerPoint 簡報 `.pptx`）
* **何時選它**：當你需要上台報告、繳交 `.pptx` 檔案，或是手邊已經有一份現成的 `.pptx` 想要請 AI 診斷改進時。
* **四大工作模式**：
  1. **全流程模式（有素材）**：貼上課文、講義或教案，走完引擎 1～6 產出 `.pptx`。
  2. **診斷修改模式（有現成 `.pptx`）**：AI 先用 `markitdown` 讀取你的 `.pptx`，逐頁用六個認知詞列出「認知編修報告（高／中／低優先級）」，等你同意後再產出改版 `.pptx`。
  3. **從主題開始模式**：只有一個教學主題，AI 先幫你整理最小事實包與常見誤解，再走六顆引擎。
  4. **風格定義模式**：逆向分析你喜歡的簡報截圖，抽取出可重複使用的風格規則。

### 3. `soil-image-deck`（全圖片／底圖視覺簡報 `.pptx`）
* **何時選它**：當你想製作像 NotebookLM 簡報一樣、每一頁都是高質感插畫的視覺型簡報時。
* **兩種輸出模式（`output_mode`）**：
  * **`baked`（全圖烘焙模式）**：短標題與重點文字直接由 AI 生圖畫進滿版視覺裡，最適合開場 Hook、社群分享與故事型教材。
  * **`plate`（底圖疊字模式）**：AI 先生成預留文字留白區的無字設計底圖（Plate），再用程式疊上可自由編輯的文字框，兼顧美感與文字可修改性。

---

## 三、 環境套件需求一覽（給 AI Agent 自動安裝即可）

如果你只使用 **`soil-html-deck`**，只需要 Python 標準環境加上 `PyYAML` 與 `Pillow`（用於驗證規格）。
如果你要使用 **`soil-teaching-deck`** 產出 `.pptx`，電腦需要有 Node.js 與 `pptxgenjs`。

你可以直接複製以下這句話貼給你的 **Antigravity** 或 **OpenCode**，讓 AI 自動幫你檢查並補齊套件：
```text
請幫我檢查電腦是否已安裝 PyYAML、Pillow、python-pptx、markitdown 與 Node.js 的 pptxgenjs；若有缺少，請自動幫我安裝好。
```
