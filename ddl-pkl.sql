-- PROGRESSION - 1


-- 1. **Create table city**
Create table city(
id NUMBER(11) primary key,
name varchar(50) NOT NULL   
);

-- 2. **Create table referee**
Create table referee(
id NUMBER(11) PRIMARY KEY,
    name  VARCHAR(50) NOT NULL

);

-- 3. **Create table innings**
Create table innings(
id  NUMBER(11) PRIMARY KEY,
    innings_number  NUMBER(11) NOT NULL

);

-- 4. **Create table extra_type**
Create table extr_type(
id  NUMBER(11) PRIMARY KEY,
    name  VARCHAR(50) NOT NULL

);

-- 5. **Create table skill**
Create table skill(
id NUMBER(11) PRIMARY KEY,
name  VARCHAR(50) NOT NULL

);

-- 6. **Create table team**
Create table team(
    id NUMBER(11) PRIMARY KEY,
    name  VARCHAR(50) NOT NULL,
    coach  VARCHAR(50) NOT NULL,
    home_city  NUMBER(11) NOT NULL,
    captain  NUMBER(11) NOT NULL,
    FOREIGN KEY ( home_city )
        REFERENCES city ( id )

);

-- 7. **Create table player**
Create table player(
id  NUMBER(11) PRIMARY KEY,
    name  NUMBER(11) NOT NULL,
    country   VARCHAR(50) NOT NULL,
    skill_id  NUMBER(11) NOT NULL,
    team_id   NUMBER(11) NOT NULL,
    FOREIGN KEY ( skill_id )
        REFERENCES skill ( id ),
    FOREIGN KEY ( team_id )
        REFERENCES team ( id )

);

-- 8. **Create table venue**
Create table venue(
   id  NUMBER(11) PRIMARY KEY,
    stadium_name  VARCHAR(50) NOT NULL,
    city_id       NUMBER(11) NOT NULL,
    FOREIGN KEY ( city_id )
    REFERENCES city ( id )

);

-- 9. **Create table event**
Create table event(
    id  NUMBER(11) PRIMARY KEY,
    innings_  NUMBER(11) NOT NULL,
    event_no   NUMBER(11) NOT NULL,
    raider_id    NUMBER(11) NOT NULL,
    raid_points   NUMBER(11) NOT NULL,
    defending_points  NUMBER(11) NOT NULL,
    clock_in_seconds  NUMBER(11) NOT NULL,
    team_one_score    NUMBER(11) NOT NULL,
    team_two_score    NUMBER(11) NOT NULL,
    FOREIGN KEY ( innings_id )
        REFERENCES innings ( id ),
    FOREIGN KEY ( raider_id )
        REFERENCES player ( id )

);
-- 10. **Create table extra_event**
Create table extra_event(
    id   NUMBER(11) PRIMARY KEY,
    event_id         NUMBER(11) NOT NULL,
    extra_type_id    NUMBER(11) NOT NULL,
    points           NUMBER(11) NOT NULL,
    scoring_team_id  NUMBER(11) NOT NULL,
    FOREIGN KEY ( event_id )
        REFERENCES event ( id ),
    FOREIGN KEY ( extra_type_id )
        REFERENCES extra_type ( id ),
    FOREIGN KEY ( scoring_team_id )
        REFERENCES team ( id )

);

-- 11. **Create table outcome**
Create table outcome(
    id NUMBER(11) PRIMARY KEY,
    status    VARCHAR(100) NOT NULL,
    winner_team_id   NUMBER(11),
    score            NUMBER(11),
    player_of_match  NUMBER(11),
    FOREIGN KEY ( winner_team_id )
        REFERENCES team ( id ),
    FOREIGN KEY ( player_of_match )
        REFERENCES player ( id )

);

-- 12. **Create table game**
Create table game(
    id NUMBER(11) PRIMARY KEY,
    game_date          DATE NOT NULL,
    team_id_1          NUMBER(11) NOT NULL,
    team_id_2          NUMBER(11) NOT NULL,
    venue_id           NUMBER(11) NOT NULL,
    outcome_id         NUMBER(11) NOT NULL,
    referee_id_1       NUMBER(11) NOT NULL,
    referee_id_2       NUMBER(11) NOT NULL,
    first_innings_id   NUMBER(11) NOT NULL,
    second_innings_id  NUMBER(11) NOT NULL,
    FOREIGN KEY ( team_id_1 )
        REFERENCES team ( id ),
    FOREIGN KEY ( team_id_2 )
        REFERENCES team ( id ),
    FOREIGN KEY ( venue_id )
        REFERENCES venue ( id ),
    FOREIGN KEY ( outcome_id )
        REFERENCES outcome ( id ),
    FOREIGN KEY ( referee_id_1 )
        REFERENCES referee ( id ),
    FOREIGN KEY ( referee_id_2 )
        REFERENCES referee ( id ),
    FOREIGN KEY ( first_innings_id )
        REFERENCES innings ( id ),
    FOREIGN KEY ( second_innings_id )
        REFERENCES innings ( id )

);

-- 13. **Drop table city**
Create table city(
DROP TABLE city CASCADE CONSTRAINTS;
);

-- 14. **Drop table innings**
Drop table innings(
DROP TABLE innings CASCADE CONSTRAINTS;
);

-- 15. **Drop table skill**
Drop table skill(
DROP TABLE skill CASCADE CONSTRAINTS;

);

-- 16. **Drop table extra_type**
Drop table extra_type(
DROP TABLE extra_type CASCADE CONSTRAINTS;

);
