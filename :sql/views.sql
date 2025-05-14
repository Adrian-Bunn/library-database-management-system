-- View summary of member’s loans
CREATE VIEW MemberLoanSummary AS
SELECT
    M.Member_ID,
    M.Member_Name,
    COUNT(L.Loans_ID) AS Loans_Out
FROM
    MEMBERS M
    LEFT JOIN LOANS L ON M.Member_ID = L.Member_ID
WHERE
    L.Date_Returned IS NULL
GROUP BY
    M.Member_ID,
    M.Member_Name;

-- View most popular resources by loan count
CREATE VIEW PopularResources AS
SELECT
    R.Resource_ID,
    CASE
        WHEN R.Book_ID IS NOT NULL THEN 'Book'
        WHEN R.eBook_ID IS NOT NULL THEN 'eBook'
        WHEN R.Equipment_ID IS NOT NULL THEN 'Equipment'
    END AS Resource_Type,
    COUNT(L.Loans_ID) AS Loan_Count
FROM
    RESOURCES R
    LEFT JOIN LOANS L ON R.Resource_ID = L.Resource_ID
GROUP BY
    R.Resource_ID,
    R.Book_ID,
    R.eBook_ID,
    R.Equipment_ID
ORDER BY
    Loan_Count DESC;

-- View suspended members with amount owed
CREATE VIEW SuspendedMembers AS
SELECT
    F.Member_ID,
    M.Member_Name,
    F.Amount
FROM
    FINES F
    JOIN MEMBERS M ON F.Member_ID = M.Member_ID
WHERE
    F.Amount >= 10;
