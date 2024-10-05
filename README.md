# iHelp Backend

## Table of Contents

- [Project Structure](#project-structure)
- [Features](#features)
- [Technologies](#technologies)
- [Setup](#setup)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Database Schema](#database-schema)
- [Seeding the Database](#seeding-the-database)
- [Contributing](#contributing)

### [iHelp Database Diagram](https://dbdiagram.io/d/iHelp-66f49db63430cb846ca4076d)

<hr />

### Project Structure

```
ihelp-backend/
│
├── controllers/
│   ├── badgesController.js
│   ├── organizationsController.js
│   ├── requestersController.js
│   ├── requestsController.js
│   ├── requestTasksController.js
│   ├── rewardsController.js
│   ├── statusesController.js
│   └── volunteerController.js
│
├── db/
│   ├── db-config
│   ├── schema.sql
│   └── seed.sql
│
├── middleware/
│   ├── authMiddleware.js
│
├── node_modules/
│   └── ...
│
├── queries/
│   ├── badgesQueries.js
│   ├── organizationsQueries.js
│   ├── requestersQueries.js
│   ├── requestsQueries.js
│   ├── requestTasksQueries.js
│   ├── rewardsQueries.js
│   ├── statusesQueries.js
│   └── volunteerQueries.js
│
├── .env
├── .gitignore
├── app.js
├── firebase-admin.js
├── firebase-credentials.json
├── package-lock.json
├── package.json
├── README.md
└── server.js
```

## Features

Based on the schema you’ve provided, the backend of your project would support several key features, including managing organizations, volunteers, requests, tasks, rewards, and badges. Here's a breakdown of the features supported:

### 1. **Organization and Address Management:**

- You can manage multiple **organizations**, each tied to a physical **address** (with fields like street, city, state, zip code, country).
- Each organization can have multiple **requesters** and **volunteers** associated with it.

### 2. **Requester and Volunteer Management:**

- **Requesters**: Represent individuals or entities that can request help or services. They are linked to an organization and have fields like name, phone, and active status.
- **Volunteers**: Represent individuals who provide services or help. They are linked to an organization and have fields like name, email, age, points earned, and active status.

### 3. **Request Management:**

- **Requests**: These represent a service request made by a requester and handled by a volunteer. Each request is associated with an organization, requester, volunteer, and request status.
- **Request Status**: Tracks the current state of a request, likely supporting statuses such as "Pending", "In Progress", "Completed", etc.

### 4. **Task Management:**

- **Request Tasks**: These break down requests into individual tasks that volunteers need to complete. Each task has associated points, a due date, and is tied to a requester, organization, and the main request.
- **Task Progress**: Tracks the progress of individual tasks, likely supporting statuses like "Not Started", "In Progress", "Completed", etc.
- **Assigned Tasks**: Allows specific volunteers to be assigned to tasks, and tracks the progress of these tasks.

### 5. **Reward System:**

- **Rewards**: Organizations can set up rewards that volunteers can earn by accumulating points. Each reward has a name, description, and the number of points required to earn it.
- **Rewards Earned**: Tracks which rewards a volunteer has earned, linking rewards to volunteers.

### 6. **Badge System:**

- **Badges**: Volunteers can earn badges based on specific criteria or requirements. Badges have fields like name, description, image URL, and requirement text.
- **Badges Earned**: Tracks which badges a volunteer has earned, linking badges to volunteers.

### 7. **Point System:**

- **Volunteers** accumulate points by completing tasks. These points can be used to earn rewards and potentially badges.

### 8. **Timestamp and Audit Trails:**

- All tables have `created_at` and `updated_at` fields to track when records were created and last modified, ensuring that all changes can be audited.

### Backend Features Based on the Schema:

- **CRUD operations**: Create, Read, Update, and Delete for organizations, addresses, volunteers, requesters, requests, tasks, rewards, and badges.
- **Request Handling**: A system to create, assign, and track requests and their completion by volunteers.
- **Task Assignment and Tracking**: Volunteers can be assigned tasks, and their progress is tracked.
- **Reward and Badge System**: A system for earning rewards and badges based on points and requirements.
- **Volunteer Points System**: Volunteers earn points through task completion, which can be used to claim rewards.
- **Status and Progress Tracking**: Requests and tasks have statuses to track their current state.
- **Cascading Deletes**: Records related to deleted organizations, volunteers, requesters, requests, and tasks are automatically removed to maintain database integrity.

This schema provides a robust foundation for managing volunteers, tasks, and rewards, along with a detailed audit trail for data tracking.

## Technologies

- Node.js
- Express.js
- PostgreSQL
- pg-promise
- dotenv
- CORS
- Firebase

## Setup

### Prerequisites

- Node.js (version >= 14)
- PostgreSQL (version >= 12)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/ihelp-backend.git
   cd ihelp-backend
   ```

2. Install the dependencies:

   ```bash
   npm install
   ```

3. Create a `.env` file in the root directory and add your PostgreSQL configuration:
   ```env
   PORT=3000
   PG_HOST=localhost
   PG_PORT=5432
   PG_DATABASE=ihelp_db
   PG_USER=your_username
   ```

## Usage

1. Start the server:

   ```bash
   nodemon
   ```

2. The server will run on `http://localhost:3000`.

## API Endpoints

### Badges

- `GET /badges` - Retrieve all Badges
- `POST /badges` - Create a new Badge
- `GET /badges/:id` - Retrieve a Badge by ID
- `PUT /badges/:id` - Update a Badge by ID
- `DELETE /badges/:id` - Delete a Badge by ID

### Organizations

- `GET /organizations` - Retrieve all Organizations
- `POST /organizations` - Create a new Organization
- `GET /organizations/:id` - Retrieve a Organization by ID
- `PUT /organizations/:id` - Update a Organization by ID
- `DELETE /organizations/:id` - Delete a Organization by ID

### Requesters

- `GET /requesters` - Retrieve all requesters
- `POST /requesters` - Create a new requester
- `GET /requesters/:id` - Retrieve a requester by ID
- `PUT /requesters/:id` - Update a requester by ID
- `DELETE /requesters/:id` - Delete a requester by ID

### Requests

- `GET /requests` - Retrieve all Requests
- `POST /requests` - Create a new Request
- `GET /requests/:id` - Retrieve an Request by ID
- `PUT /requests/:id` - Update an Request by ID
- `DELETE /requests/:id` - Delete an Request by ID

### RequestTasks

- `GET /requestTasks` - Retrieve all RequestTasks
- `POST /requestTasks` - Create a new RequestTask
- `GET /requestTasks/:id` - Retrieve a RequestTask by ID
- `PUT /requestTasks/:id` - Update a RequestTask by ID
- `DELETE /requestTasks/:id` - Delete a RequestTask by ID

### Rewards

- `GET /rewards` - Retrieve all Rewards
- `POST /rewards` - Create a new Reward
- `GET /rewards/:id` - Retrieve a Reward by ID
- `PUT /rewards/:id` - Update a Reward by ID
- `DELETE /rewards/:id` - Delete a Reward by ID

### Statuses

- `GET /statuses` - Retrieve all Statuses
- `POST /statuses` - Create a new Status
- `GET /statuses/:id` - Retrieve a Status by ID
- `PUT /statuses/:id` - Update a Status by ID
- `DELETE /statuses/:id` - Delete a Status by ID

### Volunteers

- `GET /volunteers` - Retrieve all Volunteers
- `POST /volunteers` - Create a new Volunteer
- `GET /volunteers/:id` - Retrieve a Volunteer by ID
- `PUT /volunteers/:id` - Update a Volunteer by ID
- `DELETE /volunteers/:id` - Delete a Volunteer by ID

### Badges and Game Progress

- Endpoints to manage badges and game progress can be added similarly.

## Seeding the Database

To seed the database with initial data, run the following command:

```bash
npm run start
```

This command will execute the SQL files to create the schema and populate it with sample data.

