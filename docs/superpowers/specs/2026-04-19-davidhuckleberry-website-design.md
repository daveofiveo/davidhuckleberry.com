# davidhuckleberry.com — Design Spec

**Date:** 2026-04-19

## Overview

A single-page personal website. Full-bleed photo background with the domain name as the only text element. No navigation, no links, no other content.

## Files

- `index.html` — the entire site
- `IMG_0568.jpeg` — background photo, compressed before deploy

## Layout

- Viewport-filling background: `width: 100vw; height: 100vh; overflow: hidden`
- Background image covers the full viewport via `object-fit: cover`, centered
- No scrolling

## Typography

- Text: `DavidHuckleberry.Com`
- Font: `'Helvetica Neue', Arial, sans-serif`
- Weight: `700` (bold)
- Size: `26px`
- Color: `white`
- Text shadow: `1px 2px 8px rgba(0,0,0,0.7)` — ensures readability against light areas of the photo
- Position: bottom-left, `28px` from bottom and left edges

## Image

- Source: `IMG_0568.jpeg` (photo taken at Jay Street MetroTech subway station)
- Must be compressed before deploy — target file size 200–400KB
- Use `object-fit: cover` so it fills the viewport at any screen size without distortion

## Implementation Approach

Single self-contained `index.html` with no external dependencies. No build tools, no CSS files, no JavaScript. Deployable to any static host (GitHub Pages, Netlify, S3, etc.).
