CREATE TRIGGER payStripeToRmed AFTER DELETE ON payStripe
FOR EACH ROW
BEGIN
  INSERT INTO payStripeRmed (id,uid,brand_id,name,exp,status,v,ts,kind)
  VALUES (OLD.id,OLD.uid,OLD.brand_id,OLD.name,OLD.exp,OLD.status,OLD.v,OLD.ts,OLD.kind);
END ;;