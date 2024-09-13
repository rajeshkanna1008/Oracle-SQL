
--1. Write a query to display student details and dept details who are joining in the year of 2022 and dept_name is hr.
--dept table and student table.
SELECT
    *
FROM
    students,
    department
WHERE
    students.dept_id = department.dept_id
    AND joining_date LIKE '%2022'
    AND dept_name = 'HR';

---2. write a query to display staff details and subject details who are teaching English 
----and drawing who is ending in the month of 12.
---staff table and suBject table.
SELECT
    sf.staff_name,
    s.sub_name
FROM
    staff sf,
    subject s,
    department d
WHERE
    sf.dept_id = d.dept_id
    AND s.dept_id = d.dept_id
    AND s.sub_name IN (
        'English',
        'Drawing'
    )
    AND sf.end_date LIKE '%12%';

---3. Write a query to display student details and project details
---who is working on website redesign and joining date from 2021.
---student,project
SELECT
    st.st_name,
    p.project_name
FROM
    students st,
    project p,
    student_project_assignment sp
WHERE
    st.st_id = sp.st_id
    AND sp.project_id = p.project_id
    AND p.project_name = 'Website Redesign'
    AND st.joining_date LIKE '%2021';

select * from project;

----4. write a query to display student details who are not completed
------their project work along with project name.
   --student table , project table,
SELECT
    *
FROM
    students,
    student_project_assignment
WHERE
    students.st_id = student_project_assignment.st_id; 
   

---5. Write a query to display student details who are coming from ngri, and end_year in 23.
---student, stu_location

SELECT
    *
FROM
    students,
    student_adderess
WHERE
    students.st_id = student_adderess.st_id
    AND location = 'ngri'
    AND end_date LIKE '%23';




--6. Write a query to display student location, location pin and student name

SELECT
    s.st_name,
    l.location,
    l.loc_pin
FROM
    students          s,
    student_adderess  l
WHERE
    s.st_id = l.st_id;

--7. Write a query to display who are eligible for scholorship along with the name
--of the student and their department

select * from scholorship;
select * from dept;
select * from students;

SELECT
    st.st_name,
    d.dept_name,
    sc.eligible
FROM
    students     st,
    department   d,
    scholorship  sc
WHERE
        st.st_id = sc.st_id
    AND st.dept_id = d.dept_id
    and sc.eligible = 'Yes' ;

--========================================

--8. WAQTD student name, department name, project name, location pin?
select * from students;
select * from project;
select * from dept;
select * from student_adderess;

SELECT
    st.st_name,
    d.dept_name,
    pr.project_name,
    sd.loc_pin
FROM
    students          st,
    project           pr,
    department         d,
    student_adderess  sd
WHERE
        st.st_id = sd.st_id
    AND pr.dept_id = d.dept_id
    AND st.dept_id = d.dept_id;
    


--9. WAQTD role name, staff name, joining date
select * from roles;
select * from staff;

SELECT
    r.role_name,
    st.staff_name
FROM
    roles  r,
    staff  st
WHERE
    r.role_id = st.role_id;
    


--10. WAQTD project name, department name, duration of the project
select * from project;
select * from department;

select pr.project_name, pr.duration,d.dept_name
from project pr, department d
where d.dept_id = pr.dept_id;


--11. write a query to display the role name of the staff who are working as 'LIBRARIAN'
select * from roles;
select * from staff;

select r.role_name,st.staff_name
from roles r,staff st
where st.role_id = r.role_id
and role_name = 'librarian';

--12. write a query to display projectname,startdate, studentname who are completed intime

select * from project;
select * from student_project_assignment;
select * from students;

SELECT
    pr.project_name,
    sp.start_date,
    st.st_name,
    sp.completion_intime
FROM
    project                     pr,
    student_project_assignment  sp,
    students                    st
WHERE
        pr.project_id = sp.project_id
    AND sp.st_id = st.st_id
    AND completion_intime = 'Completed';


--13. write a query to display sub_name,staff_name,dept_name,rolename,,joining_date who are not 'principle'?
select * from subject;
select * from staff;
select * from department;


SELECT
    sub.sub_name,
    st.staff_name,
    dt.dept_name,
    r.role_name,
    st.joining_date
FROM
    subject     sub,
    staff       st,
    department  dt,
    roles       r
WHERE
        sub.dept_id = st.dept_id
    AND st.dept_id = dt.dept_id
    AND st.role_id = r.role_id
    AND role_name <> 'principle';
    
