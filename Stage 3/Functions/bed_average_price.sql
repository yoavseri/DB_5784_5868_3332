create or replace function bed_average_price return number
as
    sum_of_beds number := 0;
    total_prices number := 0;
    average_of_price_for_bed number;
begin
     -- Sum up total price and number of beds from Room table
     select sum(price), sum(beds)
     into total_prices, sum_of_beds
     from Room;
     
     -- Calculate and round average price per bed
     average_of_price_for_bed := round(total_prices/sum_of_beds, 2);
     
    return (average_of_price_for_bed);
end;
