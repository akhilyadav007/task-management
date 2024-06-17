# Task Management Web Application

## Introduction
This is a Task Management web application built with Ruby on Rails and PostgreSQL. The application allows users to authenticate, create tasks, update the status of tasks, and set deadlines. Users receive email alerts 1 day and 1 hour before the deadline if the task is not marked as done. The application also includes test cases and has a good looking, responsive UI.

## Features
- **User Authentication:** Users can sign up, log in, and manage their tasks.
- **Task States:** Tasks can be in one of three states - Backlog, In-progress, or Done.
- **Task Deadlines:** Each task has a deadline, and users receive email alerts before the deadline if the task is not completed.
- **Responsive UI:** The application has a user-friendly and responsive UI.

## Technologies Used
- **Backend:** Ruby on Rails
- **Database:** PostgreSQL
- **Frontend:** HTML, CSS, JavaScript
- **Email Alerts:** Action Mailer
- **Testing:** RSpec

## Setup Instructions
### Prerequisites
- Ruby (version 3.1.2 or later)
- Rails (version 7.0 or later)
- PostgreSQL
- Bundler

### Installation
1. **Clone the Repository:**
   ```sh
   git clone https://github.com/yourusername/task_management_app.git
   cd task_management_app


# Install Dependencies
bundle install

# Set Up the Database
rails db:create
rails db:migrate

# Run the Server
rails server

# Configuration
- **Database Configuration:** Ensure your `config/database.yml` is set up correctly for your PostgreSQL configuration.
- **Email Configuration:** Configure Action Mailer settings in `config/environments/development.rb` and `config/environments/production.rb`.

# Usage
1. **Sign Up / Log In:**
   - Visit http://localhost:3000
   - Sign up for a new account or log in with an existing account.

2. **Create a Task:**
   - Click on "New Task".
   - Fill in the task details and set a deadline.
   - Click "Create Task".

3. **Update Task Status:**
   - Click on a task to view details.
   - Update the status to "In-progress" or "Done".

4. **Receive Email Alerts:**
   - Ensure the task has a deadline set.
   - If the task is not marked as "Done" before the deadline, email alerts will be sent 1 day and 1 hour before the deadline.

# Testing
Run the test suite using RSpec:
bundle exec rspec

# Code Structure
- **app/models:** Contains the models for users and tasks.
- **app/controllers:** Contains the controllers for handling user and task actions.
- **app/views:** Contains the views for rendering HTML pages.
- **app/mailers:** Contains the mailers for sending email alerts.
- **config:** Contains configuration files.
- **db:** Contains database migrations.
- **spec:** Contains RSpec tests.

# Additional Libraries
- **Devise:** For user authentication.
- **Bootstrap:** For responsive UI components.
- **Sidekiq:** For background job processing (used for sending email alerts).

# Future Enhancements
- **Task Priority:** Add the ability to set task priority levels.
- **Collaborators:** Allow users to assign tasks to collaborators.
- **Task Categories:** Add categories to organize tasks.

# Contributing
Contributions are welcome! Please submit a pull request or open an issue to discuss potential changes.


# Author
Akhil Yadav 
akhilyadav.com@gmail.com
