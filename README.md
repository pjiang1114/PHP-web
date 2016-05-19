# PHP-web

This is an implementation from the course project, using HTML+Javascript+PHP+MySql. 
index.html is the default entrance of this website. It handles input interface and initial check of input.
search.php is the default backend logic service to provide the search result from cs3010.sql with the input of index.html 
This version does not provide privileges of creating of updating the database.

Instruction:

1. index.html:

   User could test this website using XAMPP. Input with checkboxes and conditions from textboxes. "All" has the highest priority which will ignore all other checkboxes.

2. search.php:

  The search will be performed using SQL with the database named "cs3010" in MySql. This database contains 3 tables: cpu, customer, orders. There is no ER diagram in among this tables, so all the logic are given in the search.php. The output are the query and the matching term result.

