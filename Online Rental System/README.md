# Online-Rental-System
note: Install Mysql 5.5 with username as root and password as root.
##To Import Database
To Login to Mysql Open Command Prompt

		mysql -u root -p 
		
It Ask's For Password Enter the password.
	
To import a database, first create a new blank database in the MySQL shell to serve as a destination for your data.
		
		CREATE DATABASE house;

Then log out of the MySQL shell and type the following on the command line:
		
		mysql -u root -p house < house.sql