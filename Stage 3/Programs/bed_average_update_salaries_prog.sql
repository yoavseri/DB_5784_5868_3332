declare
    v_avg_price number;
    
begin
    v_avg_price := bed_average_price;
    if v_avg_price is not null then
        dbms_output.put_line('The average price of a bed in the hotel is: ' || v_avg_price || '$');
    end if;
    update_salaries_with_bonus;
    
end;
