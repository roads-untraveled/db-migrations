BEGIN;

CREATE TABLE IF NOT EXISTS importers (
    id      SERIAL  NOT NULL,
    name    TEXT    NOT NULL
);
ALTER TABLE importers ADD CONSTRAINT pk_importers PRIMARY KEY (id);
ALTER TABLE importers ADD CONSTRAINT uc_importers_name UNIQUE (name);

CREATE TABLE IF NOT EXISTS stations (
    id              SERIAL          NOT NULL,
    importers_id    INTEGER         NOT NULL,
    created_at      TIMESTAMP       NOT NULL,
    updated_at      TIMESTAMP       NOT NULL,
    deleted_at      TIMESTAMP               ,
    name            TEXT            NOT NULL,
    display_name    TEXT                    ,
    coordinate_lat  DECIMAL(10, 0)          ,
    coordinate_lon  DECIMAL(10, 0)        --,
);
ALTER TABLE stations ADD CONSTRAINT pk_stations PRIMARY KEY (id);
ALTER TABLE stations ADD CONSTRAINT uc_stations_deleted_at  UNIQUE (deleted_at);
ALTER TABLE stations ADD CONSTRAINT uc_stations_name        UNIQUE (name);

CREATE TABLE IF NOT EXISTS stops (
    id              SERIAL          NOT NULL,
    stations_id     INTEGER                 ,
    created_at      TIMESTAMP       NOT NULL,
    updated_at      TIMESTAMP       NOT NULL,
    deleted_at      TIMESTAMP               ,
    label           TEXT            NOT NULL,
    coordinate_lat  DECIMAL(10, 0)          ,
    coordinate_lon  DECIMAL(10, 0)        --,
);
ALTER TABLE stops ADD CONSTRAINT pk_stops PRIMARY KEY (id);
ALTER TABLE stops ADD CONSTRAINT uc_stops_deleted_at UNIQUE (deleted_at);
ALTER TABLE stops ADD CONSTRAINT uc_stops_label UNIQUE (label);

ALTER TABLE stations ADD CONSTRAINT fk_stations_importers FOREIGN KEY (importers_id) REFERENCES importers (id) ON DELETE RESTRICT;

ALTER TABLE stops ADD CONSTRAINT fk_stops_stations FOREIGN KEY (stations_id) REFERENCES stations (id) ON DELETE NO ACTION;

COMMIT;