create database student;
use student;
create table class(
                      id int primary key auto_increment,
                      name varchar(255),
                      language varchar(255),
                      description varchar(255)
);
create table  address(
                         id int primary key auto_increment,
                         address varchar(255)
);
create table students(
                         id int primary key auto_increment,
                         fullname varchar(255),
                         address_id int,
                         phoneNumber varchar(255) unique ,
                         class_id int,
                         foreign key (address_id) references address(id),
                         foreign key (class_id) references class(id)
);
create table course(
                       course_id int primary key auto_increment,
                       name varchar(255),
                       description varchar(255)
);
create table point(
                      id int primary key auto_increment,
                      course_id int,
                      student_id int,
                      point double,
                      foreign key (course_id) references course(course_id),
                      foreign key (student_id) references students(id)
);
insert into address(address) values ('hà nội'),
                                    ('hồ chí minh'),
                                    ('đà nẵng'),
                                    ('huế'),
                                    ('quảng ninh');
insert into class(name,language) values ('A1','java'),
                                        ('A2','C'),
                                        ('A3','java'),
                                        ('A4','C#'),
                                        ('A5','PHP');

insert into students(fullname,address_id,phoneNumber,class_id)
values ('cong',1,'123',5),
       ('tung',1,'1234',1),
       ('hoang',2,'132',3),
       ('cong',3,'1231',1),
       ('ha',1,'1243',2),
       ('hieu',5,'1235',4),
       ('toan',3,'1236',1),
       ('liem',4,'1237',5),
       ('cong',2,'1238',2),
       ('cong',2,'1239',3);

insert into course(name) values ('6 months'),
                                ('9 months'),
                                ('3 months'),
                                ('4 months'),
                                ('5 months');

insert into point(course_id,student_id,point) values (1,1,8),
                                                     (2,2,8),
                                                     (1,3,7),
                                                     (3,4,6),
                                                     (4,5,8),
                                                     (1,6,9),
                                                     (5,7,10),
                                                     (2,8,7),
                                                     (3,9,8.5),
                                                     (1,10,9),
                                                     (4,3,7.5),
                                                     (3,5,10),
                                                     (5,6,9.5),
                                                     (1,10,7),
                                                     (4,9,6.5);
# lấy ra số lượng học sinh tại các tỉnh
select address as tinh, count(a.address) as soluong
from address a join students s on a.id = s.address_id group by a.address ;
# lấy ra số lượng học sinh của từng khóa học
select count(s.fullname) as soluong,name as tenlop
from students s join class c on s.class_id = c.id group by c.name;
# lấy ra điểm trung bình các khóa học
select name as khoahoc, avg(point) as diemTB
from course c join point p on c.course_id = p.course_id group by c.name;
# lấy ra khóa học có điểm trung bình cao nhất
select khoahoc, max(diemTB)
from (select name as khoahoc, avg(point) as diemTB from course c join point p on c.course_id = p.course_id group by c.name) as diemTB;



