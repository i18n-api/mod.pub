#[allow(non_camel_case_types)]
pub enum TOPUP {
  MANUAL = 0,
  STRIPE = 1,
  GOOGLE_PAY = 2,
  ALI = 3,       // 支付宝
  AIRWALLEX = 4, // 空中云汇
  WX = 5,        // 微信
}
