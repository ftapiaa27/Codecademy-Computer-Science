-- Populate continents

INSERT INTO continent (name)
    VALUES('North America');
INSERT INTO continent (name)
    VALUES('South America');
INSERT INTO continent (name)
    VALUES('Europe');
INSERT INTO continent (name)
    VALUES('Asia');
INSERT INTO continent (name)
    VALUES('Australia');
INSERT INTO continent (name)
    VALUES('Antarctica');
INSERT INTO continent (name)
    VALUES('Africa');

-- populate 7 countries
INSERT INTO country (name, continent_id, population, founded_in, GDP)
    VALUES (
        'United States of America',
        1,
        331900000,
        1776,
        23300000000000
    );
INSERT INTO capital 
    VALUES (
        1,
        'Washington D.C.',
        'Joe Biden',
        'Capitalist'
    );
INSERT INTO army
    VALUES (
        1,
        5428,
        1328000,
        800670000000
    );

INSERT INTO country (name, continent_id, population, founded_in, GDP)
    VALUES (
        'Brazil',
        2,
        214300000,
        1822,
        1609000000000
    );
INSERT INTO capital 
    VALUES (
        2,
        'Brasília',
        'Luiz Inácio Lula da Silva',
        'Capitalist'
    );
INSERT INTO army
    VALUES (
        2,
        0,
        334500,
       25910000000
    );

INSERT INTO country (name, continent_id, population, founded_in, GDP)
    VALUES (
        'Portugal',
        3,
        10330000,
        1143,
        253700000000
    );
INSERT INTO capital 
    VALUES (
        3,
        'Lisbon',
        'Marcelo Rebelo de Sousa',
        'Service-based mixed economy'
    );
INSERT INTO army
    VALUES (
        3,
        0,
        27741,
        4910000000
    );

INSERT INTO country (name, continent_id, population, founded_in, GDP)
    VALUES (
        'China',
        4,
        1412000000,
        1949,
        17730000000000
    );
INSERT INTO capital 
    VALUES (
        4,
        'Beijing',
        'Xi Jinping',
        'Socialist market economy'
    );
INSERT INTO army
    VALUES (
        4,
        350,
        2800000,
        293350000000
    );

-- Add more countries