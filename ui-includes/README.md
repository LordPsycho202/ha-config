# UI Includes

Shared YAML components included by multiple dashboards.

---

## `alerts.yaml`

Chip-row cards for the Minimalist dashboard header area. Each entry is a `conditional` chip that displays only when a plant has a problem.

**Trigger conditions (all must be true for a chip to show):**
1. `plant.*` entity state is not `ok`
2. `input_boolean.plant_notify_*` is `on` for that plant
3. Recent rainfall cooldown has expired (`input_number.recent_rain_config`)

**Chip content:** Dynamically shows the specific problem (Low moisture, High moisture, Cold, Hot, Low conductivity) with an appropriate icon, plant name, current moisture reading, and a tap action that navigates to the plant's subview.

One chip block per plant. Currently active plants:
- Front Yard: front_flowers, juniper, camellia, japanese_holly, holly, lavender, stick
- Potted Plants: japanese_maple, hydrangea, pineapples, pineapple
- Indoor Greenhouse: rose, steve, fairy_washboard, michael
- Garden Plots: herbs, strawberry, amaranth

---

## `decluttering.yaml`

Reusable card templates for `custom:decluttering-card`. Reduces duplication across the ~30 plant subviews.

| Template | Purpose |
|----------|---------|
| `plant_subview` | Full plant detail subview — mushroom status card + sensor graph chips + notification toggle |
| `plant_graphs` | Sensor history graphs (moisture, temperature, conductivity, battery) |
| `plant_mushroom_card` | Mushroom template card showing plant state with human-readable problem descriptions and contextual icons |
| `plant_notification_card` | Notification toggle card for a plant |

### `plant_subview` variables

| Variable | Description |
|----------|-------------|
| `plant` | Entity ID suffix — `plant.{plant}` |
| `plant_path` | Navigation path for tap actions (e.g. `plant_herbs`) |
| `plant_icon` | MDI icon name without prefix (e.g. `leaf`) |
| `sensor_batt` | Battery sensor entity (e.g. `sensor.soil_moisture_4_batt`) |

---

## `space_maps/`

Floor plan image cards:
- `downstairsMap.yaml` — Downstairs floor plan
- `upstairsMap.yaml` — Upstairs floor plan

These are also duplicated at the `ui-includes/` root level (`downstairsMap.yaml`, `upstairsMap.yaml`) — the `space_maps/` subdirectory versions are the canonical copies.
