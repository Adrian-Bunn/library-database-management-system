-- 1) List all equipment available for loan
SELECT
    E.Type,
    E.Model,
    E.Equip_Quantity
FROM
    EQUIPMENT E
WHERE
    E.Equip_Quantity > 0;

-- 2) List all eBooks written by Kristin Hannah
SELECT
    Title,
    Author,
    Year
FROM
    EBOOKS
WHERE
    Author = 'Kristin Hannah';

-- 3) List all books where the genre is Tech
SELECT
    Title,
    Author
FROM
    BOOKS
WHERE
    Genre = 'Tech';

-- 4) List members with a loan limit greater than 5
SELECT
    Member_Name,
    Loan_Limit
FROM
    MEMBERS
WHERE
    Loan_Limit > 5;
