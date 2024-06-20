#!/usr/bin/env coffee

> @3-/exchange
  @3-/dbq > $e $one $q
  @3-/utf8/utf8d.js
  @3-/redis/R.js
  @3-/retry

FROM_CURRENCY = 'USD'
TO_CURRENCY = 'EUR'


run = retry =>
  ID = new Map (await $q("SELECT v,id FROM payCurrency")).map ([v,id])=>
    [
      utf8d v
      id
    ]

  [day,rate]= await exchange(FROM_CURRENCY,TO_CURRENCY)

  await $e(
    "INSERT INTO payExchangeRate(f,t,day,v)VALUES(?,?,?,?) ON DUPLICATE KEY UPDATE id=id"
    ID.get FROM_CURRENCY
    ID.get TO_CURRENCY
    day
    rate
  )

  console.log FROM_CURRENCY,TO_CURRENCY,day,rate
  await R.hset "conf",FROM_CURRENCY+TO_CURRENCY,rate
  return

await run()

process.exit()
