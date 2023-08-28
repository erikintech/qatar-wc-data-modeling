CREATE TABLE "conference" (
  "id" int PRIMARY KEY,
  "name" varchar(30)
);

CREATE TABLE "continent" (
  "id" int PRIMARY KEY,
  "name" varchar(30)
);

CREATE TABLE "group" (
  "id" int PRIMARY KEY,
  "name" varchar(2)
);

CREATE TABLE "coach" (
  "id" integer PRIMARY KEY,
  "name" varchar(80),
  "nationality" varchar(30),
  "age" integer
);

CREATE TABLE "nation" (
  "id" integer PRIMARY KEY,
  "name" varchar(30),
  "conference_id" int,
  "continent_id" int,
  "group_id" int,
  "coach_id" int
);

CREATE TABLE "position" (
  "id" integer PRIMARY KEY,
  "position" varchar(30),
  "cod" varchar(4)
);

CREATE TABLE "club" (
  "id" integer PRIMARY KEY,
  "name" varchar(60),
  "league" varchar(60)
);

CREATE TABLE "player" (
  "id" integer PRIMARY KEY,
  "name" varchar(120),
  "date_of_birth" date,
  "age" int,
  "jersey_no" int,
  "nation_id" int,
  "club_id" int,
  "position_to_play" int
);

CREATE TABLE "stadium" (
  "Id" integer PRIMARY KEY,
  "name" varchar(120),
  "city" varchar(120),
  "capacity" integer
);

CREATE TABLE "stage" (
  "id" int PRIMARY KEY,
  "name" varchar(30)
);

CREATE TABLE "referee" (
  "id" integer PRIMARY KEY,
  "name" varchar(120),
  "nationality" varchar(120)
);

CREATE TABLE "asst_referee" (
  "id" integer PRIMARY KEY,
  "name" varchar(120),
  "nationality" varchar(120)
);

CREATE TABLE "match_master" (
  "id" integer PRIMARY KEY,
  "play_stage" int,
  "play_date" date,
  "result" varchar(4),
  "goal_score" varchar(6),
  "decided_by" varchar(1),
  "referee_id" int,
  "asst_referee_1" int,
  "asst_referee_2" int,
  "asst_referee_3" int,
  "attendance" int
);

CREATE TABLE "match_detail" (
  "id" int PRIMARY KEY,
  "match_id" int,
  "nation_id" int,
  "win_lose" varchar(2),
  "goals" int,
  "fouls" int,
  "shoots" int,
  "passes" int,
  "corners" int
);

CREATE TABLE "goal_scored" (
  "id" integer PRIMARY KEY,
  "match_id" integer,
  "goal_scorer" int,
  "assistant" int,
  "type" varchar(2),
  "nation_id" integer,
  "goal_time" varchar(4),
  "play_stage" int
);

CREATE TABLE "yellow_card_details" (
  "id" integer PRIMARY KEY,
  "match_id" integer,
  "player_id" integer,
  "nation_id" integer
);

CREATE TABLE "red_card_detail" (
  "id" integer PRIMARY KEY,
  "match_id" integer,
  "nation_id" integer,
  "player_id" integer,
  "play_stage" int
);

CREATE TABLE "penalty_detail" (
  "id" integer PRIMARY KEY,
  "match_id" integer,
  "shooter_id" integer,
  "nation_id" int,
  "goal_scored" varchar(1)
);

ALTER TABLE "nation" ADD FOREIGN KEY ("conference_id") REFERENCES "conference" ("id");

ALTER TABLE "nation" ADD FOREIGN KEY ("continent_id") REFERENCES "continent" ("id");

ALTER TABLE "nation" ADD FOREIGN KEY ("group_id") REFERENCES "group" ("id");

ALTER TABLE "nation" ADD FOREIGN KEY ("coach_id") REFERENCES "coach" ("id");

ALTER TABLE "player" ADD FOREIGN KEY ("nation_id") REFERENCES "nation" ("id");

ALTER TABLE "player" ADD FOREIGN KEY ("club_id") REFERENCES "club" ("id");

ALTER TABLE "player" ADD FOREIGN KEY ("position_to_play") REFERENCES "position" ("id");

ALTER TABLE "match_master" ADD FOREIGN KEY ("play_stage") REFERENCES "stage" ("id");

ALTER TABLE "match_detail" ADD FOREIGN KEY ("match_id") REFERENCES "match_master" ("id");

ALTER TABLE "match_detail" ADD FOREIGN KEY ("nation_id") REFERENCES "nation" ("id");

ALTER TABLE "goal_scored" ADD FOREIGN KEY ("match_id") REFERENCES "match_master" ("id");

ALTER TABLE "goal_scored" ADD FOREIGN KEY ("goal_scorer") REFERENCES "player" ("id");

ALTER TABLE "goal_scored" ADD FOREIGN KEY ("assistant") REFERENCES "player" ("id");

ALTER TABLE "goal_scored" ADD FOREIGN KEY ("nation_id") REFERENCES "nation" ("id");

ALTER TABLE "goal_scored" ADD FOREIGN KEY ("play_stage") REFERENCES "stage" ("id");

ALTER TABLE "yellow_card_details" ADD FOREIGN KEY ("match_id") REFERENCES "match_master" ("id");

ALTER TABLE "yellow_card_details" ADD FOREIGN KEY ("player_id") REFERENCES "player" ("id");

ALTER TABLE "yellow_card_details" ADD FOREIGN KEY ("nation_id") REFERENCES "nation" ("id");

ALTER TABLE "red_card_detail" ADD FOREIGN KEY ("match_id") REFERENCES "match_master" ("id");

ALTER TABLE "red_card_detail" ADD FOREIGN KEY ("nation_id") REFERENCES "nation" ("id");

ALTER TABLE "red_card_detail" ADD FOREIGN KEY ("player_id") REFERENCES "player" ("id");

ALTER TABLE "red_card_detail" ADD FOREIGN KEY ("play_stage") REFERENCES "stage" ("id");

ALTER TABLE "penalty_detail" ADD FOREIGN KEY ("match_id") REFERENCES "match_master" ("id");

ALTER TABLE "penalty_detail" ADD FOREIGN KEY ("shooter_id") REFERENCES "player" ("id");

ALTER TABLE "penalty_detail" ADD FOREIGN KEY ("nation_id") REFERENCES "nation" ("id");
