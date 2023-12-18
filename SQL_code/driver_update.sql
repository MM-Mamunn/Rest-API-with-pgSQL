
CREATE OR REPLACE FUNCTION driver_update(id varchar(30), data JSON)
RETURNS JSON AS $$
DECLARE
	_users JSON = NULL::JSON;
	 _driver_id varchar := coalesce((data->>'driver_id')::varchar,NULL);
   _name varchar :=coalesce( (data->>'name')::varchar,NULL); 
   _age INTEGER:= coalesce((data->>'age')::INTEGER,NULL);
	_license_no varchar := coalesce((data->>'license_no')::varchar,NULL);
	
BEGIN
	update driver
	set
	  driver_id = coalesce(_driver_id,driver_id),
	  name = coalesce(_name,name),
	  age= coalesce(_age,age),
	  license_no = coalesce(_license_no,license_no)
	  where driver_id = id;
	RETURN JSON_BUILD_OBJECT(
		'status', 'success',
		'users', _users
	);
END;
$$ LANGUAGE plpgsql;
select * from driver order by driver_id asc

select driver_update('09','{"driver_id":"11"}'::json)