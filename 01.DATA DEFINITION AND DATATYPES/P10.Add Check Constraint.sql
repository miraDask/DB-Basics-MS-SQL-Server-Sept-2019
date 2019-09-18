ALTER TABLE Users
ADD CONSTRAINT CHK_PasswordLengthIsNoLongerThan5Symbols 
CHECK (LEN([Password]) >= 5)