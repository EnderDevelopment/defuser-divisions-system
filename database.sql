CREATE TABLE IF NOT EXISTS defuser_divisions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_id INT NOT NULL,
    defuses INT DEFAULT 0,
    fails INT DEFAULT 0,
    FOREIGN KEY (player_id) REFERENCES users(identifier)
);

INSERT INTO defuser_divisions (player_id) SELECT identifier FROM users WHERE identifier NOT IN (SELECT player_id FROM defuser_divisions);