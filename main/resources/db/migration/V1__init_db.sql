create table classrooms (
    id int8 generated by default as identity,
    capacity int4 not null,
    name varchar(255) not null,
    primary key (id)
);

create table groups (
    id int8 generated by default as identity,
    name varchar(255) not null,
    primary key (id)
);

create table students (
    id int8 generated by default as identity,
    first_name varchar(255) not null,
    group_id int8 references groups(id) on delete cascade,
    last_name varchar(255) not null,
    primary key (id)
);

create table subjects (
    id int8 generated by default as identity,
    description varchar(255) not null,
    name varchar(255) not null,
    primary key (id)
);

create table teachers (
    id int8 generated by default as identity,
    academic_degree varchar(255) not null,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    primary key (id)
);

create table schedules (
    id int8 generated by default as identity,
    calendar_date DATE not null,
    group_id int8 references groups(id) on delete cascade,
    teacher_id int8 references teachers(id) on delete cascade,
    order_time varchar(255) not null,
    subject_id int8 references subjects(id) on delete cascade,
    classroom_id int8 references classrooms(id) on delete cascade,
    primary key (id)
);

CREATE TABLE group_subjects(
    subject_id INTEGER REFERENCES subjects(id) ON DELETE CASCADE,
    group_id INTEGER REFERENCES groups(id) ON DELETE CASCADE
);
