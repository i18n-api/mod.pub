# 支付系统设计

payBill
payCash
payCashLog

3 张表

API 调用之前会检查用户是否在欠费名单中，如果在，就返回欠费。

API 调用 会在一个 hset 中 hincr ，当 hincr 大于某个阈值（通常为 1 美分）。

就会调用 payBill，写入数据库

写入数据库之后，反向 hincr 一个金额*调用次数（这样不会让不足 1 美分的调用次数被抹零）。

如果有抵扣包，在写数据库之前，扣费之前抵扣包，抵扣包也用 hset。

写入数据库之后，会检查用户余额，如果余额小于0，那么就进入欠费名单。