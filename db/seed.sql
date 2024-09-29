\c ihelp_db;

INSERT INTO addresses (street, city, state, zip_code, country) VALUES 
('123 Elm St', 'Los Angeles', 'CA', '90001', 'USA'),
('456 Oak St', 'New York', 'NY', '10001', 'USA'),
('789 Pine St', 'Chicago', 'IL', '60601', 'USA'),
('101 Maple Ave', 'Houston', 'TX', '77001', 'USA'),
('202 Birch Rd', 'Miami', 'FL', '33101', 'USA');

INSERT INTO organizations (address_id, phone, name, description) VALUES
(1, '555-1234', 'Helping Hands', 'A non-profit that helps people in need'),
(2, '555-5678', 'Care Volunteers', 'Community volunteer organization'),
(3, '555-9101', 'Good Neighbors', 'Neighborhood assistance service'),
(4, '555-1122', 'Volunteer Heroes', 'A group dedicated to volunteering for various causes'),
(5, '555-3344', 'Aid Action', 'Providing aid to people affected by natural disasters');

INSERT INTO requesters (org_id, name, phone) VALUES
(1, 'John Doe', '555-0001'),
(2, 'Jane Smith', '555-0002'),
(3, 'Bob Johnson', '555-0003'),
(4, 'Alice Davis', '555-0004'),
(5, 'Charlie Brown', '555-0005');

INSERT INTO volunteers (uid, organization_id, name, email, age, points_earned) VALUES
('OA0fvVp0l8XCwplmtKhjJ6ym7D22', 1, 'Kurt Julien', 'kjulien@pursuit.org', 25, 100),
('2W4gow7VyWO8PXB4o5vAjKP38JB3', 2, 'Marcus Browne', 'mbrowne@pursuit.org', 30, 150),
('wk2skOz9KUOXEqi6HJQDRhq5HN62', 3, 'Shanel Elms', 'selms@pursuit.org', 22, 120),
('bWDLGo3svlbYEDGc2qfXzWnwBdK2', 4, 'Antonio Martinez', 'amartinez@pursuit.org', 28, 90),
('Yhb4UQWh6VSAf0jYBGVjWv0cEYD3', 5, 'Abdel Sayedahmed', 'asayedahmed@pursuit.org', 20, 351);

INSERT INTO requests (org_id, volunteer_id, requester_id, status_id, description) VALUES
(1, 1, 1, 1, 'Help with grocery shopping'),
(2, 2, 2, 1, 'Assistance with home cleaning'),
(3, 3, 3, 2, 'Need a ride to the doctor'),
(4, 4, 4, 3, 'Help moving furniture'),
(5, 5, 5, 2, 'Deliver meals to elderly neighbors');

INSERT INTO request_status (name) VALUES 
('OPEN'), 
('ASSIGNED'), 
('COMPLETE'), 
('COMPLETE');

INSERT INTO request_task (requester_id, organization_id, request_id, point_earnings, due_date) VALUES
(1, 1, 1, 50, '2024-09-30'),
(2, 2, 2, 30, '2024-10-01'),
(3, 3, 3, 40, '2024-10-02'),
(4, 4, 4, 60, '2024-10-03'),
(5, 5, 5, 35, '2024-10-04');

INSERT INTO rewards (name, description, organization_id, points_required) VALUES
('T-Shirt', 'A branded volunteer T-shirt', 1, 100),
('Gift Card', 'A $20 gift card', 2, 200),
('Backpack', 'A sturdy backpack for volunteers', 3, 150),
('Water Bottle', 'Reusable water bottle', 4, 50),
('Hat', 'A branded volunteer hat', 5, 75);

INSERT INTO rewards_earned (reward_id, volunteer_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO badges (name, description, img_url, requirement) VALUES
('Beginner Volunteer', 'Completed first task', 'badge1.png', 'Complete 1 task'),
('Active Volunteer', 'Completed 5 tasks', 'badge2.png', 'Complete 5 tasks'),
('Super Volunteer', 'Completed 10 tasks', 'badge3.png', 'Complete 10 tasks'),
('Community Hero', 'Completed 20 tasks', 'badge4.png', 'Complete 20 tasks'),
('Legendary Volunteer', 'Completed 50 tasks', 'badge5.png', 'Complete 50 tasks');

INSERT INTO badges_earned (volunteer_id, badge_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

INSERT INTO task_progress (name) VALUES
('Not Started'),
('In Progress'),
('Completed'),
('On Hold'),
('Cancelled');

INSERT INTO assigned_tasks (request_task_id, volunteer_id, task_progress_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 2),
(5, 5, 1);
