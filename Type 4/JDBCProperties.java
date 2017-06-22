import java.sql.*;
import java.io.FileInputStream;
import java.util.Properties;
public class JDBCProperties{
	
	public static void main(String[] args) throws ClassNotFoundException,SQLException,IOException{
		
		FileInputStream fis=null;
			
			Properties p=new Properties();
			
			p.load(fis);
		try{
			fis=new FileInputStream("UserDefinedDBDetails.properties");
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@192.168.226.1:1521:XE",p.getProperty("my.user"),p.getProperty("my.password"));
			
			Statement st=con.createStatement();
			
			ResultSet rs=st.executeQuery("select * from emp");
			
			while(rs.next()){
				
				System.out.println(rs.getInt(1)+"  "+rs.getString(2));
			}
			
			rs.close();
			st.close();
			con.close();
		}
		catch(Exception e){
			
			e.printStackTrace();
		}
	}
}