# UI Lovelace Minimalist Dashboard

The primary daily-driver dashboard. Mobile-first with tap-bar navigation.

Built on the [UI Lovelace Minimalist](https://ui-lovelace-minimalist.github.io/UI/) framework, which provides a library of `custom:button-card` templates.

Entry point: [`dashboard/ui-lovelace.yaml`](dashboard/ui-lovelace.yaml)

---

## View Numbering Convention

Files use a numeric prefix that groups related views together:

| Range | Area |
|-------|------|
| `10-*` | Downstairs rooms |
| `20-*` | Upstairs rooms |
| `25-*` | Utilities |
| `30-*` | Garden |
| `35-*` | Chores |
| `40-*` | Weather |
| `50-*` | Security |
| `60-*` | Network |
| `70-*` | Admin |
| `80-*` / `90-*` | Pseudo-popup alert panels |

Top-level views live in `dashboard/views/`. Drill-down subviews live in `dashboard/subviews/`. Alert panel overlays live in `dashboard/alert-panels/`.

---

## Garden Views (`30-*`)

### Main Garden View (`views/30-garden.yaml`)

Always-visible section summaries (Good / Needs Attention counts) + `custom:auto-entities` grids filtered by HA label. Plants with `problem` state sort to the top. Tap any plant chip for `more-info`.

### Plant Subviews (`subviews/30-*.yaml`)

Each plant has its own subview rendered via the `plant_subview` decluttering template (defined in [`ui-includes/decluttering.yaml`](../ui-includes/decluttering.yaml)).

Variables:
- `plant` — entity ID suffix (e.g. `herbs` → `plant.herbs`)
- `plant_path` — navigation path used by the back button
- `plant_icon` — MDI icon name without `mdi:` prefix
- `sensor_batt` — battery sensor entity ID

### Plant Labels (HA Labels)

`auto-entities` filters in the garden view use HA Labels assigned to each `plant.*` entity. Labels must be created and assigned in **HA Settings → Labels**.

| Label | Plants |
|-------|--------|
| `frontyard` | front_flowers, juniper, camellia, japanese_holly, holly, lavender, stick |
| `potted_plants` | japanese_maple, hydrangea, pineapples, pineapple |
| `indoor_greenhouse` | rose, steve, fairy_washboard, michael |
| `garden` | herbs, strawberry, amaranth |

Adding a new plant to a section only requires assigning the correct label — no dashboard YAML edits needed.

### Garden Admin (`subviews/30-51-admin.yaml`)

Controls for:
- Per-plant notification toggles (grouped by section)
- Auto-watering schedules and durations
- Manual garden/flower bed watering override
- Indoor greenhouse light schedule and timelapse toggle
- Sensor battery states

### Timelapse (`subviews/30-50-timelapse.yaml`)

Indoor greenhouse timelapse viewer.

---

## Custom Cards (`custom_cards/`)

Local `custom:button-card` templates extending the ULM library:

| Card | Purpose |
|------|---------|
| `custom_card_rnissen_room` | Room summary card showing temperature/climate state |
| `custom_card_rnissen_entities` | 4-entity compact card (used for irrigation zone valves) |
| `custom_card_rnissen_weather` | Weather summary card |
| `custom_card_rnissen_garage` | Garage door status card |
| `custom_card_esh_room` | Community room card |
| `custom_card_esh_welcome` | Community welcome/greeting card |
| `custom_card_fan_room` | Fan control room card |
| `custom_card_eraycetinay_lock` | Lock status card |
| `custom_card_haven_washer` | Washer/dryer status card |

---

## Shared Includes (`ui-includes/`)

See [`ui-includes/README.md`](../ui-includes/README.md).

---

## Irrigation (Valve Entities)

Zone valves migrated from `switch.*` to `valve.*` domain. States are `open`/`closed` (not `on`/`off`).

| Entity | Zone |
|--------|------|
| `valve.waterbender_back_yard_zone` | Back yard |
| `valve.waterbender_front_yard_zone` | Front yard |
| `valve.waterbender_side_yards_garden_zone` | Side yards / garden plots |
| `valve.waterbender_flower_beds_zone` | Flower beds |
| `valve.smart_hose_tap_timer_zone` | Smart hose tap (rain delay master) |
| `valve.sprinklers` | Sprinkler group valve |