--14. write a query to display department details and staff details 
--where start date of department is in either 'march' or 'JULY'?


select * from staff;
select * from department;

SELECT
    d.dept_name,
    st.staff_name
FROM
    department  d
    LEFT JOIN staff       st ON st.dept_id = d.dept_id
WHERE
    to_char(start_date, 'FMMONTH') = 'MARCH'
    OR to_char(start_date, 'FMMONTH') = 'JULY';

--15.write a query to display dept_name,st_name,staffname,rolename,subname,project name

SELECT
    d.dept_name,
    st.st_name,
    sf.staff_name,
    r.role_name,
    pr.project_name
FROM
    department  d,
    students    st,
    staff       sf,
    roles       r,
    project     pr
WHERE
        d.dept_id = st.dept_id
    AND sf.dept_id = d.dept_id
    AND sf.role_id = r.role_id
    AND d.dept_id = pr.dept_id;

--=============================================
select * from HOTEL_LOCATION;
SELECT  * FROM XX_Hotel;
SELECT * FROM PRICE;
SELECT * FROM details_of_hotel;
SELECT * FROM ROOM;
SELECT * FROM CUSTOMER; 
select * from BOOKING;
select * from BILLINGDETAILS;
select * from PAYMENT;


--1 Write a query to display hotel name,location name,number of rooms present in hotel reservation database?

SELECT
    h.hotel_name,
    hl.location_name,
    dh.no_of_rooms
FROM
    details_of_hotel dh,
    hotel_location hl,
    xx_hotel h
WHERE
    h.location_id = hl.location_id
    AND dh.hotel_id = h.hotel_id;

---2. Write a query to display customer name,number of persons,total bill and payment by using hotel reservation database?
select
      c.customer_name,
      b.no_of_person,
      bd.totalbill,
      p.paymentmode
from 
     customer c,
     booking b,
     billingdetails bd,
     payment p
where 
     c.customer_id=bd.customer_id
     and c.customer_id=b.customer_id
     and p.bill_no=bd.bill_no;


--3.Write a query to display the total customer details who are stayed in the location of nalgonda?

SELECT
    c.customer_name,
    b.no_of_person,
    bd.totalbill,
    p.paymentmode
FROM
    customer        c,
    billingdetails  bd,
    booking         b,
    payment         p
WHERE
    c.customer_id = b.customer_id
    AND b.booking_id = bd.booking_id
    and bd.bill_no = p.bill_no;
       
--4.Write a query to display BOOKING details where hotel id is 101?

SELECT
    c.*
FROM
    customer        c,
    booking         b,
    xx_hotel        h,
    hotel_location  hl
WHERE
        c.customer_id = b.customer_id
    AND b.hotel_id = h.hotel_id
    AND h.location_id = hl.location_id
    AND hl.city = 'NALGONDA';
    
--5. write a query to display hotel name,city,state,customer name,mail form the database?
   
select 
      h.hotel_name,
      hl.city,
      hl.state,
      c.customer_name,
      c.mailid
from       
      hotel_location hl,
      customer c,
      xx_hotel h,
      booking b
where 
     h.location_id=hl.location_id
     and b.hotel_id=h.hotel_id
     and b.customer_id=c.customer_id;

--6. WAQTD the hotel id and location name from the given table?

SELECT
    xh.hotel_id,
    hl.location_name
FROM
    xx_hotel        xh,
    hotel_location  hl
WHERE
    xh.location_id = hl.location_id;

--7. display the name of the customer who booking date is '09-jun-23'

SELECT
    c.customer_name
FROM
    customer  c,
    booking   b
WHERE
        c.customer_id = b.customer_id
    AND b.bookingdate = '09-06-23';

--8. display the room no and room price from the given table?
SELECT
    r.roomno,
    p.roomprice
FROM
    price  p,
    room   r
WHERE
    r.typeofroom = p.roomtype;

--9.dispaly the loc of a 'ABC'  hotel?

SELECT
    hl.location_name
FROM
    xx_hotel        h,
    hotel_location  hl
WHERE
    h.location_id = hl.location_id
    and h.hotel_name = 'ABC';
    
--10. display the billing deatils of a customer id='1001'? 

SELECT
    hl.*
FROM
    hotel_location  hl,
    customer        c,
    booking         b,
    xx_hotel        xh
WHERE
    c.customer_id = b.customer_id
    AND b.hotel_id = xh.hotel_id
    AND hl.location_id = xh.location_id
    AND c.customer_id = 1001;

--11. Write a query to display Hotal_id's and customer_id's who located in'NLG'?

