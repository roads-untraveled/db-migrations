# DB-migrations

This repository hold all migrations for databases. This repositories `master` branch is source fo truth for current state fo DB.


## How to

For operating with migrations use [migrate](https://github.com/golang-migrate/migrate) cli tool

### Create new migration
```bash
#migrate create -ext sql -dir <path_to_migration_folder> -seq <name_of_migration>

migrate create -ext sql -dir postgres/mig -seq init
```

### Apply | undo migration
```bash
#migrate -database <db_url> -path <path_to_migration_folder> < up | down >

postgresql_url='postgres://postgres:password@localhost:5432/example?sslmode=disable'    \
   migrate -database ${postgresql_url} -path postgres/mig up
```

---

### Advance usage
`Migrate` supports various source like GithHub... For more info about GB see [doc](https://github.com/golang-migrate/migrate/tree/master/source/github)
```bash
#imigrate  -source <source_gh_url> -database <db_url> < up | down >

source .env
source .env.dev
postgresql_url='postgres://postgres:password@localhost:5432/example?sslmode=disable' \
migrate \
    -source "github://${RU_user}:${RU_pac}@${RU_owner}/${RU_repo}/${RU_path}#${ref}" \
    -database ${postgresql_url} \
    up
```

## TODO
- github action