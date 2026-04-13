# UI Kiosk Dashboard

Wall-mounted display dashboard using a Star Trek LCARS aesthetic.

> **Note:** This dashboard needs significant cleanup and rework. The structure and views documented here reflect the current state and original intent, not a finished design.

Entry point: [`main.yaml`](main.yaml)

---

## Purpose

Designed for a fixed-resolution wall-mounted screen. Displays at-a-glance home status, weather, security camera feed, garden sensor data, and network rack status without requiring interaction.

---

## Theme

Uses the `LCARS Modern` theme for standard views and `LCARS Red Alert` for the security alert view. Typography uses the `Antonio` font family.

---

## Layout

All views use `custom:grid-layout` with a consistent grid structure:

```
headerL  headerR  headerR
menu     main     aux
sidebar  main     aux
footerL  footer   footer
```

Shared layout components (included in most views):
- [`includes/headerL.yaml`](includes/headerL.yaml) — Left header panel
- [`includes/headerR.yaml`](includes/headerR.yaml) — Right header panel
- [`includes/menu.yaml`](includes/menu.yaml) — Left-side navigation menu
- [`includes/footer.yaml`](includes/footer.yaml) — Bottom footer bar
- [`includes/mailCluster.yaml`](includes/mailCluster.yaml) — Mail/package delivery status panel

---

## Views

| File | Path | Purpose |
|------|------|---------|
| [`views/10-home.yaml`](views/10-home.yaml) | `/ui-kiosk/home` | Main home status — status updates, sidebar navigation |
| [`views/20-weather.yaml`](views/20-weather.yaml) | `/ui-kiosk/weather` | Weather conditions and forecast |
| [`views/25-wxalert.yaml`](views/25-wxalert.yaml) | `/ui-kiosk/wxalert` | Weather alert popup/overlay |
| [`views/30-rack.yaml`](views/30-rack.yaml) | `/ui-kiosk/rack` | Network rack / server status |
| [`views/40-garden.yaml`](views/40-garden.yaml) | `/ui-kiosk/garden` | Plant sensor readings (moisture sidebar, main content area) |
| [`views/50-planeTracker.yaml`](views/50-planeTracker.yaml) | `/ui-kiosk/planetracker` | ADS-B / plane tracker |
| [`views/15-security.yaml`](views/15-security.yaml) | `/ui-kiosk/security` | Red Alert security overlay (subview) |
| [`views/16-batteries.yaml`](views/16-batteries.yaml) | `/ui-kiosk/batteries` | Battery status overlay (subview) |

---

## Known Issues / Rework Needed

- Plant entities in `views/40-garden.yaml` still reference several removed plants (okra, tomatoes, etc.) that no longer exist — this view needs to be updated to match the current plant roster.
- The grid layout breakpoints (`max-width: 1440px`) may not match the actual target screen resolution.
- `includes/` templates use `card_mod` class overrides that depend on LCARS theme CSS — theme changes would require reviewing all card styling.
