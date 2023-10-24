-- Represent users who can create or add a new vocabulary word
CREATE TABLE `users` (
    `id` INT AUTO_INCREMENT,
    `first_name` VARCHAR(20) NOT NULL,
    `last_name` VARCHAR(20) NOT NULL,
    `username` VARCHAR(25) NOT NULL UNIQUE,
    `password` VARCHAR(100) NOT NULL,
    PRIMARY KEY(`id`)
);

-- Represent words
CREATE TABLE `words` (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    PRIMARY KEY(`id`)
);

-- Represent word_onwerships of words by users
CREATE TABLE `word_ownerships` (
    `id` INT AUTO_INCREMENT,
    `user_id` INT,
    `word_id` INT,
    `created` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`word_id`) REFERENCES `words`(`id`)
);

-- Represent word entries contain in word onwerships
CREATE TABLE `word_entries` (
    `id` INT AUTO_INCREMENT,
    `word_ownership_id` INT,
    `type` ENUM('noun', 'verb', 'adjective', 'adverb') NOT NULL,
    `definition` VARCHAR(200) NOT NULL,
    `example` VARCHAR(200) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`word_ownership_id`) REFERENCES `word_ownerships`(`id`)
);

-- Create indexes to speed common searches
CREATE INDEX `word_name_search` ON `words` (`name`);
