CREATE OR REPLACE FUNCTION check_admin_will_remain(u RECORD)
RETURNS RECORD AS $$
BEGIN
  IF ((SELECT COUNT(*) FROM users WHERE roleid = 3) > 1) THEN
    RETURN u;
  ELSE
    RAISE EXCEPTION 'Cant execute operation because there must be at least one admin';
  END IF;
END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION check_admin_will_remain_after_delete()
RETURNS TRIGGER AS $$
	BEGIN RETURN check_admin_will_remain(OLD); END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER check_admin_will_remain_after_delete
	BEFORE DELETE ON users
	FOR EACH ROW
	WHEN (OLD.roleid = 3)
	EXECUTE FUNCTION check_admin_will_remain_after_delete();
	

CREATE OR REPLACE FUNCTION check_admin_will_remain_after_update()
RETURNS TRIGGER AS $$
	BEGIN RETURN check_admin_will_remain(NEW); END
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER check_admin_will_remain_after_update
	BEFORE UPDATE ON users
	FOR EACH ROW
	WHEN (OLD.roleid = 3 AND NEW.roleid != 3)
	EXECUTE FUNCTION check_admin_will_remain_after_update();