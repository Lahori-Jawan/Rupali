note::  AI -> auto increments
        PK -> Primary Key
        FK -> Foreign Key


Players (table)
    id (int) (PK) (AI)
    name (varchar)
    dob  (timestamp)
    gender  (char[10])

Registration (table)
    id                  (int) (PK) (AI)
    player_id           (int) (FK)
    registration_date   (timestamp)

Awards (table)
    id          (int) (PK) (AI)
    name        (varchar) (CK)
    tour Name   (char[30])

Tournaments (table)
    tour_id (int) (PK) (FK)
    
    

Tour (table)
    id      (int) (PK) (FK)
    name    (varchar)
    year    (timestamp)
    starts  (timestamp)
    ends    (timestamp)
    ranking_id (int) (FK)



Games (table)
    id          (int) (AI)
    player1_id  (int) (PK) (FK)
    player2_id  (int) (PK) (FK)
    winner      (varchar)
    score       (char[15])
    point1      (char[5])
    point2      (char[5])


-- Pivot Tables
Player_Award (table) (1-to-Many)
    id        (int) (AI)
    player_id (int) (PK) (FK)
    award_id  (int) (CK) (FK)


Player_Tour (table) (1-to-Many)
    id        (int) (PK) (AI)
    player_id (int) (FK)
    tour_id   (int) (FK)


Award_Tour (table) (1-to-Many)
    id          (int) (PK) (AI)
    tour_id     (int) (FK)
    award_id    (int) (FK)

Tour_Game (table) (1-to-Many)
    id        (int) (PK) (AI)
    tour_id   (int) (FK)
    game_id   (int) (FK)
-- Ranking (table)
--     id (int) (PK) (AI)
--     games_id (FK)
