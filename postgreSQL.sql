-- Table for Vehicles
CREATE TABLE Vehicle (
    vehicle_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    model VARCHAR(100),
    manufacturer VARCHAR(100),
    cost_in_credits DECIMAL(10, 2),
    length DECIMAL(10, 2),
    max_atmosphering_speed DECIMAL(10, 2),
    crew INT,
    passengers INT,
    cargo_capacity INT,
    consumables VARCHAR(100),
    vehicle_class VARCHAR(100)
);

-- Table for Starships
CREATE TABLE Starship (
    starship_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    model VARCHAR(100),
    manufacturer VARCHAR(100),
    cost_in_credits DECIMAL(10, 2),
    length DECIMAL(10, 2),
    max_atmosphering_speed DECIMAL(10, 2),
    crew INT,
    passengers INT,
    cargo_capacity INT,
    consumables VARCHAR(100),
    hyperdrive_rating DECIMAL(10, 2),
    MGLT INT,
    starship_class VARCHAR(100)
);

-- Table for Planets
CREATE TABLE Planet (
    planet_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    rotation_period DECIMAL(10, 2),
    orbital_period DECIMAL(10, 2),
    diameter DECIMAL(10, 2),
    climate VARCHAR(100),
    gravity VARCHAR(100),
    terrain VARCHAR(100),
    surface_water DECIMAL(10, 2),
    population INT
);

-- Table for Species
CREATE TABLE Species (
    species_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    classification VARCHAR(100),
    designation VARCHAR(100),
    average_height DECIMAL(10, 2),
    skin_colors VARCHAR(100),
    hair_colors VARCHAR(100),
    eye_colors VARCHAR(100),
    average_lifespan INT,
    language VARCHAR(100),
    homeworld INT,
    FOREIGN KEY (homeworld) REFERENCES Planet(planet_id) ON DELETE SET NULL
);

-- Table for Films
CREATE TABLE Films (
    film_id SERIAL PRIMARY KEY,
    film VARCHAR(100),
    budget DECIMAL(15, 2),
    worldwide_box_office_gross DECIMAL(15, 2),
    us_release_date DATE,
    director VARCHAR(100),
    screenwriter VARCHAR(100),
    story_by VARCHAR(100),
    producer VARCHAR(100)
);

-- Table for Characters
CREATE TABLE Character (
    char_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    height DECIMAL(10, 2),
    mass DECIMAL(10, 2),
    hair_color VARCHAR(100),
    skin_color VARCHAR(100),
    eye_color VARCHAR(100),
    birth_year VARCHAR(10),
    sex VARCHAR(10),
    gender VARCHAR(10),
    homeworld INT,
    species INT,
    FOREIGN KEY (homeworld) REFERENCES Planet(planet_id) ON DELETE SET NULL,
    FOREIGN KEY (species) REFERENCES Species(species_id) ON DELETE SET NULL
);

-- Table for Filmography
CREATE TABLE Filmography (
    char_filmid SERIAL PRIMARY KEY,
    char_id INT,
    film_id INT,
    FOREIGN KEY (char_id) REFERENCES Character(char_id) ON DELETE CASCADE,
    FOREIGN KEY (film_id) REFERENCES Films(film_id) ON DELETE CASCADE
);

-- Table for Character-Starships
CREATE TABLE Char_Starships (
    char_ship_id SERIAL PRIMARY KEY,
    starship_id INT,
    char_id INT,
    FOREIGN KEY (starship_id) REFERENCES Starship(starship_id) ON DELETE CASCADE,
    FOREIGN KEY (char_id) REFERENCES Character(char_id) ON DELETE CASCADE
);

-- Table for Character-Vehicles
CREATE TABLE Char_Vehicles (
    char_vech_id SERIAL PRIMARY KEY,
    vech_id INT,
    char_id INT,
    FOREIGN KEY (vech_id) REFERENCES Vehicle(vehicle_id) ON DELETE CASCADE,
    FOREIGN KEY (char_id) REFERENCES Character(char_id) ON DELETE CASCADE
);
