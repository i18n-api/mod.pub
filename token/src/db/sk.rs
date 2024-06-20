use intbin::u64_bin;
use r::fred::interfaces::{HashesInterface, RedisResult};

use crate::K;

genv::s!(TOKEN_SK);

pub fn bin(uid: u64, token_id: u64, ts: u64) -> Vec<u8> {
  vb::e([uid, token_id, ts])
}

pub fn b64(uid: u64, token_id: u64, ts: u64) -> String {
  let vid = bin(uid, token_id, ts);
  ub64::b64e(vid)
}

pub async fn set_bin(token_id_bin: &[u8], ts: u64) -> RedisResult<()> {
  r::R.hset(K::TOKEN, (token_id_bin, u64_bin(ts))).await
}

pub async fn set(token_id: u64, ts: u64) -> RedisResult<()> {
  set_bin(&u64_bin(token_id)[..], ts).await
}
