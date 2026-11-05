# Character-crud-API

# Tekken Character API

Character REST API for Tekken fan-site that lists different characters in the series and their profiles, including names, ids, country of origin, fighting style, and a description. Built with Spring Boot using a layered architecture. Data is stored in PostgreSQL (Neon).
The API is now linked with the static page, transforming the static html pages into ftlh files. This, along with an MVC web interface, enables any users to add, delete, or update characters on the site.


## Features

- Create, read, update, and delete fighters
- Partial, case-insensitive search by name
- Filter by fighting style
- Browse, add, view, edit, and delete fighters through a server-rendered web interface
- Bean validation with clear HTTP status codes (400, 404)
- Configured entirely through environment variables (no secrets in the repo)



## Tech Stack

| Area      | Technology                              |
| --------- | --------------------------------------- |
| Language  | Java 25                                 |
| Framework | Spring Boot (Web, Data JPA, Validation) |
| Database  | PostgreSQL on [Neon](https://neon.com)  |
| Build     | Maven                                   |


## Architecture

The application has two controller layers for different clients. Both use the same service, repository, and entity layers.

```
Browser -- fighterUiController -- FreeMarker templates (HTML)
                  |
JSON client -- fighterController
                  |
             fighterService
                  |
          fighterRepository (JPA)
                  |
          fighter entity / PostgreSQL (Neon)
```


### Project Structure

```
src/main/java/com/example/demo/tekkenFighters/
  fighterController.java
  fighterUiController.java
  fighterService.java
  fighterRepository.java
  fighter.java
  fighterNotFoundException.java
src/main/resources/
  application.properties
  templates/                 FreeMarker views for the MVC interface
  static/css/style.css      Web interface styles
  static/thumbnails/         Uploaded pictures and placeholder image
```

## MVC Web Interface

Start the application and open `http://localhost:8080/` to use the browser interface.

| Method | Path                    | Description |
| ------ | ----------------------- | ----------- |
| GET    | `/` or `/characters`        | fighter gallery; optionally filter with `name` and `fighting style` query parameters |
| GET    | `/characters/new`           | Show the new-character-form |
| POST   | `/characters`               | Create a fighter |
| GET    | `/characters/{id}`          | Show fighter details |
| GET    | `/characters/{id}/edit`     | Show the edit form |
| POST   | `/characters/{id}`          | Update fighter details |
| POST   | `/characters/{id}/delete`   | Delete a fighter |
| GET    | `/about`                | Explain the application and its request flow |

The gallery supports the same optional `name` and `fighting style` filters as the JSON API. fighter pictures are served from `/thumbnails/`; when a fighter has no picture, the interface displays `character-placeholder.svg`.


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

### Status codes

| Code | Meaning                                                                             |
| ---- | ----------------------------------------------------------------------------------- |
| 200  | OK                                                                                  |
| 201  | Created                                                                             |
| 204  | Deleted, no content                                                                 |
| 400  | Validation failed or malformed request (for example, an invalid `fighting style` value) |
| 404  | fighter with that id does not exist                                                   |

## Configuration

The app reads its database settings from environment variables. Spring Boot maps these names automatically, so nothing secret is stored in `application.properties`.

| Variable                | Example                                              |
| ----------------------- | ---------------------------------------------------- |
| `SPRING_DATASOURCE_URL` | `jdbc:postgresql://<neon-host>/<db>?sslmode=require` |
| `PORT`                  | Set by Render; defaults to `8080` locally            |

## Running Locally

1. Create a Neon project and gather your connection details.
2. Set the `SPRING_DATASOURCE_URL` environment variable.
   - Mac/Linux: `export SPRING_DATASOURCE_URL="jdbc:postgresql://<neon-host>/<db>?sslmode=require"`
   - Windows: `set SPRING_DATASOURCE_URL=jdbc:postgresql://<neon-host>/<db>?sslmode=require`
   - PowerShell: `$env:SPRING_DATASOURCE_URL="jdbc:postgresql://<neon-host>/<db>?sslmode=require"`
3. Start the app:

```bash
./mvnw spring-boot:run        # Mac / Linux
.\mvnw.cmd spring-boot:run    # Windows
```

4. Visit `http://localhost:8080/` for the MVC web interface or `http://localhost:8080/api/characters` for the JSON API. A fresh database returns an empty fighter list.

Hibernate creates the `characters` table automatically on first run (`spring.jpa.hibernate.ddl-auto=update`).

## Deployment (Render)

Render has no native Java runtime, so the app is deployed with Docker.

1. Add a `Dockerfile` at the repository root:

```dockerfile
FROM eclipse-temurin:25-jdk-alpine AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn -q -DskipTests package

FROM eclipse-temurin:25-jre-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
ENTRYPOINT ["java", "-XX:MaxRAMPercentage=75", "-jar", "app.jar"]
```

2. Push the repository to GitHub.
3. In Render, create a **Web Service**, connect the repo, choose the **Docker** runtime and the **Free** instance type.
4. Add the `SPRING_DATASOURCE_URL` environment variable (value only, no quotes).
5. Deploy, then open `https://<your-service>.onrender.com/api/characters`.

### Free-tier notes

- Render free services sleep after roughly 15 minutes of inactivity, so the first request afterward can take up to a minute.
- Neon scales idle databases to zero, which adds a short delay on the first query.
- Render's file system is ephemeral. All persistent data lives in Neon.