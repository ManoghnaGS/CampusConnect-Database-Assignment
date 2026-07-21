PRAGMA foreign_keys = ON;

CREATE TABLE Students (
    student_id INTEGER PRIMARY KEY NOT NULL,
    student_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT,
    department TEXT NOT NULL
);

CREATE TABLE Courses (
    course_id INTEGER PRIMARY KEY NOT NULL,
    course_name TEXT NOT NULL,
    credits INTEGER NOT NULL CHECK(credits BETWEEN 1 AND 6),
    available_seats INTEGER NOT NULL DEFAULT 30
);

CREATE TABLE Instructors (
    instructor_id INTEGER PRIMARY KEY NOT NULL,
    instructor_name TEXT NOT NULL,
    specialization TEXT
);

CREATE TABLE Enrollments (
    enrollment_id INTEGER PRIMARY KEY NOT NULL,
    student_id INTEGER NOT NULL,
    course_id INTEGER NOT NULL,
    instructor_id INTEGER,
    enrollment_date DATE DEFAULT CURRENT_DATE,

    FOREIGN KEY(student_id) REFERENCES Students(student_id),
    FOREIGN KEY(course_id) REFERENCES Courses(course_id),
    FOREIGN KEY(instructor_id) REFERENCES Instructors(instructor_id)
);
