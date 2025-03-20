package students.items;

//Create Exception class
public class inputException extends Exception
{
	public inputException(String input) 
	{
		super(input +" "+" is Invalid");
	}
}