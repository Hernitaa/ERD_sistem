	CREATE TABLE requesters (
	    id SERIAL PRIMARY KEY,
	    name VARCHAR(255) NOT NULL,
	    department VARCHAR(255),
	    contact_info TEXT
	);
	
	CREATE TABLE vendors (
	    id SERIAL PRIMARY KEY,
	    vendor_name VARCHAR(255) NOT NULL,
	    contact_info TEXT
	);
	
	CREATE TABLE warehouse_inventory (
	    id SERIAL PRIMARY KEY,
	    item_name VARCHAR(255) NOT NULL,
	    quantity INTEGER NOT NULL,
	    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	);
	
	CREATE TABLE purchasing_requests (
	    id SERIAL PRIMARY KEY,
	    request_date DATE NOT NULL,
	    requester_id INTEGER REFERENCES requesters(id),
	    request_description TEXT,
	    status VARCHAR(50),
	    approval_date DATE,
	    vendor_id INTEGER REFERENCES vendors(id),
	    purchase_date DATE,
	    total_cost DECIMAL(10, 2)
	);
	
	CREATE TABLE approvals (
	    id SERIAL PRIMARY KEY,
	    request_id INTEGER REFERENCES purchasing_requests(id),
	    approval_date DATE,
	    approver VARCHAR(255)
	);
	
	CREATE TABLE procurement (
	    id SERIAL PRIMARY KEY,
	    request_id INTEGER REFERENCES purchasing_requests(id),
	    warehouse_item_id INTEGER REFERENCES warehouse_inventory(id), -- relasi ke warehouse_inventory
	    vendor_id INTEGER REFERENCES vendors(id),
	    purchase_date DATE,
	    quantity INTEGER
	);
	
		
	
	
	
	
	
