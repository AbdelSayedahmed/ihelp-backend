# iHelp Backend

iHelp is a backend application designed to connect volunteers with organizations in need of assistance. The system allows organizations to post requests for help, volunteers to offer their services, and provides a reward system for participants.

## Table of Contents

- [Features](#features)
- [Technologies](#technologies)
- [Setup](#setup)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Database Schema](#database-schema)
- [Seeding the Database](#seeding-the-database)
- [Contributing](#contributing)
- [License](#license)

### [iHelp Database Diagram](https://dbdiagram.io/d/iHelp-66f49db63430cb846ca4076d)

<hr />

### Project Structure

```
ihelp-backend/
│
├── controllers/
│   ├── requestersController.js
│   ├── volunteersController.js
│   ├── requestsController.js
│   ├── organizationsController.js
│   ├── rewardsController.js
│   ├── gameProgressController.js
│   ├── badgesController.js
│   └── volunteerBadgesController.js
│
├── db/
│   ├── db-config
│   ├── schema.sql
│   └── seed.sql
│
├── node_modules/
│   └── ...
│
├── queries/
│   ├── requestersQueries.js
│   ├── volunteersQueries.js
│   ├── requestsQueries.js
│   ├── organizationsQueries.js
│   ├── rewardsQueries.js
│   ├── gameProgressQueries.js
│   ├── badgesQueries.js
│   └── volunteerBadgesQueries.js
│
├── .env
├── .gitignore
├── app.js
├── package-lock.json
├── package.json
└── server.js
```

## Features

- Manage requesters and volunteers
- Organizations can post requests for assistance
- Reward system for volunteers
- Track game progress and badges earned by volunteers

## Technologies

- Node.js
- Express.js
- PostgreSQL
- pg-promise
- dotenv
- CORS

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
   npm start
   ```

2. The server will run on `http://localhost:3000`.

## API Endpoints

### Requesters

- `GET /requesters` - Retrieve all requesters
- `POST /requesters` - Create a new requester
- `GET /requesters/:id` - Retrieve a requester by ID
- `PUT /requesters/:id` - Update a requester by ID
- `DELETE /requesters/:id` - Delete a requester by ID

### Volunteers

- `GET /volunteers` - Retrieve all volunteers
- `POST /volunteers` - Create a new volunteer
- `GET /volunteers/:id` - Retrieve a volunteer by ID
- `PUT /volunteers/:id` - Update a volunteer by ID
- `DELETE /volunteers/:id` - Delete a volunteer by ID

### Requests

- `GET /requests` - Retrieve all requests
- `POST /requests` - Create a new request
- `GET /requests/:id` - Retrieve a request by ID
- `PUT /requests/:id` - Update a request by ID
- `DELETE /requests/:id` - Delete a request by ID

### Organizations

- `GET /organizations` - Retrieve all organizations
- `POST /organizations` - Create a new organization
- `GET /organizations/:id` - Retrieve an organization by ID
- `PUT /organizations/:id` - Update an organization by ID
- `DELETE /organizations/:id` - Delete an organization by ID

### Rewards

- `GET /rewards` - Retrieve all rewards
- `POST /rewards` - Create a new reward
- `GET /rewards/:id` - Retrieve a reward by ID
- `PUT /rewards/:id` - Update a reward by ID
- `DELETE /rewards/:id` - Delete a reward by ID

### Badges and Game Progress

- Endpoints to manage badges and game progress can be added similarly.

## Database Schema

Refer to [this Database Diagram](https://dbdiagram.io/d/iHelp-66f49db63430cb846ca4076d) for the database schema, which includes tables for `requesters`, `volunteers`, `requests`, `organizations`, `rewards`, `game_progress`, `badges`, and `volunteer_badges`.

## Seeding the Database

To seed the database with initial data, run the following command:

```bash
npm start
```

This command will execute the SQL files to create the schema and populate it with sample data.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any enhancements or bug fixes.
