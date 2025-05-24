# pg-flyway-migrate

A Helm chart to run Flyway-based database migrations against a PostgreSQL instance.  
Designed for CI/CD pipelines and GitOps workflows (ArgoCD/ApplicationSet-ready).

---

## 📌 Features

- Supports automatic DB creation using `bitnami/postgresql` client
- Clones migration files from Git (via `alpine/git`)
- Runs Flyway migrations (`flyway/flyway`)
- Parameterized values (image versions, git, DB, etc.)
- Bitnami-style chart structure

---

## 🛠️ Configuration

You can override the default values using `override.yml`. Example:

```yaml
db:
  host: postgres
  port: 5432
  dbName: dbname
  user: postgres
  password: "securePassword"

migrations:
  git:
    host: git.example.com
    username: readonly
    repository: /rnd/dbname.git
    ref: master
```