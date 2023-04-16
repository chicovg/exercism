use std::ops::Index;

pub fn find<A, T>(array: A, key: T) -> Option<usize>
    where A: ExactSizeIterator + Index<usize>,
          <A as Index<usize>>::Output: Copy + Sized + PartialEq<T> + PartialOrd<T>,
          T: Sized + PartialOrd<<A as Index<usize>>::Output>,
{
    let arr_len = array.len();
    if arr_len == 0 {
        return None;
    }
    find_in_array(array, key, 0, arr_len - 1)
}

fn find_in_array<A, T>(array: A, key: T, start: usize, end: usize) -> Option<usize>
    where A: ExactSizeIterator + Index<usize>,
          <A as Index<usize>>::Output: Copy + Sized + PartialEq<T> + PartialOrd<T>,
          T: Sized + PartialOrd<<A as Index<usize>>::Output>,
{
    let mid = (start + end) / 2;
    let mid_val = array[mid];

    if mid_val == key {
        Some(mid)
    } else if mid > 0 && key < mid_val {
        find_in_array(array, key, start, mid - 1)
    } else if key > mid_val {
        find_in_array(array, key, mid + 1, end)
    } else {
        None
    }
}

// pub fn find(array: &[i32], key: i32) -> Option<usize> {
//     find_in_slice(&array, key, 0)
// }

// fn find_in_slice(slice: &[i32], key: i32, offset: usize) -> Option<usize> {
//     let arr_len = slice.len();
//     if arr_len == 0 {
//         return None;
//     }
//     let end = arr_len - 1;
//     let mid = end / 2;
//     let mid_val = slice[mid];

//     if mid_val == key {
//         Some(offset + mid)
//     } else if mid > 0 && key < mid_val {
//         find_in_slice(&slice[0..=(mid - 1)], key, offset)
//     } else if key > mid_val {
//         find_in_slice(&slice[(mid + 1)..=end], key, offset + mid + 1)
//     } else {
//         None
//     }
// }
