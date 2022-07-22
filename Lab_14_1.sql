-- Connection 1 – Session ID: <put @@SPID result here>
/* Leave the above line to easily see that this query window
belongs to Connection 1. */
SELECT @@SPID;
GO
CREATE DATABASE TestDB;
GO
USE TestDB;
GO
CREATE SCHEMA Test;
GO
CREATE TABLE Test.TestTable (
Col1 INT NOT NULL
,Col2 INT NOT NULL
);
INSERT Test.TestTable (Col1, Col2) VALUES (1,10);
INSERT Test.TestTable (Col1, Col2) VALUES (2,20);
INSERT Test.TestTable (Col1, Col2) VALUES (3,30);
INSERT Test.TestTable (Col1, Col2) VALUES (4,40);
INSERT Test.TestTable (Col1, Col2) VALUES (5,50);
INSERT Test.TestTable (Col1, Col2) VALUES (6,60);

--------------------------------------------------
-- Connection 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRAN;
SELECT * FROM Test.TestTable
WHERE Col1 = 1;

---------------------------------------------------
---Connection 1
COMMIT TRAN;----------------------------------------------------- Connection 1
SET TRANSACTION ISOLATION LEVEL READ COMMITTED;
BEGIN TRAN;
SELECT * FROM Test.TestTable
WHERE Col1 = 1;
-- This SELECT statement will be blocked!