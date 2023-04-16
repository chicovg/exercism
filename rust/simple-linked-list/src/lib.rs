use std::iter::FromIterator;


pub struct SimpleLinkedList<T> {
    head: Option<Box<Node<T>>>,
    length: usize,
}

struct Node<T> {
    value: T,
    next: Option<Box<Node<T>>>,
}

impl<T> SimpleLinkedList<T> {
    pub fn new() -> Self {
        SimpleLinkedList {
            head: None,
            length: 0,
        }
    }

    pub fn is_empty(&self) -> bool {
        self.head.is_none()
    }

    pub fn len(&self) -> usize {
        self.length
    }

    pub fn push(&mut self, element: T) {
        let mut temp = Box::new(Node{value: element, next: None});
        if self.head.is_some() {
            temp.next = std::mem::take(&mut self.head);
        }
        self.head = Some(temp);
        self.length += 1
    }

    pub fn pop(&mut self) -> Option<T> {
        let temp = std::mem::take(&mut self.head);
        if temp.is_none() {
            return None;
        } else {
            let node = *temp.unwrap();
            self.head = node.next;
            return Some(node.value);
        }
    }

    pub fn peek(&self) -> Option<&T> {
        if self.head.is_none() {
            return None;
        } else {
            let node_ref = &self.head.as_ref().unwrap();
            return Some(&node_ref.value)
        }
    }

    #[must_use]
    pub fn rev(&mut self) -> SimpleLinkedList<T> {
        // create a new sll
        // I really just need to reverse the pointers
        // a -> b -> c
        // a <- b <- c
        //
        // iterate through the list
        // temp: a, nh: a, nh.next = null
        // temp: b, nh: b, nh.next = a
        // temp: c, hn: c, nh.next = b
        //
        //
        //
        // new SimpleLinkedList() {
        //    head: nh,
        //    length: (old length)
        // }

        let mut old = &self.head;
        let mut new = None;

        for _i in 0..self.length {
            if new.is_none() {
                new = old.as_ref();
                old = &old.as_ref().unwrap().next;
            } else {
                let temp_node = new.unwrap();
                new = Some(&Box::new(Node {
                    value: old.unwrap().value,
                    next: Some(temp_node),
                }));
            }

        }
        // for _i in 0..self.length {
        //     if new.is_none() {
        //         new = std::mem::take(&mut old);
        //         old = old.unwrap().next;
        //     } else {
        //         let temp = std::mem::take(&mut new);
        //         new = std::mem::take(&mut old);
        //         new.unwrap().next = temp;
        //     }
        // }


        SimpleLinkedList {
            head: None,
            length: self.length,
        }
    }
}

impl<T> FromIterator<T> for SimpleLinkedList<T> {
    fn from_iter<I: IntoIterator<Item = T>>(_iter: I) -> Self {
        unimplemented!()
    }
}

// In general, it would be preferable to implement IntoIterator for SimpleLinkedList<T>
// instead of implementing an explicit conversion to a vector. This is because, together,
// FromIterator and IntoIterator enable conversion between arbitrary collections.
// Given that implementation, converting to a vector is trivial:
//
// let vec: Vec<_> = simple_linked_list.into_iter().collect();
//
// The reason this exercise's API includes an explicit conversion to Vec<T> instead
// of IntoIterator is that implementing that interface is fairly complicated, and
// demands more of the student than we expect at this point in the track.

impl<T> From<SimpleLinkedList<T>> for Vec<T> {
    fn from(mut _linked_list: SimpleLinkedList<T>) -> Vec<T> {
        unimplemented!()
    }
}
