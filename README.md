# library-database-management-system
This project presents a fully designed and implemented relational database system for managing a college library. Built in Oracle SQL, the system supports lending of books, eBooks, and electronic equipment, including a robust reservation and fines system.
Features
Conceptual model with ERD and normalization (up to 3NF)

Complete schema creation with foreign key constraints

Sample data population across all tables

Views for:

Suspended members

Member loan summaries

Most popular resources

SQL queries: simple, intermediate (joins), and advanced (grouping, HAVING)

Technologies
SQL (Oracle)

ER Diagram created in Lucidchart

Tested using Oracle SQL Developer

Folder Structure
sql/
├── create_tables.sql # All CREATE TABLE statements
├── foreign_keys.sql # ALTER TABLE to add constraints
├── insert_data.sql # Sample INSERT INTO data
├── views.sql # CREATE VIEW definitions
├── queries_simple.sql # SELECT + WHERE examples
├── queries_joins.sql # SELECT + JOIN examples
├── queries_advanced.sql # JOIN + GROUP BY queries

Entities
Members

Books

eBooks

Equipment

Loans

Reservations

Fines

Resources

Class (location info)

Sample Views
MemberLoanSummary – shows the number of loans per member

PopularResources – most borrowed resources in the library

SuspendedMembers – members with fines of £10 or more

Example Queries
Simple:
SELECT Title, Author FROM BOOKS WHERE Genre = 'Tech';

Intermediate:
SELECT M.Member_Name, F.Amount
FROM MEMBERS M
JOIN FINES F ON M.Member_ID = F.Member_ID
WHERE F.Amount > 5;

Advanced:
SELECT M.Member_Name, SUM(F.Amount) AS Total_Fines
FROM MEMBERS M
JOIN FINES F ON M.Member_ID = F.Member_ID
GROUP BY M.Member_Name
HAVING SUM(F.Amount) > 0;
