# Character-REST-API

# Tekken Character API

Character REST API for Tekken fan-site that lists different characters in the series and their profiles, including names, ids, country of origin, fighting style, and a description. Built with Spring Boot using a layered architecture. Data is stored in PostgreSQL (Neon).

## Data Model

**fighter** (table `characters`)

| Field | Type | Rules |
|-------|------|-------|
| `id` | Long | Generated automatically |
| `name` | String | Required, not blank |
| `country` | String | Required, not blank |
| `fighting style` | String | Required, not blank |
| `description` | String | Required, not blank |

## API Reference

Base path: `/api/characters`

| Method | Path | Description | Success |
|--------|------|-------------|---------|
| GET | `/api/characters` | List all characters (supports filters below) | 200 |
| GET | `/api/characters/{id}` | Get one character | 200 |
| POST | `/api/characters` | Create a character | 201 |
| PUT | `/api/characters/{id}` | Replace a character's fields | 200 |
| DELETE | `/api/characters/{id}` | Delete a character | 204 |

### Example request

```http
POST /api/characters
Content-Type: application/json

{
  "name": "Kazuya Mishima",
  "country": "Japan",
  "fighting style": "Mishima-style karate",
  "description": "Son of Heihachi and father of Jin"
}
```

```http
PUT /api/characters/{id}
Content-Type: application/json

{
  "name": "Kazuya Mishima",
  "country": "Japan",
  "fighting style": "Mishima-style karate",
  "description": "Son of Heihachi and father of Jin, HUSBAND OF JUN"
}
```

Open `https://character-rest-api-168d.onrender.com/api/characters`.

# Cold-Start

- Render free services sleep after roughly 15 minutes of inactivity, so the first request afterward can take up to a minute.
- Neon scales idle databases to zero, which adds a short delay on the first query.
- Render's file system is ephemeral. All persistent data lives in Neon.