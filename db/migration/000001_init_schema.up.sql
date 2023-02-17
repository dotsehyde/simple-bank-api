CREATE TABLE `accounts` (
  `id` int PRIMARY KEY,
  `owner` varchar(255) NOT NULL,
  `balance` float NOT NULL,
  `currency` varchar(255) NOT NULL,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `entries` (
  `id` int PRIMARY KEY,
  `account_id` int NOT NULL,
  `amount` int NOT NULL COMMENT 'can be negative or postive',
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE `transfers` (
  `id` int PRIMARY KEY,
  `from_account_id` int NOT NULL,
  `to_account_id` int NOT NULL,
  `amount` float NOT NULL,
  `created_at` timestamp DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX `accounts_index_0` ON `accounts` (`owner`);

CREATE INDEX `entries_index_1` ON `entries` (`account_id`);

CREATE INDEX `transfers_index_2` ON `transfers` (`from_account_id`);

CREATE INDEX `transfers_index_3` ON `transfers` (`to_account_id`);

CREATE INDEX `transfers_index_4` ON `transfers` (`from_account_id`, `to_account_id`);

ALTER TABLE `entries` ADD FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`);

ALTER TABLE `transfers` ADD FOREIGN KEY (`from_account_id`) REFERENCES `accounts` (`id`);

ALTER TABLE `transfers` ADD FOREIGN KEY (`to_account_id`) REFERENCES `accounts` (`id`);
