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
(1, 'John', 'Doe', '1235550001'),
(1, 'Jane', 'Smith', '1235550002'),
(1, 'Bob', 'Johnson', '1235550003'),
(1, 'Alice', 'Davis', '1235550004'),
(1, 'Charlie', 'Brown', '1235550005');

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

INSERT INTO volunteers (uid, organization_id, name, email, age, points_earned,avatar_id) VALUES
('OA0fvVp0l8XCwplmtKhjJ6ym7D22', 1, 'Kurt Julien', 'kjulien@pursuit.org', 17, 100,1),
('2W4gow7VyWO8PXB4o5vAjKP38JB3', 1, 'Marcus Browne', 'mbrowne@pursuit.org', 16, 150,2),
('wk2skOz9KUOXEqi6HJQDRhq5HN62', 1, 'Shanel Elms', 'selms@pursuit.org', 12, 120,3),
('bWDLGo3svlbYEDGc2qfXzWnwBdK2', 1, 'Antonio Martinez', 'amartinez@pursuit.org', 15, 90,3),
('Yhb4UQWh6VSAf0jYBGVjWv0cEYD3', 1, 'Abdel Sayedahmed', 'asayedahmed@pursuit.org', 13, 351,4);

INSERT INTO request_status (name) VALUES 
('OPEN'), 
('ASSIGNED'), 
('COMPLETE');

INSERT INTO requests (organization_id, volunteer_id, requester_id, status_id, description, category) VALUES
(1, 1, 1, 1, 'Help with grocery shopping', 'Cleaning'),
(1, 2, 2, 1, 'Assistance with home cleaning', 'Cleaning'),
(1, 3, 3, 2, 'Need a ride to the doctor', 'Errands'),
(1, 4, 4, 3, 'Help moving furniture', 'Cleaning'),
(1, 5, 5, 2, 'Deliver meals to elderly neighbors', 'Errands');


INSERT INTO request_task (requester_id, organization_id, request_id, point_earnings, task, due_date) VALUES
(1, 1, 1, 50, 'Complete survey', '2024-09-30'),
(2, 1, 2, 30, 'Attend meeting', '2024-10-01'),
(3, 1, 3, 40, 'Submit report', '2024-10-02'),
(4, 1, 4, 60, 'Provide feedback', '2024-10-03'),
(5, 1, 5, 35, 'Update documentation', '2024-10-04');


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