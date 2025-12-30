DROP database Exam;
CREATE database Exam;
USE Exam;

CREATE TABLE Student(
	id int primary key auto_increment,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone CHAR(10) NOT NULL UNIQUE
);

CREATE Table Course(
	id int primary key auto_increment,
    name VARCHAR(100) NOT NULL,
    credit int NOT NULL CHECK(credit > 0)
);

CREATE Table Enrollment(
	student_id int,
    course_id int,
    gradle DECIMAL(4,2) DEFAULT 0,
    primary key(student_id,course_id),
    -- foreign key(student_id) references Student(id) ON DELETE CASCADE,
    -- foreign key(course_id) references Course(id) ON DELETE CASCADE
    foreign key(student_id) references Student(id),
    foreign key(course_id) references Course(id)
);

-- Viết lệnh thêm dữ liệu mẫu , mỗi bảng thêm 5 bản ghi
INSERT INTO Student(name,email,phone) VALUES
("Nguyen van a","nguyenvana@gmail.com","0123456781"),
("Nguyen van b","nguyenvanb@gmail.com","0123456782"),
("Nguyen van c","nguyenvanc@gmail.com","0123456783"),
("Nguyen van d","nguyenvand@gmail.com","0123456784"),
("Nguyen van e","nguyenvane@gmail.com","0123456785");

INSERT INTO Course(name,credit) VALUES
("Toan",3),
("Van",3),
("Anh",3),
("Vat li",3),
("Hoa hoc",3);

INSERT INTO Course(id,name,credit) VALUES
(101,"Lịch sử",3);

INSERT INTO Enrollment(student_id,course_id,gradle) VALUES
(1,1,8.5),
(1,2,7.5),
(2,3,6.5),
(2,1,9.5),
(2,101,6);

-- Viết lệnh cập nhật: Sửa điểm số của sinh viên có mã sinh viên là 2 và mã khóa học 3 thành 9.0 trong bảng Enrollment
UPDATE Enrollment
SET gradle = 9.0
WHERE student_id = 2 AND course_id = 3;

-- Viết câu lệnh truy vấn lấy về danh sách học sinh hiện có với các cột sau : Họ tên , email , số điện thoại
SELECT name `Họ tên`,email,phone `Số điện thoại` FROM Student;


-- Viết câu lệnh xóa khóa học có Mã KH là 101 ra khỏi bảng Course
DELETE FROM Course
WHERE id = 101;

-- Lỗi : Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`exam`.`enrollment`, CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`))
-- Lý do : là vì Course này đang được ràng buộc cho 1 phần tử trong bảng Enrollment, nên không thể xoá được vì trong bảng Enrollment thuộc tính course_id không có "ON DELETE CASCADE" nên hệ thống không cho phép được xoá