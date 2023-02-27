CREATE TABLE continent (
	id SERIAL PRIMARY KEY,
	name VARCHAR(20)
);

CREATE TABLE country (
	id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	continent_id INTEGER REFERENCES continent(id),
	population INTEGER,
	founded_in INTEGER,
	GDP MONEY
);

CREATE TABLE army (
	country_id SERIAL PRIMARY KEY REFERENCES country(id),
	nuclear_warhead_count INTEGER,
	force_numbers INTEGER,
	budget MONEY
);

CREATE TABLE capital (
	country_id INTEGER PRIMARY KEY REFERENCES country(id),
	name VARCHAR(30),
	president VARCHAR(50),
	economic_system VARCHAR(40)
);


CREATE TABLE language (
	id SERIAL PRIMARY KEY,
	name VARCHAR(20),
	derives_from VARCHAR(20)
);

CREATE TABLE countries_languages (
	country_id SERIAL REFERENCES country(id),
	language_id INTEGER REFERENCES language(id),
	PRIMARY KEY (country_id, language_id)
); 

--modifications

ALTER TABLE country 
ADD CONSTRAINT country_capital_id FOREIGN KEY (capital_id) REFERENCES capital(id);

ALTER TABLE continent
ALTER COLUMN name TYPE VARCHAR(20);

--delete capital id