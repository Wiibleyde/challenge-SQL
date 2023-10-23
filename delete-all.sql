PRAGMA foreign_keys = 0; -- Disable foreign key constraints

DROP TABLE IF EXISTS artists; -- Delete the "artist" table

PRAGMA foreign_keys = 1; -- Re-enable foreign key constraints
