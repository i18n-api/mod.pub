t3::api!();
mod _mod;
urlmod!();

#[allow(non_snake_case)]
pub mod K;
mod db;

use client::Client;

pub async fn post(client: Client) -> re::msg!() {
    Ok(())
}
