-- Write a query to get the top 10 venues sorted by number of bookings in the last 30 days.

select v.name, count(b.id) as booking_count
from venues v
join
bookings b on v.id=b.venue_id
and
b.booking_date >= NOW() - INTERVAL '30 days'
group by v.name
order by booking_count desc
limit 10;
