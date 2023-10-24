-- Add a new user
INSERT INTO `users` (`first_name`, `last_name`, `username`, `password`)
VALUES ('Anh', 'Vu', 'vpa24', '$2y$10$FUWoQN27QvdymzFATFFozukEN3Qdse/9BqO1xzkZ9Vqq/eW5uaVC.');

-- Add a new word
INSERT INTO `words` (`name`)
VALUES ('round');

-- Add a new word onwership
INSERT INTO `word_ownerships` (`user_id`, `word_id`)
VALUES (1, 1);

-- Add a new word entry
INSERT INTO `word_entries` (`word_ownership_id`, `type`, `definition`, `example`)
VALUES (1, 'noun', 'in a circular direction or position', 'The moon goes round the earth.');
INSERT INTO `word_entries` (`word_ownership_id`, `type`, `definition`, `example`)
VALUES (1, 'noun', 'one of a series of similar events', 'Her second round of chemotherapy recently ended.');

--- Find all submissions given username
SELECT `words`.`name` FROM `words`
INNER JOIN `word_ownerships`
ON `words`.`id` = `word_ownerships`.`word_id`
INNER JOIN `users`
ON `users`.`id` = `word_ownerships`.`user_id`
WHERE `users`.`username` = 'vpa24';

--- Stored Procedures with Parameters given month and user id
delimiter //
CREATE PROCEDURE `total_word_from_month_and_user_id`(IN `month` INT, IN `user_id` INT)
BEGIN
 SELECT COUNT(`words`.`name`) as 'total' FROM `words`
 INNER JOIN `word_ownerships`
 ON `words`.`id` = `word_ownerships`.`word_id`
 INNER JOIN `users`
 ON `users`.`id` = `word_ownerships`.`user_id`
 WHERE `users`.`id` = `user_id`
 AND MONTH(`word_ownerships`.`created`) = `month`;
END//
delimiter ;

CALL `total_word_from_month_and_user_id`(10,1);



