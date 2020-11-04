# Semester work by Bulat Din (1st)
## Group 11-902
#### Teacher [Alexander Ferenets](https://github.com/istamendil)

This project is a site for the selection of films. [Kinopoiskapiunofficial.tech](https://kinopoiskapiunofficial.tech/) was used as a resource for finding films. As a DBMS - PostgreSQL 13.

Before starting, import the tables: postgres_public_userFilms and postgres_public_users located in the root of the project into your PostgreSQL.

**Important!**
* 
  * Database name as well as password can be changed in *CustomServletContextListener*
  ```java
     private static final String DB_URL = "jdbc:postgresql://localhost:5432/postgres";
     private static final String DB_USERNAME = "postgres";
     private static final String DB_PASSWORD = "Korjicks2281337";
     private static final String DB_DRIVER = "org.postgresql.Driver";
  ```
  * ol The application uses the global variable *BASE_CONTEXT* to navigate to the base URL. You can also set it in *CustomServletContextListener*
  ```java
     private static final String BASE_CONTEXT = "http://localhost:8080/inf-1-sem";
  ```
