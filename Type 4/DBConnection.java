import java.sql.*;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;
public class DBConnection{
	
	public static Connection getConnection(){
		Properties p=new Properties();
		Connection con=null;
		
		try(FileInputStream fis=new FileInputStream("UserDefinedDBDetails.properties"))
		{
			
			p.load(fis);
			
			Class.forName(p.getProperty("DRIVERCLASS"));
			
			con=DriverManager.getConnection(p.getProperty("URL"),p.getProperty("USERNAME"),p.getProperty("PASSWORD"));
		}
		catch(ClassNotFoundException|SQLException|IOException e){
		
			e.printStackTrace();
		}
		
		return con;
	}
}