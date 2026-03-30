# Artwork Museum Database

A relational SQL database designed to manage and query artwork, artists, and collection metadata for an art museum. The database supports full CRUD operations and tracks information about artworks, the artists who created them, the periods they belong to, and the museum wings where they are displayed.

## Instructions for Build and Use

Steps to build and/or run the software:

1. Install MySQL and MySQL Workbench if not already installed.
2. Open MySQL Workbench and connect to your local MySQL server.
3. Open the provided `.sql` file and execute the full script to create the schema, tables, and seed data.

Instructions for using the software:

1. Open MySQL Workbench and select the `artwork` schema from the left panel.
2. Write and execute SELECT queries to browse artworks, artists, periods, and wings.
3. Use the provided INSERT, UPDATE, and DELETE statements as templates to add, modify, or remove records.

## Development Environment

To recreate the development environment, you need the following software and/or libraries with the specified versions:

* MySQL 8.0 or later
* MySQL Workbench 8.0 or later

## Useful Websites to Learn More

I found these websites useful in developing this software:

* [MySQL Official Documentation](https://dev.mysql.com/doc/)
* [W3Schools SQL Tutorial](https://www.w3schools.com/sql/)
* [MySQL Workbench Manual](https://dev.mysql.com/doc/workbench/en/)

## Future Work

The following items I plan to fix, improve, and/or add to this project in the future:

* [ ] Fix the typo in the `period` table column name (`peridod` → `period`)
* [ ] Fix the typo in the `wing` table data (`Aincent` → `Ancient`)
* [ ] Add more artworks and artists to make the database more comprehensive
* [ ] Add a query that filters artworks within a date/year range
* [ ] Add an `exhibit` table to track temporary museum exhibitions
