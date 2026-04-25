-- Users
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

-- Shows
CREATE TABLE Shows (
    show_id INT PRIMARY KEY,
    show_name VARCHAR(100),
    show_time TIMESTAMP
);

-- Seats
CREATE TABLE Seats (
    seat_id INT PRIMARY KEY,
    show_id INT,
    status VARCHAR(20) CHECK (status IN ('AVAILABLE','BOOKED')),
    version INT DEFAULT 0,
    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);

-- Bookings
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    user_id INT,
    seat_id INT,
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (seat_id) REFERENCES Seats(seat_id)
);
