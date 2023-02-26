CREATE TABLE "public.Continents" (
	"id" serial NOT NULL,
	"name" serial(10) NOT NULL,
	CONSTRAINT "Continents_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Country" (
	"id" serial NOT NULL,
	"name" varchar(50) NOT NULL,
	"continent_id" integer NOT NULL,
	"population" integer NOT NULL,
	"capital_id" integer NOT NULL,
	"founded_in" integer NOT NULL,
	"GDP" integer NOT NULL,
	CONSTRAINT "Country_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Language" (
	"id" serial NOT NULL,
	"name" varchar(20) NOT NULL,
	"derives_from" varchar(20) NOT NULL,
	CONSTRAINT "Language_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Capital" (
	"id" serial NOT NULL,
	"name" varchar(20) NOT NULL,
	"president" varchar(40) NOT NULL,
	"economic_system" varchar(15) NOT NULL,
	CONSTRAINT "Capital_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Countries_Languages" (
	"country_id" integer NOT NULL,
	"language_id" integer NOT NULL,
	CONSTRAINT "Countries_Languages_pk" PRIMARY KEY ("country_id","language_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Army" (
	"country_id" BINARY NOT NULL,
	"nuclear_warhead_count" integer NOT NULL,
	"force_numbers" integer NOT NULL,
	"budget" integer NOT NULL,
	CONSTRAINT "Army_pk" PRIMARY KEY ("country_id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Country" ADD CONSTRAINT "Country_fk0" FOREIGN KEY ("continent_id") REFERENCES "Continents"("id");
ALTER TABLE "Country" ADD CONSTRAINT "Country_fk1" FOREIGN KEY ("capital_id") REFERENCES "Capital"("id");



ALTER TABLE "Countries_Languages" ADD CONSTRAINT "Countries_Languages_fk0" FOREIGN KEY ("country_id") REFERENCES "Country"("id");
ALTER TABLE "Countries_Languages" ADD CONSTRAINT "Countries_Languages_fk1" FOREIGN KEY ("language_id") REFERENCES "Language"("id");

ALTER TABLE "Army" ADD CONSTRAINT "Army_fk0" FOREIGN KEY ("country_id") REFERENCES "Country"("id");







