# UI Tricorder Dashboard

A minimal overlay dashboard intended for quick phone or tablet access.

Entry point: [`main.yaml`](main.yaml)

---

## Purpose

Lightweight view of home status without the full Minimalist dashboard navigation. Named "Tricorder" after the Star Trek handheld device — meant to give a quick scan of the home environment.

Not shown in the sidebar by default (`show_in_sidebar: false` in `configuration.yaml`).

---

## Views

| File | Purpose |
|------|---------|
| [`views/10-downstairs.yaml`](views/10-downstairs.yaml) | Downstairs room overview |
| [`views/20-upstairs.yaml`](views/20-upstairs.yaml) | Upstairs room overview |
| [`subviews/10-1-security.yaml`](subviews/10-1-security.yaml) | Security camera / status subview |

---

## Layout

Views use standard Lovelace layout (no custom grid). Includes shared header components from [`includes/`](includes/):

- [`includes/header.yaml`](includes/header.yaml) — Top header
- [`includes/headerR.yaml`](includes/headerR.yaml) — Right header element
