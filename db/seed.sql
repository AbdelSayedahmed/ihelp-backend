\c ihelp_db;

INSERT INTO addresses (street, apt,  city, state, zip_code) VALUES 
('123 Elm St', '90001', 'Los Angeles', 'CA', '12345'),
('456 Oak St', '10001', 'New York', 'NY', '67890'),
('789 Pine St', '60601', 'Chicago', 'IL', '54321'),
('101 Maple Ave', '77001', 'Houston', 'TX', '98765'),
('202 Birch Rd', '33101', 'Miami', 'FL', '24680');


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

INSERT INTO organizations (uid, address_id, phone, name, description) VALUES
('bxGXTPH6UXeRvYcSODa14QjmXoL2', 1, '1234567890', 'Developer', 'Developer team only'),
('mtWp8sneeFbF2Jbrq85BIOz5HeC3', 2, '1234567890', 'Community Aid', 'Community volunteer organization'),
('ii3IqDVdvpREe8msqaSYZMKHQX83', 3, '1234567890', 'Care Givers Volunteer', 'Neighborhood assistance service'),
('EE6o4BMsuQaJXYdJ4qD9FEb9dZz2', 4, '1234567890', 'Reach out volunteers', 'A group dedicated to volunteering for various causes'),
('uakdvi5DC4YkL1eyQaQyionZsSi2', 5, '1234567890', 'Hope in act', 'Providing aid to people affected by natural disasters');


INSERT INTO categories (name) VALUES
('Various'),
('Errands'),
('Technology'),
('Cleaning'),
('Pet Care'),
('Gardening'),
('Tutoring'),
('Meal Prep'),
('Event Setup'),
('Delivery'),
('Sports Coaching'),
('Crafts'),
('Office Assistance');


INSERT INTO requesters (organization_id, first_name, last_name, phone) VALUES
(1, 'John', 'Doe', '1235550001'),
(1, 'Jane', 'Smith', '1235550002'),
(1, 'Bob', 'Johnson', '1235550003'),
(1, 'Alice', 'Davis', '1235550004'),
(1, 'Charlie', 'Brown', '1235550005');


INSERT INTO requesters (organization_id, first_name, last_name, phone) VALUES
(1, 'John', 'Hart', '1235550001'),
(1, 'Jane', 'Smith', '1235550002'),
(1, 'Bob', 'Johnson', '1235550003'),
(1, 'Alice', 'Davis', '1235550004'),
(1, 'Charlie', 'Brown', '1235550005'),
(1, 'Emily', 'Clark', '1235550006'),  
(1, 'Tom', 'Harris', '1235550007'),
(1, 'Rebecca', 'Lewis', '1235550008'),
(1, 'Daniel', 'Walker', '1235550009'),
(1, 'Sophie', 'Hall', '1235550010');



INSERT INTO volunteers (uid, organization_id, name, email, age, points_earned, avatar_id) VALUES
('OA0fvVp0l8XCwplmtKhjJ6ym7D22', 1, 'Kurt Julien', 'kjulien@pursuit.org', 17, 100,1),
('2W4gow7VyWO8PXB4o5vAjKP38JB3', 1, 'Marcus Browne', 'mbrowne@pursuit.org', 16, 150,2),
('wk2skOz9KUOXEqi6HJQDRhq5HN62', 1, 'Shanel Elms', 'selms@pursuit.org', 12, 120,3),
('bWDLGo3svlbYEDGc2qfXzWnwBdK2', 1, 'Antonio Martinez', 'amartinez@pursuit.org', 15, 90,3),
('Yhb4UQWh6VSAf0jYBGVjWv0cEYD3', 1, 'Abdel Sayedahmed', 'asayedahmed@pursuit.org', 13, 351,4);

INSERT INTO request_status (name) VALUES 
('OPEN'), 
('ASSIGNED'), 
('IN PROGRESS'), 
('COMPLETE'),
('CANCELED');





