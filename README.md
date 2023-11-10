
# Pokedex

## Prerequisites

- Ruby 3.2.2
- Rails 7.1.1
- Bundler

## Installation

1. **Clone the repository:**

    ```bash
    git clone https://github.com/felmsena/Pokedex.git
    ```

2. **Navigate to the project directory:**

    ```bash
    cd Pokedex
    ```

3. **Install dependencies:**

    ```bash
    bundle install
    ```

## Database Setup

1. **To set up the database and seed data, run the following command:**

   ```bash
   rails db:setup
   ```

## Running the application
1. **Start the Rails server**

   ```bash
   rails server
   ```
2. **Access the application in your web browser:**
   ```bash
   http://localhost:3000
   ```


## Swagger Documentation:

1. Swagger documentation for the API is available at:
   ```bash
   http://localhost:3000/api-docs/index.html
   ```
## Testing

1. **Run tests:**
   To run specific controller tests for the Pokemons controller, execute the following command:

   ```bash
   rspec spec/controllers/api/v1/pokemons_controller_spec.rb --require ./spec/factories/pokemons.rb