package students.items;

//Grain is a type of Food. 
public class Grain extends Food{
	private static int totalNumOfGrain = 0;

	//Set as part of its constructor 
	public Grain()
	{
		super();
		this.maturationAge = 2;
		this.deathAge = 6;
		this.monetaryValue = 2;
		this.price = 1;
		this.description = "g";

		totalNumOfGrain++;
	}
	
	//GetGenerationCount returns the total number of grain 
		//objects that have been instantiated
		public static int getGenerationCount() {
			return totalNumOfGrain;
		}
		
		//Void toString() because Grain is an food extends item, so Grain inherit automatically
		@Override
		public String toString() 
		{
			if (this.getAge() >= getMaturationAge())
				return "G";
			else
				return "g";
		}
		
		
}