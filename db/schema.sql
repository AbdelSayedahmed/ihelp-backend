DROP DATABASE IF EXISTS ihelp_db;

CREATE DATABASE ihelp_db;

\c ihelp_db;

CREATE TABLE addresses (
    id SERIAL PRIMARY KEY,
    street VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL,
    state VARCHAR(255) NOT NULL,
    zip_code VARCHAR(255) NOT NULL,
    country VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE organizations (
    uid VARCHAR(255) NOT NULL,
    id SERIAL PRIMARY KEY,
    address_id INT REFERENCES addresses (id) ON DELETE CASCADE,
    phone VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE requesters (
    id SERIAL PRIMARY KEY,
    organization_id INT REFERENCES organizations (id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    phone VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE volunteers (
    uid VARCHAR(255) NOT NULL,
    id SERIAL PRIMARY KEY,
    organization_id INT REFERENCES organizations (id) ON DELETE CASCADE,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    points_earned INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE request_status (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE requests (
    id SERIAL PRIMARY KEY,
    organization_id INT REFERENCES organizations (id) ON DELETE CASCADE,
    volunteer_id INT REFERENCES volunteers (id) ON DELETE CASCADE,
    requester_id INT REFERENCES requesters (id) ON DELETE CASCADE,
    status_id INT REFERENCES request_status (id) ON DELETE CASCADE,
    description TEXT NOT NULL,
    catagory VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE request_task (
    id SERIAL PRIMARY KEY,
    requester_id INT REFERENCES requesters (id) ON DELETE CASCADE,
    organization_id INT REFERENCES organizations (id) ON DELETE CASCADE,
    request_id INT REFERENCES requests (id) ON DELETE CASCADE,
    point_earnings INT NOT NULL,
    task TEXT,
    due_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE rewards (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    organization_id INT REFERENCES organizations (id) ON DELETE CASCADE,
    points_required INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE rewards_earned (
    id SERIAL PRIMARY KEY,
    reward_id INT REFERENCES rewards (id) ON DELETE CASCADE,
    volunteer_id INT REFERENCES volunteers (id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE badges (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    img_url VARCHAR(255) NOT NULL,
    requirement TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE badges_earned (
    id SERIAL PRIMARY KEY,
    volunteer_id INT REFERENCES volunteers (id) ON DELETE CASCADE,
    badge_id INT REFERENCES badges (id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE task_progress (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE assigned_tasks (
    id SERIAL PRIMARY KEY,
    request_task_id INT REFERENCES request_task (id) ON DELETE CASCADE,
    volunteer_id INT REFERENCES volunteers (id) ON DELETE CASCADE,
    task_progress_id INT REFERENCES task_progress (id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
