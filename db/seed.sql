\c ihelp_db;

INSERT INTO addresses (street, apt,  city, state, zip_code) VALUES 
('123 Elm St', '90001', 'Los Angeles', 'CA', '12345'),
('456 Oak St', '10001', 'New York', 'NY', '67890'),
('789 Pine St', '60601', 'Chicago', 'IL', '54321'),
('101 Maple Ave', '77001', 'Houston', 'TX', '98765'),
('202 Birch Rd', '33101', 'Miami', 'FL', '24680');

INSERT INTO organizations (uid, address_id, phone, name, description) VALUES
('bxGXTPH6UXeRvYcSODa14QjmXoL2', 1, '1234567890', 'Developer', 'Developer team only'),
('mtWp8sneeFbF2Jbrq85BIOz5HeC3', 2, '1234567890', 'Community Aid', 'Community volunteer organization'),
('ii3IqDVdvpREe8msqaSYZMKHQX83', 3, '1234567890', 'Care Givers Volunteer', 'Neighborhood assistance service'),
('EE6o4BMsuQaJXYdJ4qD9FEb9dZz2', 4, '1234567890', 'Reach out volunteers', 'A group dedicated to volunteering for various causes'),
('uakdvi5DC4YkL1eyQaQyionZsSi2', 5, '1234567890', 'Hope in act', 'Providing aid to people affected by natural disasters');

INSERT INTO requesters (organization_id, first_name, last_name, phone) VALUES
(1, 'Matthew', 'Anderson', '1235550001'),
(1, 'Isabella', 'Thomas', '1235550002'),
(1, 'Lucas', 'Martinez', '1235550003'),
(1, 'Ava', 'Robinson', '1235550004'),
(1, 'Sophia', 'Clark', '1235550005'),
(1, 'James', 'Lewis', '1235550006'),
(1, 'Emma', 'Walker', '1235550007'),
(1, 'Oliver', 'Hall', '1235550008'),
(1, 'Mia', 'Young', '1235550009'),
(1, 'Ethan', 'Hernandez', '1235550010'),
(1, 'Liam', 'King', '1235550011'),
(1, 'Charlotte', 'Wright', '1235550012'),
(1, 'Amelia', 'Scott', '1235550013'),
(1, 'Benjamin', 'Adams', '1235550014'),
(1, 'Ella', 'Nelson', '1235550015');


INSERT INTO avatars (img_url) VALUES
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Pink-1-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Green-1-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Golden-4-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Green-3-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Yellow-4-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Golden-1-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Golden-3-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Pink-3-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Pink-4-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Pink-2-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/hopstarter/bioman/512/Bioman-Avatar-5-Pink-icon.png'),
('https://icons.iconarchive.com/icons/hopstarter/bioman/512/Bioman-Avatar-4-Yellow-icon.png'),
('https://icons.iconarchive.com/icons/hopstarter/bioman/512/Bioman-Avatar-3-Blue-icon.png'),
('https://icons.iconarchive.com/icons/hopstarter/bioman/512/Bioman-Avatar-2-Green-icon.png'),
('https://icons.iconarchive.com/icons/hopstarter/bioman/512/Bioman-Avatar-6-Peebo-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Orange-4-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Orange-3-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/White-4-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/White-3-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/White-1-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Red-3-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Red-4-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Red-1-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Cyan-2-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Cyan-1-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Cyan-3-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Cyan-4-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Blue-1-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Red-2-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Yellow-2-Robot-Avatar-icon.png'),
('https://icons.iconarchive.com/icons/iconarchive/robot-avatar/512/Blue-4-Robot-Avatar-icon.png');

INSERT INTO volunteers (uid, organization_id, name, email, age, points_earned, avatar_id) VALUES
('OA0fvVp0l8XCwplmtKhjJ6ym7D22', 1, 'Kurt Julien', 'kjulien@pursuit.org', 17, 100, 1),
('2W4gow7VyWO8PXB4o5vAjKP38JB3', 1, 'Marcus Browne', 'mbrowne@pursuit.org', 16, 150, 2),
('wk2skOz9KUOXEqi6HJQDRhq5HN62', 1, 'Shanel Elms', 'selms@pursuit.org', 12, 120, 3),
('bWDLGo3svlbYEDGc2qfXzWnwBdK2', 1, 'Antonio Martinez', 'amartinez@pursuit.org', 15, 90, 3),
('Yhb4UQWh6VSAf0jYBGVjWv0cEYD3', 1, 'Abdel Sayedahmed', 'asayedahmed@pursuit.org', 13, 351, 4),
('Zk2vP9d9nYmcH1lH6REwfB9E2Cw2', 1, 'Emily Carter', 'ecarter@pursuit.org', 18, 200, 5),
('Jj9qL0H5t3XyP8mY3H7RwA1N5Dg5', 1, 'Sophia Li', 'sli@pursuit.org', 19, 175, 6),
('Xn0fB1qYt1GfD6nL3K8WtN2K3Pb5', 1, 'Lucas Nguyen', 'lnguyen@pursuit.org', 14, 80, 7),
('Kc6jR8c2a6WbP2tS9Q3ZrR6A0Cd1', 1, 'Mia Rodriguez', 'mrodriguez@pursuit.org', 16, 300, 8),
('Yp7cH3x4q4XxF8gE2N8ReY5R2Ko6', 1, 'Ethan Brown', 'ebrown@pursuit.org', 15, 220, 9),
('Ap1dF2b8u2VeP3kD0H4KeT4E4Dg8', 1, 'Olivia Smith', 'osmith@pursuit.org', 17, 190, 10);


