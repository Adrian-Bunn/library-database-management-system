-- 1) List of all books in the fiction category
SELECT
    B.Title,
    B.Author,
    C.Floor,
    C.Shelf
FROM
    BOOKS B
    JOIN CLASS C ON B.Class_ID = C.Class_ID
WHERE
    C.Class_ID = 'FICT';

-- 2) Fine amount above 5 pounds per member
SELECT
    M.Member_Name,
    F.Amount
FROM
    MEMBERS M
    JOIN FINES F ON M.Member_ID = F.Member_ID
WHERE
    F.Amount > 5;

-- 3) Member name, resource ID, loan date, return date for loans after Jan 1, 2024
SELECT
    M.Member_Name,
    R.Resource_ID,
    L.Loan_Date,
    L.Date_Returned
FROM
    LOANS L
    JOIN MEMBERS M ON L.Member_ID = M.Member_ID
    JOIN RESOURCES R ON L.Resource_ID = R.Resource_ID
WHERE
    L.Loan_Date > TO_DATE('2024-01-01', 'YYYY-MM-DD');

-- 4) Retrieve all overdue loans with member details
SELECT
    L.Loans_ID,
    M.Member_Name,
    M.Member_Email
FROM
    LOANS L
    JOIN MEMBERS M ON L.Member_ID = M.Member_ID
WHERE
    L.Date_Returned IS NULL
    AND SYSDATE > L.Loan_Date + 21; -- Assuming 21-day loan period
