import java.sql.*;
public class JDBCExample{
	public static void main(String[] args){
		//loading Driver manager service
		
		try{
		Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
		}
		catch(ClassNotFoundException e){
			System.out.println("Problem with loading the DriverManager Class");
		}
		try{
			//establish connection
		Connection con=DriverManager.getConnection("jdbc:odbc:DriverOneDataSource","system","umkc123");
		System.out.println("After Connection");
		//creating statement
		Statement st=con.createStatement();
		//executing query
		ResultSet rs=st.executeQuery("select * from empl");
		
		while(rs.next()){
			System.out.println("Hello");
		}
		
		}
		catch(SQLException e){
			System.out.println("SQL Exception"	);
		}
		
	}
}