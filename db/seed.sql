\c ihelp_db;

INSERT INTO addresses (street, apt, city, state, zip_code) VALUES 
('123 Elm St', '90001', 'Manhattan', 'NY', '12345'),
('456 Oak St', '10001', 'Brooklyn', 'NY', '67890'),
('789 Pine St', '60601', 'Queens', 'NY', '54321'),
('101 Maple Ave', '77001', 'Bronx', 'NY', '98765'),
('202 Birch Rd', '33101', 'Staten Island', 'NY', '24680');


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



INSERT INTO volunteers (uid, organization_id, name, email, age, points_earned, hours_earned, avatar_id) VALUES
('OA0fvVp0l8XCwplmtKhjJ6ym7D22', 1, 'Kurt Julien', 'kjulien@pursuit.org', 17, 100, 10, 1),
('2W4gow7VyWO8PXB4o5vAjKP38JB3', 1, 'Marcus Browne', 'mbrowne@pursuit.org', 16, 20, 2, 2),
('wk2skOz9KUOXEqi6HJQDRhq5HN62', 1, 'Shanel Elms', 'selms@pursuit.org', 12, 180, 15, 3),
('bWDLGo3svlbYEDGc2qfXzWnwBdK2', 1, 'Antonio Martinez', 'amartinez@pursuit.org', 15, 80, 7, 4),
('Yhb4UQWh6VSAf0jYBGVjWv0cEYD3', 1, 'Abdel Sayedahmed', 'asayedahmed@pursuit.org', 13, 60, 6, 5),
('Zk2vP9d9nYmcH1lH6REwfB9E2Cw2', 1, 'Emily Carter', 'ecarter@pursuit.org', 18, 120, 12, 6),
('Jj9qL0H5t3XyP8mY3H7RwA1N5Dg5', 1, 'Sophia Li', 'sli@pursuit.org', 19, 160, 14, 7),
('Xn0fB1qYt1GfD6nL3K8WtN2K3Pb5', 1, 'Lucas Nguyen', 'lnguyen@pursuit.org', 14, 70, 7, 8),
('Kc6jR8c2a6WbP2tS9Q3ZrR6A0Cd1', 1, 'Mia Rodriguez', 'mrodriguez@pursuit.org', 16, 85, 8, 9),
('Yp7cH3x4q4XxF8gE2N8ReY5R2Ko6', 1, 'Ethan Brown', 'ebrown@pursuit.org', 15, 180, 16, 10),
('Ap1dF2b8u2VeP3kD0H4KeT4E4Dg8', 1, 'Olivia Smith', 'osmith@pursuit.org', 17, 150, 15, 11),
('jdc7HdF9YIVT7MgmULrrP8ETPg63', 1, 'Kevin Roberts', 'kroberts@pursuit.org', 18, 0, 0, 12); 





INSERT INTO categories (name) VALUES
('Various'),--1
('Errands'),--2
('Technology'),--3
('Cleaning'),--4
('Pets'),--5
('Gardening'),--6
('Tutoring'),--7
('Meal Prep'),--8
('Event Setup'),--9
('Sports Coaching'),--10
('Crafts'),--11
('Office Assistance');--12

INSERT INTO request_status (name) VALUES 
('OPEN'), 
('ASSIGNED'), 
('IN PROGRESS'), 
('COMPLETE');

INSERT INTO requests (organization_id, requester_id, status_id, description, hours_needed, due_date, category_id, event_time) VALUES
-- OPEN Requests (8 total - mix of 1-4 tasks)
(1, 1, 1, 'Help organize community event setup and cleanup', 8, '2024-03-25', 9, '09:00'),
(1, 2, 1, 'Senior home technology assistance needed', 6, '2024-03-28', 3, '10:30'),
(1, 3, 1, 'Weekly meal prep for elderly couple', 5, '2024-03-30', 8, '08:00'),
(1, 4, 2, 'Garden maintenance and landscaping help', 6, '2024-04-01', 6, '07:30'),
(1, 5, 1, 'Pet care assistance needed', 4, '2024-04-02', 5, '08:00'),
(1, 6, 1, 'Help with grocery shopping and organizing', 3, '2024-04-03', 2, '11:00'),
(1, 7, 1, 'Math tutoring for middle school student', 2, '2024-04-05', 7, '15:30'),
(1, 8, 1, 'Office filing and organization', 2, '2024-04-06', 12, '13:00'),

