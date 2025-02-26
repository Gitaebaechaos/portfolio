package nuber.students;
import java.io.IOException;
import java.util.Random;


public class Driver extends Person {
	
	private Passenger currentPassenger;
	int maxDelay;

	
	public Driver(String driverName, int maxSleep)
	{
		super(driverName, maxSleep);
		this.maxDelay = maxSleep;
		//System.out.println("1");
	}
	
	/**
	 * Stores the provided passenger as the driver's current passenger and then
	 * sleeps the thread for between 0-maxDelay milliseconds.
	 * 
	 * @param newPassenger Passenger to collect
	 * @throws InterruptedException
	 */
	public void pickUpPassenger(Passenger newPassenger) throws InterruptedException //throws
	{
		//Store the driver's current passenger
		this.currentPassenger = newPassenger;
		System.out.println(name + newPassenger.name);
		
		maxDelay = randomFrom0toMax(0, this.maxSleep);
		// thread random milliseconds
		try {
			Thread.sleep(maxDelay);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        //Thread.sleep((long) (Math.random() * maxSleep));
	}
	
	private int randomFrom0toMax(int min, int max) {
		//To sleeps the thread for between 0 to Max
        int range = (max - min) + 1;
        return (int) (Math.random() * range) + min;
    }

	/**
	 * Sleeps the thread for the amount of time returned by the current 
	 * passenger's getTravelTime() function
	 * 
	 * @throws InterruptedException
	 */
	public void driveToDestination() throws InterruptedException //throws
	{
		//Using getTrabelTime()
		System.out.println(name);
        Thread.sleep(currentPassenger.getTravelTime());
    }
	
}
