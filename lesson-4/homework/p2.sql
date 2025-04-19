SELECT 
    Year1,
    Max1,
    Max2,
    Max3,
    -- Calculate the maximum value among Max1, Max2, Max3
    CASE 
        WHEN Max1 >= Max2 AND Max1 >= Max3 THEN Max1
        WHEN Max2 >= Max1 AND Max2 >= Max3 THEN Max2
        ELSE Max3
    END AS MaxValue
FROM TestMax;
