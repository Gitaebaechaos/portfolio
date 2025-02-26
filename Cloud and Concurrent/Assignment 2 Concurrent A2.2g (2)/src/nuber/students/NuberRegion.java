package nuber.students;

import java.util.concurrent.Future;
import java.util.concurrent.Executors;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.ArrayBlockingQueue;


/**
 * A single Nuber region that operates independently of other regions, other than getting 
 * drivers from bookings from the central dispatch.
 * 
 * A region has a maxSimultaneousJobs setting that defines the maximum number of bookings 
 * that can be active with a driver at any time. For passengers booked that exceed that 
 * active count, the booking is accepted, but must wait until a position is available, and 
 * a driver is available.
 * 
 * Bookings do NOT have to be completed in FIFO order.
 * 
 * @author james
 *
 */
public class NuberRegion {
	private final NuberDispatch nuberDispatch;
	private final String name;
	private final int max;
	private final ArrayBlockingQueue<Future<BookingResult>> jobs;
	
	ThreadPoolExecutor TPExecutor; //Thread pool for bookings
	    

	
	/**
	 * Creates a new Nuber region
	 * 
	 * @param dispatch The central dispatch to use for obtaining drivers, and logging events
	 * @param regionName The regions name, unique for the dispatch instance
	 * @param maxSimultaneousJobs The maximum number of simultaneous bookings the region is allowed to process
	 */
	public NuberRegion(NuberDispatch dispatch, String regionName, int maxSimultaneousJobs)
	{
		this.nuberDispatch = dispatch; //Initialize 
		this.name = regionName; //Set
		this.max = maxSimultaneousJobs; //Set
        this.jobs = new ArrayBlockingQueue<>(maxSimultaneousJobs);
        TPExecutor = (ThreadPoolExecutor) Executors.newFixedThreadPool(max);
	}
	
	/**
	 * Creates a booking for given passenger, and adds the booking to the 
	 * collection of jobs to process. Once the region has a position available, and a driver is available, 
	 * the booking should commence automatically. 
	 * 
	 * If the region has been told to shutdown, this function should return null, and log a message to the 
	 * console that the booking was rejected.
	 * 
	 * @param waitingPassenger
	 * @return a Future that will provide the final BookingResult object from the completed booking
	 */
	public Future<BookingResult> bookPassenger(Passenger waitingPassenger)
	{		
		if (TPExecutor.isShutdown()) { // Check if region is shutdown
            this.nuberDispatch.logEvent(null, "Rejected " + this.name + "Maximum simultaneous");
            return null; // Return null to indicate booking was rejected
        } else {
        	Booking booking = new Booking(nuberDispatch, waitingPassenger); //Create a new booking
        	Future<BookingResult> result = TPExecutor.submit(booking); //Submit the booking
            jobs.offer(result); // Add the result to the queue
            return result;
        }
    }
	
	/**
	 * Called by dispatch to tell the region to complete its existing bookings and stop accepting any new bookings
	 */
	public void shutdown()
	{
		TPExecutor.shutdown(); // Shutdown the thread pool
		for (Future<BookingResult> bookingResult : jobs) {
            bookingResult.cancel(true); //Cancel
	}
	}	
}
