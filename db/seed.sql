\c ihelp_db;

INSERT INTO
    organizations (name, phone, address, description, email)
VALUES
    (
        'Helping Hands',
        '555-1234',
        '123 Charity St, Kindville',
        'A non-profit organization focused on helping the needy.',
        'contact@helpinghands.org'
    ),
    (
        'Volunteer Squad',
        '555-5678',
        '456 Care Ave, Compassion City',
        'A group that connects volunteers with causes in need.',
        'info@volunteersquad.org'
    );

-- Seeding the 'requesters' table
INSERT INTO
    requesters (name, email, phone, organization, address)
VALUES
    (
        'John Doe',
        'john.doe@email.com',
        '555-1010',
        'Helping Hands',
        '123 Charity St, Kindville'
    ),
    (
        'Jane Smith',
        'jane.smith@email.com',
        '555-2020',
        'Volunteer Squad',
        '456 Care Ave, Compassion City'
    );

-- Seeding the 'volunteers' table
INSERT INTO
    volunteers (name, email, age, organization, points)
VALUES
    (
        'Alice Johnson',
        'alice.johnson@email.com',
        25,
        'Helping Hands',
        100
    ),
    (
        'Bob Roberts',
        'bob.roberts@email.com',
        30,
        'Volunteer Squad',
        200
    );

-- Seeding the 'requests' table
INSERT INTO
    requests (
        organization,
        volunteer_id,
        requester_id,
        status,
        description,
        due_date
    )
VALUES
    (
        'Helping Hands',
        1,
        1,
        'pending',
        'Assist with organizing donations',
        '2024-12-01 10:00:00'
    ),
    (
        'Volunteer Squad',
        2,
        2,
        'completed',
        'Help set up community event',
        '2024-09-30 12:00:00'
    );

-- Seeding the 'rewards' table
INSERT INTO
    rewards (
        name,
        description,
        organization_id,
        points_required
    )
VALUES
    (
        'Free Coffee',
        'Redeem for a free coffee at local café.',
        1,
        50
    ),
    (
        'T-shirt',
        'Get a branded T-shirt for your efforts.',
        2,
        150
    );

-- Seeding the 'volunteer_rewards' table
INSERT INTO
    volunteer_rewards (reward_id, volunteer_id)
VALUES
    (1, 1),
    (2, 2);

-- Seeding the 'game_progress' table
INSERT INTO
    game_progress (volunteer_id, current_level)
VALUES
    (1, 5),
    (2, 7);

-- Seeding the 'badges' table
INSERT INTO
    badges (name, description, icon_url, required_tasks)
VALUES
    (
        'Helping Hero',
        'Awarded for completing 10 tasks.',
        'hero_icon.png',
        '10 tasks'
    ),
    (
        'Event Master',
        'Awarded for organizing 5 events.',
        'event_master_icon.png',
        '5 events'
    );

-- Seeding the 'volunteer_badges' table
INSERT INTO
    volunteer_badges (volunteer_id, badge_id)
VALUES
    (1, 1),
    (2, 2);