-- ASSIGNED Requests (6 total)
(1, 9, 2, 'Sports coaching for youth basketball team', 6, '2024-03-27', 10, '16:00'),
(1, 10, 2, 'Computer setup and basic training', 4, '2024-03-29', 3, '14:00'),
(1, 11, 2, 'Spring cleaning and organization', 6, '2024-03-31', 4, '09:30'),
(1, 12, 2, 'Meal delivery coordination', 4, '2024-04-02', 2, '11:30'),
(1, 13, 2, 'After-school homework help', 3, '2024-04-04', 7, '15:00'),
(1, 14, 2, 'Community garden planting project', 5, '2024-04-05', 6, '08:30'),

-- COMPLETE Requests (8 total)
(1, 1, 4, 'Senior companion and errand assistance', 4, '2024-02-15', 2, '10:00'),
(1, 2, 4, 'School supply organization and inventory', 6, '2024-02-20', 12, '09:00'),
(1, 3, 4, 'Pet sitting and dog walking', 4, '2024-02-25', 5, '07:30'),
(1, 4, 4, 'Technology workshop for seniors', 5, '2024-03-01', 3, '13:30'),
(1, 5, 4, 'Community center cleaning project', 6, '2024-03-05', 4, '08:00'),
(1, 6, 4, 'Youth art class assistance', 4, '2024-03-10', 11, '14:30'),
(1, 7, 4, 'Food bank sorting and organizing', 5, '2024-03-15', 1, '09:30'),
(1, 8, 4, 'Reading buddy program', 3, '2024-03-20', 7, '15:00');

INSERT INTO task_status (name) VALUES 
('OPEN'), 
('ASSIGNED'), 
('IN PROGRESS'),
('COMPLETED');



INSERT INTO request_task (requester_id, organization_id, request_id, point_earnings, task, due_date,task_status_id) VALUES
-- OPEN Request Tasks (Request 1 - Event Setup - 4 tasks)
(1, 1, 1, 40, 'Set up tables and chairs', '2024-03-25',1),
(1, 1, 1, 30, 'Decorate community hall', '2024-03-25',1),
(1, 1, 1, 35, 'Manage registration desk', '2024-03-25',1),
(1, 1, 1, 45, 'Clean up and reorganize space', '2024-03-25',1),

-- OPEN Request Tasks (Request 2 - Tech Help - 3 tasks)
(2, 1, 2, 40, 'Setup new tablets', '2024-03-28',1),
(2, 1, 2, 35, 'Basic internet training', '2024-03-28',1),
(2, 1, 2, 45, 'Email and social media basics', '2024-03-28',1),

-- OPEN Request Tasks (Request 3 - Meal Prep - 3 tasks)
(3, 1, 3, 35, 'Grocery shopping for ingredients', '2024-03-30',1),
(3, 1, 3, 40, 'Cook and package meals', '2024-03-30',1),
(3, 1, 3, 35, 'Organize and label containers', '2024-03-30',1),

-- OPEN Request Tasks (Request 4 - Garden - 3 tasks)
(4, 1, 4, 40, 'Weed garden beds', '2024-04-01',1),
(4, 1, 4, 35, 'Plant new flowers', '2024-04-01',1),
(4, 1, 4, 35, 'Mulch and water plants', '2024-04-01',1),

-- OPEN Request Tasks (Request 5 - Pet Care - 2 tasks)
(5, 1, 5, 30, 'Morning dog walk', '2024-04-02',1),
(5, 1, 5, 30, 'Evening feeding and care', '2024-04-02',1),

-- OPEN Request Tasks (Request 6 - Grocery - 2 tasks)
(6, 1, 6, 35, 'Shop for groceries', '2024-04-03',1),
(6, 1, 6, 25, 'Organize pantry', '2024-04-03',1),

-- OPEN Request Tasks (Request 7 - Tutoring - 1 task)
(7, 1, 7, 40, 'Two-hour math tutoring session', '2024-04-05',1),

