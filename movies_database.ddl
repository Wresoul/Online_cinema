CREATE SCHEMA IF NOT EXISTS content;

CREATE TABLE IF NOT EXISTS content.film_work (
    id uuid PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT,
    creation_date DATE,
    rating FLOAT,
    type TEXT NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone
);

CREATE TABLE IF NOT EXISTS content.person (
    id uuid PRIMARY KEY,
    full_name VARCHAR(50) NOT NULL,
    created timestamp with time zone,
    modified timestamp with time zone
);

CREATE TABLE IF NOT EXISTS content.genre (
    id uuid PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    created timestamp with time zone,
    modified timestamp with time zone
);

CREATE TABLE IF NOT EXISTS content.genre_film_work (
    id uuid PRIMARY KEY,
    genre_id uuid NOT NULL,
    film_work_id uuid NOT NULL,
    FOREIGN KEY (genre_id) REFERENCES genre(id),
    FOREIGN KEY (film_work_id) REFERENCES film_work(id),
    role VARCHAR(50) NOT NULL,
    created timestamp with time zone
);

CREATE TABLE IF NOT EXISTS content.person_film_work (
    id uuid PRIMARY KEY,
    film_work_id uuid NOT NULL,
    person_id uuid NOT NULL,
    FOREIGN KEY (film_work_id) REFERENCES film_work(id),
    FOREIGN KEY (person_id) REFERENCES person(id),
    role VARCHAR(50) NOT NULL,                                                                                                                                             created timestamp with time zone
);

CREATE INDEX IF NOT EXISTS idx_film_work_title ON content.film_work (title);

CREATE INDEX IF NOT EXISTS idx_person_full_name ON content.person (full_name);

CREATE UNIQUE INDEX IF NOT EXISTS idx_genre_name ON content.genre (name);

CREATE UNIQUE INDEX IF NOT EXISTS idx_film_work_person ON content.person_film_work (film_work_id, person_id);

CREATE UNIQUE INDEX IF NOT EXISTS idx_film_work_genre ON content.genre_film_work (film_work_id, genre_id);