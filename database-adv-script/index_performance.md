Database INDEXes are special lookup tables that the database search engine uses to speed up data retrieval. While they speed up data retrieval, they can slow down data modification operations (like INSERT, UPDATE, DELETE) because the index also needs to be updated. 
Key indicators to identify columns that would benefit most from indexing;
1. Used in WHERE Clauses
2. Used in JOIN Conditions
3. Used in ORDER BY Clauses
4. Used in LIKE Clauses