INSERT INTO request_status (name) VALUES 
('OPEN'), 
('ASSIGNED'), 
('COMPLETE');

INSERT INTO categories (name) VALUES
('Various'),
('Errands'),
('Technology'),
('Cleaning'),
('Pets'),
('Gardening'),
('Tutoring'),
('Meal Prep'),
('Event Setup'),
('Delivery'),
('Sports Coaching'),
('Crafts'),
('Office Assistance');


INSERT INTO requests (organization_id, requester_id, status_id, description, category) VALUES
(1, 1, 1, 'Help with grocery shopping', 'Cleaning'),
(1, 2, 1, 'Assistance with home cleaning', 'Cleaning'),
(1, 3, 2, 'Need a ride to the doctor', 'Errands'),
(1, 4, 3, 'Help moving furniture', 'Cleaning'),
(1, 5, 2, 'Deliver meals to elderly neighbors', 'Errands'),
(1, 6, 1, 'Help set up a new computer', 'Technology'),
(1, 7, 1, 'Prepare meals for the week', 'Meal Prep'),
(1, 8, 2, 'Walk dogs for local residents', 'Pets'),
(1, 9, 2, 'Assist with event setup', 'Various'),
(1, 10, 3, 'Clean up the community park', 'Gardening'),
(1, 11, 1, 'Help with office tasks', 'Office Assistance'),
(1, 12, 2, 'Prepare for sports coaching', 'Sports Coaching');


INSERT INTO request_task (requester_id, organization_id, request_id, point_earnings, task, due_date) VALUES
(1, 1, 1, 50, 'Pick up groceries', '2024-10-10'),
(1, 1, 1, 30, 'Help organize pantry', '2024-10-11'),

(2, 1, 2, 30, 'Dust surfaces', '2024-10-12'),
(2, 1, 2, 40, 'Vacuum carpets', '2024-10-13'),

(3, 1, 3, 40, 'Drive to appointment', '2024-10-14'),

(4, 1, 4, 60, 'Move boxes', '2024-10-15'),
(4, 1, 4, 50, 'Rearrange furniture', '2024-10-16'),

(5, 1, 5, 35, 'Deliver food', '2024-10-17'),

(6, 1, 6, 70, 'Install software', '2024-10-18'),
(6, 1, 6, 60, 'Connect to Wi-Fi', '2024-10-19'),

(7, 1, 7, 50, 'Plan meals', '2024-10-20'),
(7, 1, 7, 40, 'Cook meals', '2024-10-21'),
(7, 1, 7, 30, 'Package meals', '2024-10-22'),

(8, 1, 8, 40, 'Walk dogs in morning', '2024-10-23'),
(8, 1, 8, 30, 'Walk dogs in evening', '2024-10-24'),

(9, 1, 9, 50, 'Set up chairs', '2024-10-25'),
(9, 1, 9, 40, 'Decorate venue', '2024-10-26'),

(10, 1, 10, 60, 'Plant new flowers', '2024-10-27'),
(10, 1, 10, 50, 'Trim hedges', '2024-10-28'),

(11, 1, 11, 35, 'Organize files', '2024-10-29'),
(11, 1, 11, 45, 'Prepare meeting notes', '2024-10-30'),

(12, 1, 12, 50, 'Conduct practice sessions', '2024-10-31');



INSERT INTO rewards (name, description, organization_id, points_required) VALUES
('T-Shirt', 'A branded volunteer T-shirt', 1, 100),
('Gift Card', 'A $20 gift card', 1, 200),
('Backpack', 'A sturdy backpack for volunteers', 1, 150),
('Water Bottle', 'Reusable water bottle', 1, 50),
('Hat', 'A branded volunteer hat', 1, 75);

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
('On my way'),
('At location'),
('Task in progress'),
('Completed'),
('Cancelled');

INSERT INTO assigned_tasks (request_task_id, volunteer_id, task_progress_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 1),
(5, 5, 1),
(6, 6, 2),
(7, 7, 1),
(8, 8, 2),
(9, 9, 3);



INSERT INTO task_status (name) VALUES 
('OPEN'), 
('ASSIGNED'), 
('IN PROGRESS'),
('COMPLETED'),
('CANCELLED');