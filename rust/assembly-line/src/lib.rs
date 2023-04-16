pub fn production_rate_per_hour(speed: u8) -> f64 {
    let success_rate = match speed {
        1..=4 => 1.0_f64,
        5..=8 => 0.9_f64,
        9..=10 => 0.77_f64,
        _ => 0_f64
    };

    221.0_f64 * speed as f64 * success_rate
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    let per_hour = production_rate_per_hour(speed);

    (per_hour / 60.0_f64) as u32
}
