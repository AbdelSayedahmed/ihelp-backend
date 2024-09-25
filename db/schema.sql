DROP DATABASE IF EXISTS ihelp_db;
CREATE DATABASE ihelp_db;

\c ihelp_db;

CREATE TABLE requesters (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    phone TEXT NOT NULL,
    organization TEXT NOT NULL,
    address TEXT NOT NULL,
)

CREATE TABLE volunteers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL,
    age INT NOT NULL,
    organization TEXT NOT NULL,
    points INT NOT NULL,
)

CREATE TABLE requests (
    id SERIAL PRIMARY KEY,
    organization TEXT NOT NULL,
    volunteer_id TEXT REFERENCES volunteers(id),
    requester_id TEXT REFERENCES requesters(id),
    status TEXT NOT NULL,
    description TEXT NOT NULL,
    due_date TIMESTAMP NOT NULL,
)

CREATE TABLE organizations (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    phone TEXT NOT NULL,
    address TEXT NOT NULL,
    description TEXT NOT NULL,
    email TEXT NOT NULL,
)

CREATE TABLE rewards (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    organization_id TEXT REFERENCES organizations(id),
    points_required INT NOT NULL,
)

CREATE TABLE volunteer_rewards (
    id SERIAL PRIMARY KEY,
    reward_id TEXT REFERENCES rewards(id),
    volunteer_id TEXT REFERENCES volunteers(id),
)

CREATE TABLE game_progress (
    id SERIAL PRIMARY KEY,
    volunteer_id TEXT REFERENCES volunteers(id),
    current_level INT NOT NULL,
)

CREATE TABLE volunteer_badges (
    id SERIAL PRIMARY KEY,
    volunteer_id TEXT REFERENCES volunteers(id),
    badge_id TEXT REFERENCES badges(id),
)

CREATE TABLE badges (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT NOT NULL,
    icon_url TEXT NOT NULL,
    required_tasks TEXT NOT NULL,
)