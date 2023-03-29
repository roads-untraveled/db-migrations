BEGIN;

CREATE TABLE IF NOT EXISTS "stations"
    (
        "id" bigserial,
        "created_at" timestamptz,
        "updated_at" timestamptz,
        "deleted_at" timestamptz,
        "name" text,
        "display_name" text,
        "coordinate_lat" decimal,
        "coordinate_lon" decimal,

            PRIMARY KEY ("id")
    );
CREATE INDEX IF NOT EXISTS "idx_stations_name" ON "stations" ("name");
CREATE INDEX IF NOT EXISTS "idx_stations_deleted_at" ON "stations" ("deleted_at");

CREATE TABLE IF NOT EXISTS "stops" (
    "id" bigserial,
    "created_at" timestamptz,
    "updated_at" timestamptz,
    "deleted_at" timestamptz,
    "station_id" bigint NOT NULL,
    "label" text NOT NULL,
    "coordinate_lat" decimal,
    "coordinate_lon" decimal,

        PRIMARY KEY ("id"),
        CONSTRAINT "fk_stations_stops" FOREIGN KEY ("station_id") REFERENCES "stations"("id")
    );
CREATE INDEX IF NOT EXISTS "idx_stops_deleted_at" ON "stops" ("deleted_at");

COMMIT;