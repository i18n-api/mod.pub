CREATE FUNCTION `payBillNew`(`uid` BIGINT UNSIGNED,`cid` SMALLINT UNSIGNED,`kid` BIGINT UNSIGNED,`rid` BIGINT UNSIGNED,`amount` BIGINT,`ts` BIGINT UNSIGNED) RETURNS BIGINT
BEGIN
 DECLARE bill_id BIGINT UNSIGNED;
 DECLARE day MEDIUMINT UNSIGNED;
 DECLARE now_n BIGINT;
 SET day=ts DIV 86400;
 SELECT id INTO bill_id FROM payBill WHERE payBill.uid=uid AND payBill.cid=cid AND payBill.rid=rid AND payBill.day=day;
 IF bill_id IS NULL THEN
    INSERT INTO payBill (uid,cid,kid,rid,n,day) VALUES (uid,cid,kid,rid,amount,day) ON DUPLICATE KEY UPDATE n=n+amount;
    SET bill_id=LAST_INSERT_ID();
 ELSE
    UPDATE payBill SET n=n+amount WHERE id=bill_id;
 END IF;
 SELECT n INTO now_n FROM payCash WHERE id=uid;
 IF now_n IS NULL THEN
    SET now_n=amount;
    INSERT INTO payCash (id,n) VALUES (uid,amount) ON DUPLICATE KEY UPDATE n=n+amount;
 ELSE
    SET now_n=now_n+amount;
    UPDATE payCash SET n=n+amount WHERE id=uid;
 END IF;
 INSERT INTO payCashLog (ts,n,diff,bill_id) VALUES (ts,now_n,amount,bill_id);
 RETURN now_n;
END ;;