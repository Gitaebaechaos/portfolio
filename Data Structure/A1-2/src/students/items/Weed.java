package students.items;

//Weeds are items
public class Weed extends Item{	

	//Set as part of its constructor 
	public Weed() {
		super();
		this.deathAge = -1;
		this.monetaryValue = -1;
		this.description = "#";
	}
}