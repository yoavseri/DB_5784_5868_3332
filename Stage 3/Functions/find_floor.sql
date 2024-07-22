create or replace function find_floor(room number) return number
as
begin
  return floor(room / 100);
end;
