-- 1) Count of loans per member
SELECT
    M.Member_Name,
    COUNT(L.Loans_ID) AS Total_Loans
FROM
    MEMBERS M
    JOIN LOANS L ON M.Member_ID = L.Member_ID
GROUP BY
    M.Member_Name
ORDER BY
    Total_Loans DESC;

-- 2) Books loaned by class
SELECT
    C.Class_ID,
    COUNT(L.Loans_ID) AS Loan_Count
FROM
    LOANS L
    JOIN RESOURCES R ON L.Resource_ID = R.Resource_ID
    JOIN BOOKS B ON R.Book_ID = B.Book_ID
    JOIN CLASS C ON B.Class_ID = C.Class_ID
GROUP BY
    C.Class_ID;

-- 3) Members and total number of loans (ordered by count)
SELECT
    M.Member_ID,
    M.Member_Name,
    COUNT(L.Loans_ID) AS Total_Loans
FROM
    MEMBERS M
    JOIN LOANS L ON M.Member_ID = L.Member_ID
GROUP BY
    M.Member_ID,
    M.Member_Name
ORDER BY
    Total_Loans DESC;

-- 4) Fines owed by each member
SELECT
    M.Member_ID,
    M.Member_Name,
    SUM(F.Amount) AS Total_Fines
FROM
    MEMBERS M
    JOIN FINES F ON M.Member_ID = F.Member_ID
GROUP BY
    M.Member_ID,
    M.Member_Name
HAVING
    SUM(F.Amount) > 0
ORDER BY
    Total_Fines DESC;
