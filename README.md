# Inventory Tracking System for Clinical Setup

## Description
This database manages inventory in a clinical environment. It tracks:
- **Clinics**: Locations where inventory is stored.
- **Items**: Medical supplies, equipment, or medications.
- **Suppliers**: Providers of inventory items.
- **Staff**: Personnel managing inventory, associated with clinics.
- **Batches**: Specific shipments of items with expiration dates and current quantities.
- **Stock Transactions**: Records of receipts, issues, and adjustments to stock levels.

The system ensures accurate tracking of stock quantities, batch expirations, and transaction history, making it suitable for clinical inventory management.

## How to Run/Setup
1. Ensure you have a MySQL environment installed (e.g., MySQL Server, MySQL Workbench).
2. Open your MySQL client or tool.
3. Execute the `inventory_tracking.sql` file to create the database schema:
   - In MySQL Workbench: File > Run SQL Script > Select `inventory_tracking.sql`.
   - In MySQL CLI: `mysql -u <username> -p <database_name> < inventory_tracking.sql`.
4. The script will create all tables with their constraints and relationships.

## Entity-Relationship Diagram (ERD)
The database consists of the following entities and relationships:

### Tables and Relationships
- **Clinics**
  - Primary Key: `ClinicID`
  - Relationships: 
    - 1-to-Many with `Staff`
    - 1-to-Many with `Batches`
- **Items**
  - Primary Key: `ItemID`
  - Relationships: 1-to-Many with `Batches`
- **Suppliers**
  - Primary Key: `SupplierID`
  - Relationships: 1-to-Many with `Batches`
- **Staff**
  - Primary Key: `StaffID`
  - Foreign Key: `ClinicID` (references `Clinics`)
  - Relationships: 1-to-Many with `StockTransactions`
- **Batches**
  - Primary Key: `BatchID`
  - Foreign Keys: `ItemID` (references `Items`), `ClinicID` (references `Clinics`), `SupplierID` (references `Suppliers`)
  - Relationships: 1-to-Many with `StockTransactions`
- **StockTransactions**
  - Primary Key: `TransactionID`
  - Foreign Keys: `BatchID` (references `Batches`), `StaffID` (references `Staff`)

### ERD Description
- **Clinics** are linked to multiple **Staff** and **Batches**.
- **Items** and **Suppliers** connect to multiple **Batches**.
- Each **Batch** tracks stock for a specific item at a clinic and is associated with multiple **StockTransactions**.
- **Staff** perform multiple **StockTransactions**.

For a visual ERD, you can generate one using a tool like MySQL Workbench after running the SQL script and include a screenshot here (not included in this text-based format).
