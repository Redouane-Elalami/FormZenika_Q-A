alter table game
       drop constraint FKoewnf7xq7t8nsjvbj2ei9sevr;

alter table game
       drop constraint FKt0wy7dwll01bqq3gon9m2x48k;

drop table game if exists;
drop table game_board if exists;
drop table square if exists;
drop table users if exists;

drop sequence id_game_seq if exists;
drop sequence id_gameboard_seq if exists;
drop sequence id_square_seq if exists;


create sequence id_game_seq start with 1 increment by 1;
create sequence id_gameboard_seq start with 1 increment by 1;
create sequence id_square_seq start with 1 increment by 1;


create table game (
       id_game bigint not null,
        game_state varchar(255),
        player_turn varchar(255),
        id_gameboard bigint,
        id_user integer,
        primary key (id_game)
    );

create table game_board (
       id_gameboard bigint not null,
        primary key (id_gameboard)
    );

create table square (
       id_square bigint not null,
        column integer not null,
        id_game_board bigint,
        line integer not null,
        square_state varchar(255),
        primary key (id_square)
    );

create table users (
       id_user integer generated by default as identity (start with 1),
        password varchar(255),
        username varchar(255),
        primary key (id_user)
    );

alter table game
       add constraint FKoewnf7xq7t8nsjvbj2ei9sevr
       foreign key (id_gameboard)
       references game_board;

alter table game
       add constraint FKt0wy7dwll01bqq3gon9m2x48k
       foreign key (id_user)
       references users;


INSERT INTO USERS(username, password) VALUES('admin', 'admin');
INSERT INTO USERS(username, password) VALUES('user', 'user');