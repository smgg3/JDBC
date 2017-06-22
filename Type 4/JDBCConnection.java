import java.sql.*;
class JDBCConnection{
	
	public static void main(String[] args) throws ClassNotFoundException,SQLException{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","umkc123");
		
		Statement st=con.createStatement();
		
		ResultSet rs=st.executeQuery("select * from employee");
		
		while(rs.next()){
			
			System.out.println(rs.getInt(1)+rs.getString(2));
			
		}
		
		rs.close();
		st.close();
		con.close();
	}
	
}