create database ola;
use ola;
select * from ola.bookings;

-- Q1. Retrieve all the successfull booking
create view Successfull_Bookings as
select * from ola.bookings
where Booking_Status = 'Success';

select * from ola.successfull_bookings;

-- Q2. Find Average Ride Distance for each vehicle type
create view Average_RideDistance_By_VehicleType as
select Vehicle_Type, Avg(Ride_Distance) from ola.bookings
where Booking_Status = 'Success'
group by Vehicle_Type;

select * from ola.average_ridedistance_by_vehicletype;


-- Q3. Total Number of cancelled Rides by customers

create view cancelledrides_by_customers as
select count(Booking_ID) from ola.bookings
where Booking_Status = "Canceled by Customer";

select * from ola.cancelledrides_by_customers;

-- Q4. Top 5 Customers who booked highest number of rides

create view Top_5_Customers as
select Customer_ID, count(Booking_ID) as number_of_rides from ola.bookings
where Booking_Status='Success'
group by Customer_ID 
order by number_of_rides desc
limit 5;

select * from ola.customer_with_highest_number_of_rides;


-- Q5. number of rides cancelled by drivers due to personal reason and car related issues
create view CancelledbyDriver_dueto_PersonalandCarrelatedissue as
select * from ola.bookings
where Canceled_Rides_by_Driver = "Personal & Car related issue";

-- Q6. Find max and min driver rating for prime sedan booking
create view minmax_rating_of_primesedan as
select min(Driver_Ratings) as min_rating, max(Driver_Ratings) as max_rating from ola.bookings
where Vehicle_Type = 'Prime Sedan';

-- Q7. Retrieve all rides where payment was made using UPI
create view rides_with_upi_payment as
select * from ola.bookings
where Payment_Method = 'UPI';

-- Q8. Find Average Customer Rating per Vehicle Type
create view avg_customerrating_per_vehicle as
select Vehicle_Type, avg(Customer_Rating) as avg_rating_by_customer
from ola.bookings
group by Vehicle_Type;

-- Q9. Calculate total booking value of ride completed successfully
create view total_successfull_booking_value as
select sum(Booking_Value) as total_booking_value
from ola.bookings
where Booking_Status = 'Success';

-- Q10. All incomplete rides along with reason
create view incomplete_ride_details as
select Customer_ID, Booking_ID,Booking_Value,Payment_Method,Booking_Status,Incomplete_Rides_Reason 
from ola.bookings
where Incomplete_Rides='Yes';



