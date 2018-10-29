package resolution;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Connection;

public class GestionRqt extends Connect {
	
	private Connection connexion; 
	
	public GestionRqt() throws SQLException {
		try {
			this.connexion = Connect.getConnexion(); 
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	/** 
	 * Est un exemple de méthode à faire 
	 * Celle-ci permets d'afficher l'id et l'adresse mail de la table user 
	 * 
	 *  String Query : correspond à la requête SQL 
	 * 
	 */
	public void getInfo() {
		
		Statement statement = null;
		ResultSet resultat = null;
		String query = "SELECT * FROM user";
		try {
			
			statement = connexion.createStatement();
			
			resultat = statement.executeQuery(query);
			
			while (resultat.next()) {
				rsetToUser(resultat);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			closeRqt(resultat, statement);
		}

	}
	
	/**
	 * Méthode permettant d'afficher les élements de la requête 
	 * @param rset
	 * @throws SQLException
	 */
	private void rsetToUser(final ResultSet rset) throws SQLException {
		final Integer id = rset.getInt("idUser");
		final String email = rset.getString("email");
		System.out.println("id : "+ id + " email : " + email);
	}
	
	
	
	private void closeRqt(ResultSet resultat, Statement statement) {
		if(resultat != null ) {
			try {
				resultat.close();
			} catch ( SQLException e) {
				e.printStackTrace();
			}
		}
		if (statement != null) {
			try {
				statement.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public void closeGestionRqt() {
		if (this.connexion != null) {
			try {
				connexion.close();
				System.out.println("Connexion fermée");
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