INSERT INTO requests (organization_id, requester_id, status_id, description, category_id)
VALUES
(1, 1, 1, 'Help with various community activities.', 1),
(1, 2, 1, 'Run errands for elderly neighbors.', 2),
(1, 3, 1, 'Assist with tech setup for events.', 3),
(1, 4, 1, 'Help clean community park and area.', 4),
(1, 5, 1, 'Walk dogs and pet care for neighbors.', 5),
(1, 6, 1, 'Assist in planting flowers and plants.', 6),
(1, 7, 1, 'Tutoring younger kids in math and reading.', 7),
(1, 8, 1, 'Prepare meals for families in need.', 8),
(1, 9, 1, 'Help set up for school events.', 9),
(1, 10, 1, 'Deliver groceries to local families.', 10),
(1, 11, 1, 'Coach kids in sports activities.', 11),
(1, 12, 1, 'Assist with arts and crafts activities.', 12),
(1, 13, 1, 'Provide office assistance for events.', 13);



INSERT INTO request_task (requester_id, organization_id, request_id, point_earnings, task, due_date)
VALUES
(1, 1, 1, 25, 'Organize community clean-up.', '2024-11-01'),
(1, 1, 1, 15, 'Collect supplies for activities.', '2024-11-01'),
(2, 1, 2, 30, 'Pick up groceries for neighbor.', '2024-11-05'),
(2, 1, 2, 30, 'Deliver prescriptions.', '2024-11-05'),
(2, 1, 2, 30, 'Run errands to local stores.', '2024-11-05'),
(3, 1, 3, 40, 'Set up computers for classes.', '2024-11-10'),
(4, 1, 4, 15, 'Sweep and pick up trash.', '2024-11-02'),
(5, 1, 5, 25, 'Walk dogs for 30 minutes.', '2024-11-03'),
(6, 1, 6, 25, 'Plant flowers in community garden.', '2024-11-15'),
(7, 1, 7, 25, 'Tutor students in math.', '2024-11-12'),
(8, 1, 8, 25, 'Prepare 10 meals for families.', '2024-11-20'),
(9, 1, 9, 40, 'Help set up tables and chairs.', '2024-11-11'),
(10, 1, 10, 30, 'Deliver meals to families.', '2024-11-14'),
(11, 1, 11, 50, 'Coach soccer for 1 hour.', '2024-11-16'),
(12, 1, 12, 40, 'Help kids with painting.', '2024-11-17'),
(13, 1, 13, 50, 'File documents and organize.', '2024-11-18'),
(1, 1, 1, 50, 'Collect donations for local shelter.', '2024-11-19');



INSERT INTO rewards (name, description, organization_id, points_required) VALUES
('T-Shirt', 'A branded volunteer T-shirt', 1, 100),
('Gift Card', 'A $20 gift card', 1, 200),
('Backpack', 'A sturdy backpack for volunteers', 1, 150),
('Water Bottle', 'Reusable water bottle', 1, 50),
('Hat', 'A branded volunteer hat', 1, 75),
('Book Voucher', 'A $15 voucher for books', 1, 80),
('Coffee Mug', 'A volunteer-themed coffee mug', 1, 40),
('Bike', 'A brand new volunteer bike', 1, 1000),
('Gift Card', 'A $50 restaurant gift card', 1, 250),
('Movie Tickets', 'Two movie tickets', 1, 120),
('Hoodie', 'A cozy branded hoodie', 1, 180),
('Notebook', 'A high-quality notebook', 1, 30),
('Headphones', 'Wireless headphones', 1, 300),
('Fitness Tracker', 'Track your fitness activities', 1, 400),
('Portable Charger', 'A portable USB charger', 1, 90),
('Gift Card', 'A $100 retail gift card', 1, 500),
('Bluetooth Speaker', 'Portable Bluetooth speaker', 1, 250),
('Reusable Bag', 'An eco-friendly tote bag', 1, 60),
('Travel Mug', 'Insulated travel mug', 1, 70),
('Kindle', 'An e-reader device', 1, 600),
('Yoga Mat', 'Eco-friendly yoga mat', 1, 110),
('Cooking Class', 'Voucher for a cooking class', 1, 180),
('Puzzle Game', 'A fun puzzle game', 1, 50),
('Camping Set', 'Basic camping equipment', 1, 450),
('Donation', 'Donate to a charity of choice', 1, 100),
('Volunteer Badge', 'Special edition volunteer badge', 1, 200);


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

INSERT INTO task_status (name) VALUES 
('OPEN'), 
('ASSIGNED'), 
('IN PROGRESS'),
('COMPLETED'),
('CANCELLED');