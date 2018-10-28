package resolution;
import java.sql.Connection;
import java.sql.DriverManager;

import java.sql.SQLException;



/**
 * Class permettant la connexion à une base de donnée. 
 * @author vincenthardouin
 *
 */
public class Connect {

	private static Connection connexion = null; 
	private static int nbrConnexion = 0;
	
	/**
	 * Permets la connexion à la BD, et trace les exceptions si nécessaire
	 */
	public Connect() {
	    /* Chargement du driver JDBC pour MySQL */
	    try {
	        Class.forName( "com.mysql.jdbc.Driver" );
	    } catch ( ClassNotFoundException e ) {
	    	System.out.println( "Erreur lors du chargement : le driver n'a pas été trouvé dans le classpath ! <br/>"
	                + e.getMessage() );
	    }
		try {
		
			String url = "jdbc:mysql://localhost:8889/treasurehunter?useSSL=false";
			String user = "root";
			String passwd = "root";

			connexion = DriverManager.getConnection(url, user, passwd);
			nbrConnexion++;
			System.out.println("Connexion effective ! Connexion numéro " + nbrConnexion);         

		} catch (SQLException e) {
			e.printStackTrace();
		}    
	}
	
	public static Connection getConnexion() throws SQLException {
		return connexion; 
	}
	
	  
}
