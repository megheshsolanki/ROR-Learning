
# ROR-Learning
This repository contains the projects/tasks, I performed while learning ruby and rails



## Task 1 - Comprehensive exercise
The folder task1 comprise of all the tasks stated below

• Create a Class:

Define a class named InventoryItem with attributes for name, category, quantity, and price.
Include a method to display all the details of an item.

• Initialize Instances:

Create instances of the InventoryItem class for three different items in the store. Initialize them with sample data.

• Array and Iteration:

Create an array to store these three items.
Iterate through the array and print the details of each item.

 • Hash and Method:

Convert each InventoryItem instance into a hash where the keys are the attributes (name, category, quantity, price) and the values are the corresponding values.
Write a method that takes an InventoryItem instance and prints its details using the hash.

• Control Flow:

Write a method that, given an InventoryItem instance, checks if the quantity is below 10. If so, print a message like "Low stock, order more."

• User Interaction:

Prompt the user to enter the name, category, quantity, and price of a new item.
Create a new InventoryItem instance with the provided information and add it to the array.



• Class Inheritance:

Create a subclass of InventoryItem named DiscountedItem that inherits from it. Add an additional attribute for the discount percentage.
Override the method to display the details to include the discounted price.

• Class Interaction:

Add a method to the InventoryItem class that calculates the total value of the items in the array (quantity * price).
Print the total value of the inventory.

## API Integration (/api-integration)
Project: Integrate a weather API to fetch weather data.

Contents:

• External API Integration: Use an external weather API (such as OpenWeatherMap or WeatherAPI) to fetch weather data.

• Endpoints: GET /weather/:city (retrieve weather data for a specific city).

• HTTP Requests: Use Ruby's HTTP client or libraries like HTTParty to make requests to the external API and process the responses.

• Unit Tests: Write unit tests for the whole project
## Database Integration (/database-integration)
Project:- A basic task management system with database integration.

Contents:

• Endpoints: POST /tasks (create a task), GET /tasks/:id (get task details), GET /tasks (get all tasks), PUT /tasks/:id (update task), DELETE /tasks/:id (delete task).


• Controllers & Models: Task model for CRUD operations, controllers for handling task creation, retrieval, update, and deletion.


•  Database Connectivity: Integrate SQLite or another database of choice for storing task-related data.

• Unit Tests: Write unit tests for the whole project

## User authentication (/user-authentication)

Project:-  A simple user authentication service using Ruby on Rails.

Contents:- 

• Endpoints: POST /register (user registration), POST /login (user login), POST /logout (user logout).


• Controllers & Models: User model for storing user details, controllers for handling user registration, login, and logout.


• JWT Token-based Authentication: Use JWT tokens for authentication. Implement token generation on login and validate tokens on subsequent requests.

•  Input Validation: Validate input data to prevent injection attacks (such as SQL injection).

• Unit Tests: Write unit tests for the whole project

## Security Features (/security-features)

Project: Implement security measures in a file-sharing API.

Contents:

• Secure File Upload: Create an endpoint POST /upload with secure file upload capabilities. Implement checks to prevent unauthorised access.


• Input Validation: Validate input data to prevent injection attacks (such as SQL injection).


• Encryption: Implement encryption for sensitive data storage and transmission, such as passwords or files being uploaded.
   
• Unit Tests: Write unit tests for the whole project