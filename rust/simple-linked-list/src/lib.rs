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
            self.length -= 1;
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
        let mut prev = None;
        let mut curr = std::mem::take(&mut self.head);

        while let Some(mut node) = curr.take() {
            let next = node.next.take();
            node.next = prev.take();
            prev = Some(node);
            curr = next;
        }

        SimpleLinkedList {
            head: prev,
            length: self.length,
        }
    }
}

impl<T> FromIterator<T> for SimpleLinkedList<T> {
    fn from_iter<I: IntoIterator<Item = T>>(iter: I) -> Self {
        let mut l = SimpleLinkedList::new();

        for i in iter {
            l.push(i)
        }

        l
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
    fn from(mut linked_list: SimpleLinkedList<T>) -> Vec<T> {
        let mut v = Vec::new();
        let mut linked_list_rev = linked_list.rev();

        while let Some(i) = linked_list_rev.pop() {
            v.push(i)
        }

        v
    }
}
