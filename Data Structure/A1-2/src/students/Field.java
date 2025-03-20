package students;

import students.items.Item;
import students.items.Soil;
import students.items.UntilledSoil;
import students.items.Weed;

//Once we’ve got the items ready to use, 
//we need to put them into a field
public class Field {

	private final Item[][] items;
	private int height = 0;
	private int width = 0;

	//Set as part of its constructor
	public Field (int height, int width)
	{	
		this.height = height;
		this.width = width;

		items = new Item[height][width];

		for (int y = 0; y < height; y++) {
			for (int x = 0; x < width; x++) {
				items[y][x] = new Soil();			
			}
		}
	}

	//Each time this is called, every Item in the field must have 
	//it’s tick() function called to increase the age of each item
	public void tick() {
		for (int y = 0; y< height; y++) {
			for (int x = 0; x<width; x++) {
				this.items[y][x].tick();
				
				if( this.items[y][x] instanceof Soil) {
					if (Math.random() <= 0.20) {
						this.items[y][x] = new Weed();
					}	
				}				
				if (this.items[y][x].died()) {
					this.items[y][x] = new UntilledSoil();
				}
				
			}
		}
	}

	//Overridden function prints out a numbered grid 
	//with the contents of each location
	@Override
	public String toString() {

		String str = "";
		String row = " ";
		System.out.print(row);
		for (int i=0; i<this.width; i++) {
			System.out.print(i+1);
		}
		System.out.println("");

		for(int y = 0; y<this.height; y++) {
			str += (y+1);
			for(int x=0; x < this.width; x++) {
				str += this.items[y][x].toString();
			}
			str +="\n";
		}
		return str;
	}

	//Takes in the location in the field to till and 
	//turn into new Soil, regardless of what’s there currently
	public void till(int a, int b) {
		this.items[b][a] = new Soil();
	}

	//Returns a copy the item at that location
	public Item get(int i, int j) {
		Item a = this.items[i][j];
		Item b = new Item(a);
		return b;
	}
	//Stores a given Item at a given location
	public void plant(int i, int j, Item item) {
		Item plant = new Item(item);
		this.items[i][j] = plant;
	}
	//Returns the total monetary value of each item in the field
	public int getValue() {
		int totalOfMontaryValue = 0;
		for(int y = 0; y<this.height; y++) {
			for(int x=0; x < this.width; x++) {
				totalOfMontaryValue += this.items[y][x].getValue();
			}
		}
		return totalOfMontaryValue;
	}

	//Returns a string representing the quantities 
	//and overall value of the field, as shown below
	public  void getSummary() {
		int numOfApples = 0, numOfGrain = 0, numOfSoil = 0, numOfUntilledSoil = 0, numOfWeed = 0, totalOfApples = 0, totalOfGrain = 0; 

		// arrange the output each of Items in the field
		for (Item[] row :this.items) {
			for(Item element : row) {

				if (element.toString()== ".") {
					numOfSoil+=1;
				}
				else if (element.toString()== "a" | element.toString()== "A") {
					numOfApples += 1;	
					totalOfApples += 1;
				}
				else if (element.toString()== "g" | element.toString()== "G") {
					numOfGrain += 1;	
					totalOfGrain += 1;
				}
				else if (element.toString()== "/") {
					numOfUntilledSoil += 1;

				}
				else if (element.toString()== "#") {
					numOfWeed += 1;
				}
			}
		}
		System.out.println(" Apples:        " + numOfApples + "\n Grain:         " + numOfGrain + "\n Soil:          " + numOfSoil + "\n Untilled:      " + numOfUntilledSoil + "\n Weed:          " + numOfWeed + "\n For a total of $" + this.getValue() + "\n Total apples created: " + totalOfApples + "\n Total grain created: " + totalOfGrain);
	}
}