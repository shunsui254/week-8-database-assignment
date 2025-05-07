-- Inventory Tracking System for Clinical Setup
-- This database schema manages inventory in a clinical environment, 
-- tracking clinics, items, suppliers, staff, batches, and stock transactions.


-- Create Clinics table
CREATE TABLE Clinics (
    ClinicID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Location VARCHAR(255),
    ContactInfo VARCHAR(100)
) ENGINE=InnoDB;

-- Create Items table
CREATE TABLE Items (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Description TEXT,
    Category VARCHAR(50)
) ENGINE=InnoDB;

-- Create Suppliers table
CREATE TABLE Suppliers (
    SupplierID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(100)
) ENGINE=InnoDB;

-- Create Staff table
CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Role VARCHAR(50),
    ClinicID INT,
    FOREIGN KEY (ClinicID) REFERENCES Clinics(ClinicID)
) ENGINE=InnoDB;

-- Create Batches table
CREATE TABLE Batches (
    BatchID INT AUTO_INCREMENT PRIMARY KEY,
    ItemID INT,
    ClinicID INT,
    SupplierID INT,
    ExpirationDate DATE,
    ReceivedDate DATE NOT NULL,
    CurrentQuantity INT NOT NULL DEFAULT 0,
    CONSTRAINT FK_Batches_ItemID FOREIGN KEY (ItemID) REFERENCES Items(ItemID),
    CONSTRAINT FK_Batches_ClinicID FOREIGN KEY (ClinicID) REFERENCES Clinics(ClinicID),
    CONSTRAINT FK_Batches_SupplierID FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID),
    CONSTRAINT CHK_CurrentQuantity CHECK (CurrentQuantity >= 0)
) ENGINE=InnoDB;

-- Create StockTransactions table
CREATE TABLE StockTransactions (
    TransactionID INT AUTO_INCREMENT PRIMARY KEY,
    BatchID INT,
    StaffID INT,
    TransactionType ENUM('Receipt', 'Issue', 'Adjustment') NOT NULL,
    Quantity INT NOT NULL,  -- Positive for increase, negative for decrease
    TransactionDate DATETIME NOT NULL,
    FOREIGN KEY (BatchID) REFERENCES Batches(BatchID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID)
) ENGINE=InnoDB;
