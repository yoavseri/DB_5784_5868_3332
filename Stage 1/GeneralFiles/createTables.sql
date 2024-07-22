-- Table to store employee details
CREATE TABLE Employee
(
  em_id INT NOT NULL,
  first_name VARCHAR2(20) NOT NULL,
  last_name VARCHAR2(20) NOT NULL,
  salary INT NOT NULL,
  PRIMARY KEY (em_id)
);

-- Table to store reservation agent details, extending Employee
CREATE TABLE ReservationAgent
(
  em_id INT NOT NULL,
  tech_proficiency VARCHAR2(15) NOT NULL,
  rating INT NOT NULL,
  PRIMARY KEY (em_id),
  FOREIGN KEY (em_id) REFERENCES Employee(em_id)
);

-- Table to store receptionist details, extending Employee
CREATE TABLE Receptionist
(
  em_id INT NOT NULL,
  shift VARCHAR2(10) NOT NULL,
  lang VARCHAR2(20) NOT NULL,
  PRIMARY KEY (em_id),
  FOREIGN KEY (em_id) REFERENCES Employee(em_id)
);

-- Table to store room details
CREATE TABLE Room
(
  room_number INT NOT NULL,
  beds INT NOT NULL,
  balcony VARCHAR2(4) NOT NULL,
  price INT NOT NULL,
  PRIMARY KEY (room_number)
);

-- Table to store guest details
CREATE TABLE Guest
(
  guest_id INT NOT NULL,
  first_name VARCHAR2(20) NOT NULL,
  last_name VARCHAR2(20) NOT NULL,
  phone VARCHAR2(11) NOT NULL,
  date_of_birth DATE NOT NULL,
  PRIMARY KEY (guest_id)
);

-- Table to store booking details
CREATE TABLE Booking
(
  guest_id INT NOT NULL,
  room_number INT NOT NULL,
  entry_date DATE NOT NULL,
  days INT NOT NULL,
  em_id INT NOT NULL,
  PRIMARY KEY (entry_date, guest_id, room_number),
  FOREIGN KEY (guest_id) REFERENCES Guest(guest_id),
  FOREIGN KEY (room_number) REFERENCES Room(room_number),
  FOREIGN KEY (em_id) REFERENCES Receptionist(em_id)
);

-- Table to store requests made by guests
CREATE TABLE Request
(
  guest_id INT NOT NULL,
  room_number INT NOT NULL,
  PRIMARY KEY (guest_id, room_number),
  FOREIGN KEY (guest_id) REFERENCES Guest(guest_id),
  FOREIGN KEY (room_number) REFERENCES Room(room_number)
);

-- Table to store information about interactions between reservation agents and guests
CREATE TABLE Inform
(
  em_id INT NOT NULL,
  guest_id INT NOT NULL,
  PRIMARY KEY (em_id, guest_id),
  FOREIGN KEY (em_id) REFERENCES ReservationAgent(em_id),
  FOREIGN KEY (guest_id) REFERENCES Guest(guest_id)
);