-- OPEN Request Tasks (Request 8 - Office - 1 task)
(8, 1, 8, 35, 'Organize filing system', '2024-04-06',1),

-- ASSIGNED Request Tasks (Request 9 - Sports - 3 tasks)
(9, 1, 9, 45, 'Lead warm-up exercises', '2024-03-27',2),
(9, 1, 9, 40, 'Teach basketball drills', '2024-03-27',2),
(9, 1, 9, 35, 'Organize scrimmage game', '2024-03-27',2),

-- ASSIGNED Request Tasks (Request 10 - Computer - 2 tasks)
(10, 1, 10, 40, 'Install necessary software', '2024-03-29',2),
(10, 1, 10, 35, 'Teach basic computer skills', '2024-03-29',2),

-- ASSIGNED Request Tasks (Request 11 - Cleaning - 3 tasks)
(11, 1, 11, 35, 'Deep clean kitchen', '2024-03-31',2),
(11, 1, 11, 30, 'Organize closets', '2024-03-31',2),
(11, 1, 11, 35, 'Clean bathrooms', '2024-03-31',2),

-- ASSIGNED Request Tasks (Request 12 - Delivery - 2 tasks)
(12, 1, 12, 35, 'Pick up meals from kitchen', '2024-04-02',2),
(12, 1, 12, 35, 'Deliver to recipients', '2024-04-02',2),

-- ASSIGNED Request Tasks (Request 13 - Homework - 1 task)
(13, 1, 13, 40, 'Help with homework assignments', '2024-04-04',2),

-- ASSIGNED Request Tasks (Request 14 - Garden Project - 2 tasks)
(14, 1, 14, 35, 'Prepare garden beds', '2024-04-05',2),
(14, 1, 14, 40, 'Plant vegetables', '2024-04-05',2),

-- COMPLETE Request Tasks (Request 15 - Senior Care - 2 tasks)
(1, 1, 15, 35, 'Grocery shopping assistance', '2024-02-15',4),
(1, 1, 15, 35, 'Organize medicine cabinet', '2024-02-15',4),

-- COMPLETE Request Tasks (Request 16 - School Supply - 3 tasks)
(2, 1, 16, 30, 'Sort supplies by category', '2024-02-20',4),
(2, 1, 16, 35, 'Create inventory list', '2024-02-20',4),
(2, 1, 16, 35, 'Organize storage room', '2024-02-20',4),

-- COMPLETE Request Tasks (Request 17 - Pet Sitting - 2 tasks)
(3, 1, 17, 35, 'Morning pet care routine', '2024-02-25',4),
(3, 1, 17, 35, 'Afternoon dog walking', '2024-02-25',4),

-- COMPLETE Request Tasks (Request 18 - Tech Workshop - 3 tasks)
(4, 1, 18, 40, 'Prepare training materials', '2024-03-01',4),
(4, 1, 18, 45, 'Conduct workshop session', '2024-03-01',4),
(4, 1, 18, 35, 'Individual assistance', '2024-03-01',4),

-- COMPLETE Request Tasks (Request 19 - Community Center - 3 tasks)
(5, 1, 19, 35, 'Clean main hall', '2024-03-05',4),
(5, 1, 19, 35, 'Sanitize equipment', '2024-03-05',4),
(5, 1, 19, 40, 'Organize storage areas', '2024-03-05',4),

-- COMPLETE Request Tasks (Request 20 - Art Class - 2 tasks)
(6, 1, 20, 35, 'Prepare art supplies', '2024-03-10',4),
(6, 1, 20, 40, 'Assist during class', '2024-03-10',4),

-- COMPLETE Request Tasks (Request 21 - Food Bank - 3 tasks)
(7, 1, 21, 35, 'Sort donations', '2024-03-15',4),
(7, 1, 21, 35, 'Stock shelves', '2024-03-15',4),
(7, 1, 21, 40, 'Update inventory', '2024-03-15',4),

-- COMPLETE Request Tasks (Request 22 - Reading - 1 task)
(8, 1, 22, 40, 'Reading session with students', '2024-03-20',4);


