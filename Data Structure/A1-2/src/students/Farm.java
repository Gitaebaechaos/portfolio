package students;

import java.util.Scanner;
import students.items.Apples;
import students.items.Food;
import students.items.Grain;
import students.items.inputException;

//The Farm class wraps everything together for us
public class Farm {
	private int funds;
	private Field myField;

	//To make a Farm, you need pass in the field width, 
	//field height and the starting funds to give the player
	public Farm(int Height, int Width, int funds)
	{
		this.myField = new Field(Width, Height);		
		this.funds = funds;		
	}
	
	//We have a run() function that will continue to show the 
	//farm’s current state, and prompt the user for what they’d like to do
	public void run() throws Exception
	{	
		boolean stop = false;
		while (!stop){
			Scanner obj = new Scanner(System.in);
			String output;
			
			System.out.println(myField);
			System.out.println("Bank balance: $" + funds + "\n");
			System.out.print("Enter your next action: " + "\n");
			System.out.println(" t x y: till\n" + " h x y: harvest\n" + " p x y: totoplant\n" + " s: field summary\n" + " w: wait\n" + " q: quit\n");	
			
			output = obj.nextLine();
	
			output = output.replaceAll(" ", "");
	
			if(output.length() >= 1 && output.length()< 5) {
				String input = output.substring(0,1);
				
				if (input.equals("t")) {
					int x = Integer.parseInt(output.substring(1,2));
					int y = Integer.parseInt(output.substring(2,3));
					myField.till(x,y);
					
				}
				else if(input.equals("h")) {
					int x = Integer.parseInt(output.substring(1,2));
					int y = Integer.parseInt(output.substring(2,3));
					if (myField.get( y-1,x-1) instanceof Food) {
						if(
						   myField.get( y-1,x-1).getAge() > myField.get( y-1,x-1).getMaturationAge()		
						&& myField.get( y-1,x-1).getAge() <=  myField.get( y-1,x-1).getdeathAge()
						  )
							funds += (int) myField.get(y-1, x-1).getValue();
						}
						System.out.println("Sold '" + myField.get(y-1, x-1).toString() + "' for " + myField.get(y-1, x-1).getValue() + "\n");
					}
				else if(input.equals("p")) {
					int x = Integer.parseInt(output.substring(1,2));
					int y = Integer.parseInt(output.substring(2,3));
					myField.till(x,y);
					System.out.println("Enter: " +  "\n - 'a' to buy an apple for $" + "\n- 'g' to buy grain for"); 
					
					Scanner scanner = new Scanner(System.in);
					String totoplant;
					totoplant =  obj.nextLine();
					if (totoplant == "a") {
						myField.plant(y-1, x-1, new Apples());
					}
					else if (totoplant == "g") {
						myField.plant(y-1, x-1, new Grain());
					}
			
				}
				else if(input == "w") {
					myField.tick();
				}
				else if(input == "q") {
					System.out.println("\n Bye bye");
					stop = true;
				}
				else if(input == "s") {
					System.out.println("\n");
					myField.getSummary();
				}
			}
			else {
				new inputException(output).printStackTrace();
			}
		}
	}
	
	//Check the result
	public static void main(String[] args) {
		Farm f = new Farm(10, 5, 10);
		try {
			f.run();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}