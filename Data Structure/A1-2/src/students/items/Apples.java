package students.items;

//Apple is a type of Food
public class Apples extends Food{
	private static int totalNumOfApples = 0;

	//Set as part of its constructor
	public Apples() 

	{
		super();
		this.maturationAge = 3;
		this.deathAge = 5;
		this.monetaryValue = 3;
		this.price = 2;
		this.description = "a";
		totalNumOfApples++;
	}

	//GetGenerationCount returns the total number of apples 
	//objects that have been instantiated
	public static int getGenerationCount() {
		return totalNumOfApples;
	}
	
	//Void toString() because Apples is an food extends item, so Apples inherit automatically
	@Override
	public String toString() 
	{
		if (this.getAge() >= getMaturationAge())
			return "A";
		else
			return "a";
	}
}