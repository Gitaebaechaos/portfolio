package students.items;

//Create Item class which is the base class of all farm items.
public class Item {
	protected int age;
	protected int maturationAge;
	protected int deathAge;
	protected int monetaryValue;

	//All items start at age 0 
	public Item() {
		age = 0;
		maturationAge = 0;
		deathAge = 0;
		monetaryValue = 0;
	}

	//With the maturation age, death age, and monetary value 
	//set as part of its constructor. 
	public Item (Item item) {
		this.age = item.age ;
		this.maturationAge = item.maturationAge;
		this.deathAge = item.deathAge;
		this.monetaryValue = item.monetaryValue;
		this.description = item.description;
	}

	//Increases the age variable by 1
	public int tick() {
		return age += 1;
	}

	//Sets the age of an item
	public int setAge(int age) {
		return this.age = age;
	}

	//Returns whether the item’s age is greater than it’s death age
	public boolean died() {
		if (this.deathAge == -1) {
			return false;
		}
		return (age > deathAge);
	}

	//Returns their value ONLY if the item’s age is passed 
	//it’s maturation age
	public int getValue() {
		if (this.age > this.maturationAge && this.age <= this.deathAge) {
			return this.monetaryValue;
		}
		else if (this.deathAge == -1) {
			return this.monetaryValue;
		}
		return 0;
	}

	//Returning true if both objects have the same age, 
	//death age, maturation, and monetary value.
	public boolean equals(Item item)
	{
		Item i = item;

		return (
						this.age == i.age &&
						this.maturationAge == i.maturationAge &&
						this.deathAge == i.deathAge &&
						this.monetaryValue == i.monetaryValue &&
						this.description == i.description
						);
	}
	
	protected String description = "";
	//An abstract function implemented by subclasses returning
	//the string representation of each item.
	@Override
	public String toString() 
	{
		String sol = "";

		//Apple is represented by the string “a” if its age is below 
		//maturation, or “A” if above. Its maturation time is 3, 
		//death age is 5, and monetary value is 3. 
		if(this.description == "a" ) 
		{
			if(this.age >= this.maturationAge && this.age <= this.deathAge)
			{ sol += "A";}
			else 
			{
				sol += "a";
			}
		}
		//Grain is represented by the string “g” if its age is below 
		//maturation, or “G” if above. Its maturation time is 2, 
		//death age is 6, and monetary value is 2. 
		else if(this.description == "g" ) 
		{
			if(this.age >= this.maturationAge && this.age <= this.deathAge)
			{ sol += "G";}
			else 
			{
				sol += "g";
			}
		}
		else 
		{
			sol += this.description;
		}
		return sol;
	}

	protected int price = 0;
	
	//Returning the price of plant
	public int getPrice() {
		return this.price;
	}
	//Returning the maturation age of an item
	public int getMaturationAge() {
		return this.getMaturationAge();
	}
	//Returning the age of an item
	public int getAge() {
		return this.age;
	}
	//Returning the death age of an item
	public int getdeathAge() {
		return this.deathAge;
	}
}