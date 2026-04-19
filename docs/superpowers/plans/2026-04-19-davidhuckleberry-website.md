# davidhuckleberry.com Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a single-page personal website with a full-bleed photo background and the domain name in white bold text at the bottom-left.

**Architecture:** One `index.html` file with inline CSS. Compressed JPEG as the background. No JavaScript, no external dependencies, no build tools.

**Tech Stack:** HTML5, CSS3, `sips` (macOS built-in) for image compression.

---

### Task 1: Compress the background image

**Files:**
- Modify: `IMG_0568.jpeg` (compress in-place; original is 960×1280px, 1.3MB)

- [ ] **Step 1: Compress the JPEG to target ~300KB**

Run:
```bash
sips --setProperty formatOptions 60 IMG_0568.jpeg
```
Expected: command completes silently.

- [ ] **Step 2: Verify file size is acceptable**

Run:
```bash
wc -c IMG_0568.jpeg
```
Expected: a number below 400000 (400KB). If still too large, run again with `formatOptions 50`.

- [ ] **Step 3: Verify image still looks good**

Open `IMG_0568.jpeg` in Preview. The photo should be clear — no severe blocking artifacts.

- [ ] **Step 4: Commit**

```bash
git init
git add IMG_0568.jpeg
git commit -m "feat: add compressed background image"
```

---

### Task 2: Build index.html

**Files:**
- Create: `index.html`

- [ ] **Step 1: Create index.html**

Create `index.html` with this exact content:

```html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DavidHuckleberry.Com</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    html, body {
      width: 100%;
      height: 100%;
      overflow: hidden;
    }

    body {
      background-image: url('IMG_0568.jpeg');
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
    }

    h1 {
      position: fixed;
      bottom: 28px;
      left: 28px;
      color: white;
      font-family: 'Helvetica Neue', Arial, sans-serif;
      font-size: 26px;
      font-weight: 700;
      letter-spacing: 0.5px;
      text-shadow: 1px 2px 8px rgba(0, 0, 0, 0.7);
    }
  </style>
</head>
<body>
  <h1>DavidHuckleberry.Com</h1>
</body>
</html>
```

- [ ] **Step 2: Open in browser and verify**

```bash
open index.html
```

Check:
- Photo fills the entire viewport with no white edges
- "DavidHuckleberry.Com" is visible in the bottom-left corner
- Text is white, bold, and readable against the photo
- No scrollbars appear
- Resize the browser window — photo should re-crop to always fill the frame

- [ ] **Step 3: Commit**

```bash
git add index.html
git commit -m "feat: add index.html"
```

---

### Task 3: Final cross-browser check

**Files:** none (verification only)

- [ ] **Step 1: Open in Safari**

```bash
open -a Safari index.html
```

Verify same appearance as Chrome/default browser.

- [ ] **Step 2: Simulate mobile viewport**

In Safari or Chrome DevTools, toggle device toolbar and select iPhone 14 Pro (or similar). Verify:
- Photo fills the mobile viewport
- Text remains in bottom-left, readable, not clipped

- [ ] **Step 3: Done**

Site is ready to deploy. See deployment notes below.

---

## Deployment Notes

The site is two files: `index.html` and `IMG_0568.jpeg`. Any static host works:

**GitHub Pages:**
```bash
git remote add origin https://github.com/<username>/<repo>.git
git push -u origin main
# Enable Pages in repo Settings → Pages → Deploy from branch: main
```

**Netlify drag-and-drop:**
Go to app.netlify.com → Sites → drag the project folder onto the page.

**Custom domain:** Point `davidhuckleberry.com` DNS to your host's servers, then configure the domain in your host's dashboard.
