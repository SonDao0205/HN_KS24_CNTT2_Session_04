DROP database miniproject04;
CREATE database miniproject04;
USE miniproject04;

CREATE TABLE Student (
    student_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Instructor (
    instructor_id VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Course (
    course_id VARCHAR(20) PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    description VARCHAR(255),
    total_sessions INT CHECK (total_sessions > 0),
    instructor_id VARCHAR(20),
    FOREIGN KEY (instructor_id) REFERENCES Instructor(instructor_id) ON DELETE CASCADE
);

CREATE TABLE Enrollment (
    student_id VARCHAR(20),
    course_id VARCHAR(20),
    enroll_date DATE NOT NULL,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Course(course_id) ON DELETE CASCADE
);

CREATE TABLE Result (
    student_id VARCHAR(20),
    course_id VARCHAR(20),
    mid_score DECIMAL(4,2) CHECK (mid_score BETWEEN 0 AND 10),
    final_score DECIMAL(4,2) CHECK (final_score BETWEEN 0 AND 10),
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id) ON DELETE CASCADE,
    FOREIGN KEY (course_id) REFERENCES Course(course_id) ON DELETE CASCADE
);


-- Thêm 5 sinh viên
INSERT INTO Student VALUES
('SV01','Nguyen Van A','2005-01-10','a@gmail.com'),
('SV02','Nguyen Van B','2005-03-12','b@gmail.com'),
('SV03','Nguyen Van C','2005-05-15','c@gmail.com'),
('SV04','Nguyen Van D','2005-07-20','d@gmail.com'),
('SV05','Nguyen Van E','2005-09-25','e@gmail.com');

-- Thêm 5 giảng viên
INSERT INTO Instructor VALUES
('GV01','Tran Thay 1','gv1@gmail.com'),
('GV02','Tran Thay 2','gv2@gmail.com'),
('GV03','Tran Thay 3','gv3@gmail.com'),
('GV04','Tran Thay 4','gv4@gmail.com'),
('GV05','Tran Thay 5','gv5@gmail.com');

-- Thêm 5 khoá học
INSERT INTO Course VALUES
('C01','SQL Co Ban','Hoc SQL tu co ban',10,'GV01'),
('C02','Java Core','Lap trinh Java',15,'GV02'),
('C03','Python','Lap trinh Python',12,'GV03'),
('C04','Web HTML','Thiet ke web',8,'GV04'),
('C05','Data Analysis','Phan tich du lieu',14,'GV05');


-- Thêm 5 phiếu đăng ký học
INSERT INTO Enrollment VALUES
('SV01','C01','2024-09-01'),
('SV01','C02','2024-09-01'),
('SV02','C01','2024-09-02'),
('SV03','C03','2024-09-03'),
('SV04','C04','2024-09-04');

-- Thêm 5 bảng dữ liệu học tập
INSERT INTO Result VALUES
('SV01','C01',7.5,8.5),
('SV01','C02',6.5,7.0),
('SV02','C01',8.0,9.0),
('SV03','C03',7.0,8.0),
('SV04','C04',6.0,7.5);

-- Cập nhật email sinh viên
UPDATE Student
SET email = 'newa@gmail.com'
WHERE student_id = 'SV01';

-- Cập nhật mô tả khoá học
UPDATE Course
SET description = 'Hoc SQL tu co ban den nang cao'
WHERE course_id = 'C01';

-- Cập nhật điểm cuối kì
UPDATE Result
SET final_score = 9.5
WHERE student_id = 'SV01' AND course_id = 'C01';


-- Xoá phiếu đăng ký
DELETE FROM Enrollment
WHERE student_id = 'SV04' AND course_id = 'C04';

-- Danh sách sinh viên
SELECT * FROM Student;

-- Danh sách giảng viên
SELECT * FROM Instructor;

-- Danh sách khoá học
SELECT * FROM Course;

-- Danh sách phiếu đăng ký
SELECT * FROM Enrollment;

-- Danh sách điểm
SELECT * FROM Result;