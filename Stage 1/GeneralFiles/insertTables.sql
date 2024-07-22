-- Inserting into Employee table
INSERT INTO Employee (em_id, first_name, last_name, salary) 
VALUES (1, 'John', 'Doe', 50000);
INSERT INTO Employee (em_id, first_name, last_name, salary) 
VALUES (2, 'Jane', 'Smith', 55000);
INSERT INTO Employee (em_id, first_name, last_name, salary) 
VALUES (3, 'Alice', 'Johnson', 60000);

-- Inserting into ReservationAgent table
INSERT INTO ReservationAgent (em_id, tech_proficiency, rating) 
VALUES (1, 'Expert', 5);
INSERT INTO ReservationAgent (em_id, tech_proficiency, rating) 
VALUES (2, 'Intermediate', 4);

-- Inserting into Receptionist table
INSERT INTO Receptionist (em_id, shift, lang) 
VALUES (3, 'Night', 'English');
INSERT INTO Receptionist (em_id, shift, lang) 
VALUES (2, 'Day', 'French');

-- Inserting into Room table
INSERT INTO Room (room_number, beds, balcony, price) 
VALUES (101, 2, 'Yes', 100);
INSERT INTO Room (room_number, beds, balcony, price) 
VALUES (102, 1, 'No', 80);
INSERT INTO Room (room_number, beds, balcony, price) 
VALUES (103, 3, 'Yes', 150);

-- Inserting into Guest table
INSERT INTO Guest (guest_id, first_name, last_name, phone, date_of_birth) 
VALUES (1, 'Michael', 'Brown', 1234567890, DATE '1985-07-15');
INSERT INTO Guest (guest_id, first_name, last_name, phone, date_of_birth) 
VALUES (2, 'Sarah', 'Davis', 9876543210, DATE '1990-12-05');

-- Inserting into Booking table
INSERT INTO Booking (guest_id, room_number, entry_date, days, em_id) 
VALUES (1, 101, DATE '2024-07-01', 3, 3);
INSERT INTO Booking (guest_id, room_number, entry_date, days, em_id) 
VALUES (2, 102, DATE '2024-07-02', 2, 2);

-- Inserting into Request table
INSERT INTO Request (guest_id, room_number) 
VALUES (1, 101);
INSERT INTO Request (guest_id, room_number) 
VALUES (2, 102);

-- Inserting into Inform table
INSERT INTO Inform (em_id, guest_id) 
VALUES (1, 1);
INSERT INTO Inform (em_id, guest_id) 
VALUES (2, 2);
