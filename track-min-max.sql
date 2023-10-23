SELECT
  (SELECT Milliseconds FROM Tracks WHERE Milliseconds = (SELECT MIN(Milliseconds) FROM Tracks)) AS MinTrack,
  (SELECT Milliseconds FROM Tracks WHERE Milliseconds = (SELECT MAX(Milliseconds) FROM Tracks)) AS MaxTrack;