INSERT INTO rewards (name, description, organization_id,img_url, points_required) VALUES
('T-Shirt', 'A branded volunteer T-shirt', 1, 'https://content.mycutegraphics.com/graphics/clothing/orange-tshirt.png',100),
('Gift Card', 'A $20 gift card', 1,'https://cdn-icons-png.flaticon.com/512/612/612886.png',200),
('Backpack', 'A sturdy backpack for volunteers', 1,'https://images.vexels.com/content/242558/preview/blue-backpack-color-stroke-8e28ad.png', 150),
('Water Bottle', 'Reusable water bottle', 1,'https://cdn-icons-png.flaticon.com/512/4709/4709479.png', 50),
('Hat', 'A branded volunteer hat', 1,'https://static.vecteezy.com/system/resources/previews/009/384/414/non_2x/cap-clipart-design-illustration-free-png.png', 75),
('Book', 'An inspirational book for volunteers', 1,'https://pngimg.com/d/book_PNG51097.png', 120),
('Bike', 'A mountain bike for volunteers', 1,'https://pngimg.com/d/bicycle_PNG102562.png', 500);



INSERT INTO rewards_earned (reward_id, volunteer_id) VALUES
-- Shanel (highest points - 180)
(1, 3),  -- T-Shirt
(4, 3),  -- Water Bottle
(5, 3),  -- Hat

-- Kurt (150 points)
(1, 1),  -- T-Shirt
(4, 1),  -- Water Bottle

-- Antonio (150 points)
(1, 4),  -- T-Shirt
(4, 4),  -- Water Bottle

-- Other active volunteers
(4, 7),  -- Sophia (Water Bottle)
(4, 11); -- Olivia (Water Bottle)

INSERT INTO badges (name, description, img_url, requirement) VALUES
('Beginner Volunteer', 'Completed first task', 'badge1.png', 'Complete 1 task'),
('Active Volunteer', 'Completed 5 tasks', 'badge2.png', 'Complete 5 tasks'),
('Super Volunteer', 'Completed 10 tasks', 'badge3.png', 'Complete 10 tasks'),
('Community Hero', 'Completed 20 tasks', 'badge4.png', 'Complete 20 tasks'),
('Legendary Volunteer', 'Completed 50 tasks', 'badge5.png', 'Complete 50 tasks');

-- INSERT INTO badges_earned (volunteer_id, badge_id) VALUES
-- (1, 1),
-- (2, 2),
-- (3, 3),
-- (4, 4),
-- (5, 5);

INSERT INTO badges_earned (volunteer_id, badge_id) VALUES
-- Shanel (most accomplished)
(3, 1),
(3, 2),
(3, 3),
(3, 5),

-- Kurt (high performer)
(1, 1),
(1, 2),
(1, 3),
(1, 5),

-- Antonio (high performer)
(4, 1),
(4, 2),
(4, 3),
(4, 5),

-- Other active volunteers
(7, 1),
(7, 2),
(11, 1),
(11, 2);



INSERT INTO task_progress (name) VALUES
('Not Started'),
('On my way'),
('At location'),
('Task in progress'),
('Completed');




INSERT INTO assigned_tasks (request_task_id, volunteer_id, task_progress_id) VALUES
-- Currently Active Tasks (one per volunteer)
-- Event Setup tasks
(1, 3, 2),    -- Shanel on first event setup task
(2, 1, 3),    -- Kurt on second event setup task

-- Tech Help tasks
(5, 4, 2),    -- Antonio on tablet setup
(6, 5, 2),    -- Abdel on internet training

-- Meal Prep tasks
(8, 6, 3),    -- Emily on grocery shopping
(9, 7, 2),    -- Sophia on cooking

-- Garden tasks
(11, 8, 3),   -- Lucas on weeding
(12, 9, 2),   -- Mia on planting
(13, 10, 2),  -- Ethan on mulching
(14, 11, 2),  -- Olivia on watering

-- Completed Tasks History
-- Senior Care completed tasks
(41, 1, 5),   -- Kurt
(42, 3, 5),   -- Shanel
(43, 4, 5),   -- Antonio

-- School Supply completed tasks
(44, 1, 5),   -- Kurt
(45, 3, 5),   -- Shanel
(46, 4, 5),   -- Antonio

-- Tech Workshop completed tasks
(47, 1, 5),   -- Kurt
(48, 3, 5),   -- Shanel
(49, 4, 5);   -- Antonio




