package nuber.students;

import java.util.HashMap;
import java.util.concurrent.Future;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;

/**
 * The core Dispatch class that instantiates and manages everything for Nuber
 * 
 * @author james
 *
 */
public class NuberDispatch {

	/**
	 * The maximum number of idle drivers that can be awaiting a booking 
	 */
	private final int MAX_DRIVERS = 999;
	
	private boolean logEvents = false;
	private HashMap<String, NuberRegion> regionMap = new HashMap<>();
    private BlockingQueue<Driver> drivers = new LinkedBlockingQueue<>(MAX_DRIVERS);
    private int bookingsAwaitingDriver;
	
	/**
	 * Creates a new dispatch objects and instantiates the required regions and any other objects required.
	 * It should be able to handle a variable number of regions based on the HashMap provided.
	 * 
	 * @param regionInfo Map of region names and the max simultaneous bookings they can handle
	 * @param logEvents Whether logEvent should print out events passed to it
	 */
    //Using HashMap provided
	public NuberDispatch(HashMap<String, Integer> regionInfo, boolean logEvents)
	{
		//logEvents
		this.logEvents = logEvents;
		
		//regionInfo
        for (String regionName : regionInfo.keySet()) {
            NuberRegion nuberRegion = new NuberRegion(this, regionName, regionInfo.get(regionName));
            regionMap.put(regionName, nuberRegion);
        }
	}
	
	/**
	 * Adds drivers to a queue of idle driver.
	 *  
	 * Must be able to have drivers added from multiple threads.
	 * 
	 * @param The driver to add to the queue.
	 * @return Returns true if driver was added to the queue
	 */
	public boolean addDriver(Driver newDriver)
	{
		//Driver to add
		boolean addedDriver = drivers.offer(newDriver);
		//return true if or not
		return addedDriver;
	}
	
	/**
	 * Gets a driver from the front of the queue
	 *  
	 * Must be able to have drivers added from multiple threads.
	 * 
	 * @return A driver that has been removed from the queue
	 */
	public Driver getDriver()
	{
		//Remove
		return drivers.poll();
	}

	/**
	 * Prints out the string
	 * 	    booking + ": " + message
	 * to the standard output only if the logEvents variable passed into the constructor was true
	 * 
	 * @param booking The booking that's responsible for the event occurring
	 * @param message The message to show
	 */
	public void logEvent(Booking booking, String message) {
		
		if (!logEvents) return;
		
		System.out.println(booking + ": " + message);
		
	}

	/**
	 * Books a given passenger into a given Nuber region.
	 * 
	 * Once a passenger is booked, the getBookingsAwaitingDriver() should be returning one higher.
	 * 
	 * If the region has been asked to shutdown, the booking should be rejected, and null returned.
	 * 
	 * @param passenger The passenger to book
	 * @param region The region to book them into
	 * @return returns a Future<BookingResult> object
	 */
	public Future<BookingResult> bookPassenger(Passenger passenger, String region) {
		NuberRegion nuberRegion = regionMap.get(region);
		//If region is not null
        if (region != null) {
        	//NuberRegion
//            int maxJobs = region.getMaxSimultaneousBookings();
//            if (bookingsAwaitingDriver >= maxJobs) {
//                //logEvent(null, "Booking rejected" + region + " Max");
//                return null;
            //}
            //Booking booking = new Booking(this, passenger);
            
            //To return Future<BookingResult>
            Future<BookingResult> result = nuberRegion.bookPassenger(passenger);
            bookingsAwaitingDriver++;
            //logEvent(booking, "Booking created" + region);
            return result;
        }
        return null;
	
	}

	/**
	 * Gets the number of non-completed bookings that are awaiting a driver from dispatch
	 * 
	 * Once a driver is given to a booking, the value in this counter should be reduced by one
	 * 
	 * @return Number of bookings awaiting driver, across ALL regions
	 */
	public int getBookingsAwaitingDriver()
	{
		return bookingsAwaitingDriver;
	}
	
	/**
	 * Tells all regions to finish existing bookings already allocated, and stop accepting new bookings
	 */
	public void shutdown() {
		for (NuberRegion region : regionMap.values()) {
            region.shutdown();
	}

}
}
