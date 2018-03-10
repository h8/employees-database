# Employees database
A sample database for PostgreSQL to be used mainly in various test applications.

## Installation
Repository contains two dump files:
* employees_data.sql.bz2 – schema with data (~140Mb uncompressed)
* employees_schema.sql – schema only

Dumps doesn't contain information about schema or user name, so create any
database with any owner (user) you want, and insert dump into it:

    bzip2 -d employees_data.sql.bz2

    psql -U employees_user employees_database < employees_data.sql

## The source of the data

The original data was created by Fusheng Wang and Carlo Zaniolo at
Siemens Corporate Research. The data is in XML format.
http://timecenter.cs.aau.dk/software.htm

Giuseppe Maxia made the relational schema and Patrick Crews exported
the data in relational format for MySQL.
https://github.com/datacharmer/test_db

Data was converted to PostgreSQL format. Tables and some columns where renamed.

The database contains about 300,000 employee records with 2.8 million
salary entries.

The data was generated, and there are inconsistencies.

## Disclaimer

As far as I know (and what is stated on the original [test_db page](https://github.com/datacharmer/test_db)),
this data is fabricated, and it does not correspond to real people.
Any similarity to existing people is purely coincidental.


## License
This work is licensed under the
Creative Commons Attribution-Share Alike 3.0 Unported License.
To view a copy of this license, visit
http://creativecommons.org/licenses/by-sa/3.0/ or send a letter to
Creative Commons, 171 Second Street, Suite 300, San Francisco,
California, 94105, USA.