SELECT
    xh.hotel_id,
    c.customer_id
FROM
    hotel_location  hl,
    xx_hotel        xh,
    customer        c,
    booking         b
WHERE
    xh.hotel_id = b.hotel_id
    AND c.customer_id = b.customer_id
    AND xh.location_id = hl.location_id
    AND location_name = 'NGL';
    
--12.WAQTD NO.OF Customers are present in each and every hotal?

SELECT
    h.hotel_name,
    c.customer_name,
    COUNT(*)
FROM
    xx_hotel  h,
    customer  c,
    booking   b
WHERE
    h.hotel_id = b.hotel_id
    AND b.customer_id = c.customer_id
GROUP BY
    h.hotel_name,
    c.customer_name;

--13.WAQTD NO.OF bills generated in location 'BNG' and customers phone numbers?

SELECT
    hl.location_id,
    hl.location_name,
    c.customer_id,
    c.customer_name,
    c.phone_number,
    bd.bill_no,
    COUNT(*)
FROM
    hotel_location  hl,
    customer        c,
    billingdetails  bd,
    xx_hotel        h,
    booking         b
WHERE
    hl.location_id = h.location_id
    AND h.hotel_id = b.hotel_id
    AND b.customer_id = c.customer_id
    AND c.customer_id = bd.customer_id
    AND hl.location_name = 'BNG'
GROUP BY
    hl.location_id,
    hl.location_name,
    c.customer_id,
    c.customer_name,
    c.phone_number,
    bd.bill_no;

--14.WAQTD list customers who booked in 12 jun 2023 in every branch?

SELECT
    c.customer_name
FROM
    customer  c,
    booking   b
WHERE
    c.customer_id = b.customer_id;
    
--15. WAQTD customer_id's who stayed in 'HYD' and there address?

SELECT
    c.customer_id
FROM
    customer        c,
    hotel_location  hl,
    xx_hotel        xh,
    booking         b
WHERE
    c.customer_id = b.customer_id
    AND hl.location_id = xh.location_id
    AND b.hotel_id = xh.hotel_id
    AND hl.location_name = 'HYD';

--16. display the roomprice,roomtype,charge type,hotelname,location_name where location_id=2?

SELECT
    p.roomprice,
    p.roomtype,
    p.chargetype,
    h.hotel_name,
    hl.location_name,
    hl.location_id
FROM
    xx_hotel h,
    price p,
    hotel_location hl,
    details_of_hotel dh, room r WHERE hl.location_id = h.location_id
                                AND dh.floor_id = r.floor_id
                                AND r.typeofroom = p.roomtype
                                AND dh.hotel_id = h.hotel_id
                                AND hl.location_id = 2;
                                
--17. waq location_name ,area where contacto='1234567890'

SELECT
    hl.location_name,
    hl.area
FROM
    hotel_location  hl,
    xx_hotel        xh
WHERE
        hl.location_id = xh.location_id
    AND xh.contact_number = 1234567890;
    
--18. waq location_name,address,hotel_name,roomtype and hotel_name='ABC'

SELECT
    hl.location_name,
    hl.address_1,
    hl.address_2,
    xh.hotel_name,
    p.roomtype
FROM
    hotel_location  hl,
    xx_hotel        xh,
    price           p,
    booking         b
WHERE
    hl.location_id = xh.location_id
    AND xh.hotel_id = b.hotel_id
    AND b.hotel_id = xh.hotel_id
    AND xh.hotel_name = 'ABC';
    
--19.waq to display address_2,area,city where pincode is 500072  
--but room_price should be less than 4000 and print room type also

SELECT
    hl.address_2,
    hl.area,
    hl.city,
    p.roomtype
FROM
    hotel_location    hl,
    xx_hotel          xh,
    details_of_hotel  dh,
    room              r,
    price             p
WHERE
    hl.location_id = xh.location_id
    AND xh.hotel_id = dh.hotel_id
    AND dh.floor_id = r.floor_id
    AND r.typeofroom = p.roomtype
    AND hl.pin_code = 500072
    AND p.roomprice < 4000;
    
--20. waq to display hotel_name,location_name and created by Anil show me last_updated_by null

SELECT
    xh.hotel_name,
    hl.location_name,
    xh.created_by,
    xh.last_updated_by
FROM
    hotel_location  hl,
    xx_hotel        xh
WHERE
    hl.location_id = xh.location_id
    AND xh.created_by = 'ANIL'
    AND xh.last_updated_by = 'NULL';