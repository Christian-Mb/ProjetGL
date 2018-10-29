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

			if (connexion != null) {
				try {
					connexion.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

	}
	
	private void rsetToUser(final ResultSet rset) throws SQLException {
		final Integer id = rset.getInt("idUser");
		final String email = rset.getString("email");
		System.out.println("id : "+ id + " email : " + email);
	}

}
