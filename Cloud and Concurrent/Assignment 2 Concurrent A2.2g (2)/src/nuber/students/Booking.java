package nuber.students;

import java.util.concurrent.Callable;


/**
 * 
 * Booking represents the overall "job" for a passenger getting to their destination.
 * 
 * It begins with a passenger, and when the booking is commenced by the region 
 * responsible for it, an available driver is allocated from dispatch. If no driver is 
 * available, the booking must wait until one is. When the passenger arrives at the destination,
 * a BookingResult object is provided with the overall information for the booking.
 * 
 * The Booking must track how long it takes, from the instant it is created, to when the 
 * passenger arrives at their destination. This should be done using Date class' getTime().
 * 
 * Booking's should have a globally unique, sequential ID, allocated on their creation. 
 * This should be multi-thread friendly, allowing bookings to be created from different threads.
 * 
 * @author james
 *
 */
public class Booking implements Callable<BookingResult>
{
	//Keeps track of the next available booking ID
	private static int nextBookingID = 1;
    
	// Unique booking identifier
    private final int bookingID;
    //Reference
    private final NuberDispatch dispatch;
    //Reference
    private final Passenger passenger;
    //Reference
    private Driver driver;
    //Timestamp for time
    private long time;


		
	/**
	 * Creates a new booking for a given Nuber dispatch and passenger, noting that no
	 * driver is provided as it will depend on whether one is available when the region 
	 * can begin processing this booking.
	 * 
	 * @param dispatch
	 * @param passenger
	 */
	public Booking(NuberDispatch dispatch, Passenger passenger)
	{
		//Assign
		this.bookingID = nextBookingID++;
        //Set
		this.dispatch = dispatch;
        //Set
		this.passenger = passenger;
        //Record
		this.time = System.currentTimeMillis();
	}
	
	/**
	 * At some point, the Nuber Region responsible for the booking can start it (has free spot),
	 * and calls the Booking.call() function, which:
	 * 1.	Asks Dispatch for an available driver
	 * 2.	If no driver is currently available, the booking must wait until one is available. 
	 * 3.	Once it has a driver, it must call the Driver.pickUpPassenger() function, with the 
	 * 			thread pausing whilst as function is called.
	 * 4.	It must then call the Driver.driveToDestination() function, with the thread pausing 
	 * 			whilst as function is called.
	 * 5.	Once at the destination, the time is recorded, so we know the total trip duration. 
	 * 6.	The driver, now free, is added back into Dispatch�s list of available drivers. 
	 * 7.	The call() function the returns a BookingResult object, passing in the appropriate 
	 * 			information required in the BookingResult constructor.
	 *
	 * @return A BookingResult containing the final information about the booking 
	 */
	public BookingResult call() {
		try {
            driver = dispatch.getDriver(); //Get an available driver from the dispatch
            if (driver != null) {
            	// Pick up the passenger
                driver.pickUpPassenger(passenger);
                // Drive to the destination
                driver.driveToDestination();
                // Calculate
                long tripDuration = System.currentTimeMillis() - time;
                // Create
                BookingResult result = new BookingResult(bookingID, passenger, driver, tripDuration);
                // Log the completion of the booking
                dispatch.logEvent(this, "Booking completed");
                return result;
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return null;
    }
	
	/***
	 * Should return the:
	 * - booking ID, 
	 * - followed by a colon, 
	 * - followed by the driver's name (if the driver is null, it should show the word "null")
	 * - followed by a colon, 
	 * - followed by the passenger's name (if the passenger is null, it should show the word "null")
	 * 
	 * @return The compiled string
	 */
	@Override
	public String toString()
	{
		String driverName = (driver != null) ? driver.name : "null"; // Check if a driver is assigned
        String passengerName = (passenger != null) ? passenger.name : "null"; // Check if a passenger is assigned
        return bookingID + ": " + driverName + ": " + passengerName;
	}

}
