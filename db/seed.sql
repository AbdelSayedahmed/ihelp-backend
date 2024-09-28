\c ihelp_db;

INSERT INTO
    addresses (street, city, state, zip_code, country)
VALUES
    (
        '123 Main St',
        'Springfield',
        'IL',
        '62701',
        'USA'
    ),
    ('456 Oak St', 'Metropolis', 'NY', '10001', 'USA');

INSERT INTO
    organizations (address_id, phone, name, description)
VALUES
    (
        1,
        '555-1234',
        'Helping Hands',
        'Non-profit organization focused on community support.'
    ),
    (
        2,
        '555-5678',
        'Care Network',
        'A group helping the elderly and disabled.'
    );

INSERT INTO
    requesters (org_id, name, phone)
VALUES
    (1, 'John Doe', '555-9876'),
    (2, 'Jane Smith', '555-4321');

INSERT INTO
    volunteers (organization_id, name, email, age, points_earned)
VALUES
    (1, 'Alice Johnson', 'alice@example.com', 28, 50),
    (2, 'Bob Williams', 'bob@example.com', 32, 100);

INSERT INTO
    rewards (
        name,
        description,
        organization_id,
        points_required
    )
VALUES
    ('Gift Card', 'A $25 gift card', 1, 100),
    ('T-Shirt', 'A branded T-shirt', 2, 50);

INSERT INTO
    rewards_earned (reward_id, volunteer_id)
VALUES
    (1, 2),
    (2, 1);

INSERT INTO
    badges (name, description, img_url, requirement)
VALUES
    (
        'Helping Hero',
        'Awarded for completing 10 tasks.',
        'https://example.com/hero.png',
        'Complete 10 tasks'
    ),
    (
        'Community Star',
        'Awarded for helping 5 different requesters.',
        'https://example.com/star.png',
        'Help 5 requesters'
    );

INSERT INTO
    badges_earned (volunteer_id, badge_id)
VALUES
    (1, 1),
    (2, 2);

INSERT INTO
    task_progress (name)
VALUES
    ('Not Started'),
    ('In Progress'),
    ('Completed');

INSERT INTO
    requests (
        org_id,
        volunteer_id,
        requester_id,
        status_id,
        description
    )
VALUES
    (
        1,
        1,
        1,
        1,
        'Assist with grocery shopping for the elderly.'
    ),
    (
        2,
        2,
        2,
        2,
        'Help with lawn mowing and yard work.'
    );

INSERT INTO
    request_task (
        requester_id,
        organization_id,
        request_id,
        point_earnings,
        due_date
    )
VALUES
    (1, 1, 1, 10, '2024-10-10'),
    (2, 2, 2, 15, '2024-11-15');

INSERT INTO
    assigned_tasks (request_task_id, volunteer_id, task_progress_id)
VALUES
    (1, 1, 3),
    (2, 2, 2);