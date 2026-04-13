# Rodney's Home Assistant Config

Home Assistant configuration and YAML-mode dashboards for a residential smart home.

## Dashboards

Three Lovelace dashboards are defined in [`configuration.yaml`](configuration.yaml):

| Dashboard | File | Purpose |
|-----------|------|---------|
| **Minimalist** | `ui_lovelace_minimalist/` | Primary daily-driver dashboard. Mobile-first, tap-bar navigation. Uses the [UI Lovelace Minimalist](https://ui-lovelace-minimalist.github.io/UI/) framework. |
| **Kiosk** | `ui-kiosk/` | Wall-mounted display. Star Trek LCARS theme (`LCARS Modern` / `LCARS Red Alert`). Designed for a fixed-resolution screen. Needs cleanup/rework. |
| **Tricorder** | `ui-tricorder/` | Minimal phone/tablet overlay view. Two-view layout (downstairs/upstairs). |

The default HA Storage-mode dashboard also exists but is not tracked in this repo.

## Key Config Files

| File | Purpose |
|------|---------|
| [`configuration.yaml`](configuration.yaml) | Root config — dashboard registration, logbook exclusions, includes |
| [`automations.yaml`](automations.yaml) | All automations (HA-managed) |
| [`scripts.yaml`](scripts.yaml) | Scripts |
| [`plant.yaml`](plant.yaml) | Plant entity definitions with sensor mappings and min/max thresholds |
| [`template.yaml`](template.yaml) | Template sensors |
| [`mqtt.yaml`](mqtt.yaml) | MQTT sensor definitions |
| [`recorder.yaml`](recorder.yaml) | History recorder include/exclude config |
| [`notify.yaml`](notify.yaml) | Notification service definitions |

## Shared UI Includes

[`ui-includes/`](ui-includes/) contains YAML shared across dashboards:

- **`alerts.yaml`** — Chip-style alert cards for the Minimalist dashboard header. Each chip watches a plant entity state + notify boolean + rain sensor cooldown.
- **`decluttering.yaml`** — Reusable `custom:decluttering-card` templates: `plant_subview`, `plant_graphs`, `plant_mushroom_card`, `plant_notification_card`.
- **`space_maps/`** — Floor plan image cards for downstairs and upstairs.

## Plant System

Plants are defined in [`plant.yaml`](plant.yaml) and tie together:
- A `plant.*` entity with moisture/temperature/conductivity thresholds
- `sensor.soil_moisture_N` / `sensor.soil_moisture_N_batt` hardware sensors
- `input_boolean.plant_notify_*` — per-plant notification toggle
- HA **Labels** (`frontyard`, `potted_plants`, `indoor_greenhouse`, `garden`) — used by `auto-entities` filters in the garden view

See [`ui_lovelace_minimalist/README.md`](ui_lovelace_minimalist/README.md) for dashboard-level plant documentation.

## Blueprints

[`blueprints/`](blueprints/) contains automation and script blueprints from the community (aderusha, homeassistant, sbyx, niro1987).

## Deployment

Config lives at `/config` on the HA host (named Hestia). The repo is pushed there via the Bitbucket pipeline defined in [`bitbucket-pipelines.yml`](bitbucket-pipelines.yml).
