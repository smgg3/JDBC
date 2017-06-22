import java.util.Properties;
import java.sql.*;
import java.io.IOException;
public class DBConnectionTest{
	private static String query="select * from emp";
	public static void main(String[] args){
		
		try(Connection con=DBConnection.getConnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(query);){
				
				while(rs.next()){
					
					System.out.println(rs.getInt(1)+"  "+rs.getString(2));
				}
				rs.close();
			st.close();
			con.close();
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		
	}
	
}