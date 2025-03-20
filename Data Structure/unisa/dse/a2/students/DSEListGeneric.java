package unisa.dse.a2.students;

import unisa.dse.a2.interfaces.ListGeneric;

/**
 * @author simont
 * @author Gitae Bae
 */
public class DSEListGeneric<E> implements ListGeneric<E> {
	
	public NodeGeneric<E> head;
	private NodeGeneric<E> tail;

	public DSEListGeneric() {
		head = null;
		tail = null;
	}
	public DSEListGeneric(NodeGeneric<E> head_) {
		head = head_;
	}
	
	//Takes a list then adds each element into a new list
	public DSEListGeneric(DSEListGeneric<E> other) { // Copy constructor. 
		DSEListGeneric<E> copy = new DSEListGeneric<E>();
		if (other.head == null) {
			this.head = null;
	}
		else {
			copy.head = new NodeGeneric<E>(other.head.next, null, other.head.get());
			NodeGeneric<E> previousNode = copy.head;
			NodeGeneric<E> currentNode = copy.head.next;
			while (currentNode != null) { 
				NodeGeneric<E> newNode = new NodeGeneric<E>(previousNode, currentNode.next, currentNode.get());
				previousNode = newNode;
				previousNode.next = newNode;
				currentNode = currentNode.next;
			}
		this.head = copy.head;
		}
	}
	
	//remove and return the item at the parameter's index
	public E remove(int index) {
		if (index < 0 || index > this.size()) {
			throw new IndexOutOfBoundsException();
		} 
		else if (head == null) {
			throw new NullPointerException();
		}
		NodeGeneric<E> previousNode = null;
		NodeGeneric<E> currentNode = head;
		if (index == 0 && head.next != null) {
			E item = head.get();
			head.prev = null;
			head = head.next;
		return item;
		} 
		else if (index == this.size() - 1 && currentNode.next != null) {
			while (currentNode.next != null) {
				previousNode = currentNode;
				currentNode = currentNode.next;
			}
			previousNode.next = null;
			tail = previousNode;
		} 
		else {
			for (int i = 0; i < index; i++) {
				previousNode = currentNode;
				currentNode = currentNode.next;
			}
			if (currentNode.next != null) {
				previousNode.next = currentNode.next;
				currentNode.next.prev = previousNode;
			}
		}
		return currentNode.get();
	}

	//returns the index of the String parameter 
	public int indexOf(E obj) {
		NodeGeneric<E> referenceOfNode = head;
		int calculation = 0;
		while (referenceOfNode != null && !referenceOfNode.get().equals(obj)) 
		{
			referenceOfNode = referenceOfNode.next;
			calculation++;
		}
		if (referenceOfNode == null) {
			return -1;
		} else {
			return calculation;
		}
	}
	
	//returns item at parameter's index
	public E get(int index) {
		if (index < 0 || index >= this.size()) {
			return null;
		}
		NodeGeneric<E> referenceOfNode = head;
		for (int i = 0; i < index && referenceOfNode != null; i++) {
			referenceOfNode = referenceOfNode.next;
		}
		return referenceOfNode.get();
	}

	//checks if there is a list
	public boolean isEmpty() {
			return head == null;
	}

	//return the size of the list
		public int size() {
			int calculation = 0;
			NodeGeneric<E> referenceOfNode = head;
			while (referenceOfNode != null) {
				calculation++;
				referenceOfNode = referenceOfNode.next;
			}
			return calculation;
		}
	
	//Take each element of the list a writes them to a string 
	@Override
	public String toString() {
		NodeGeneric<E> referenceOfNode = head;
		String value = "";
		while (referenceOfNode != null) {
			value += referenceOfNode.get() + " ";
			referenceOfNode = referenceOfNode.next;
		}
		return value.trim();
	}
	
	//add the parameter item at of the end of the list
	public boolean add(E obj) {
		if (obj == null) {
			throw new NullPointerException();
		} else {
			if (head == null) {
				head = new NodeGeneric<E>(null, null, obj);
				tail = head;
			} else {
				NodeGeneric<E> referenceOfNode = head;
				while (referenceOfNode.next != null) {
					referenceOfNode = referenceOfNode.next;
				}
				tail = referenceOfNode.next;
				referenceOfNode.next = new NodeGeneric<E>(null, referenceOfNode, obj);
			}
			return true;
		}
	}

	//add item at parameter's index
	public boolean add(int index, E obj) {
		if (obj == null) {
			throw new NullPointerException();
		}
		if (index < 0 || index > this.size()) {
			throw new IndexOutOfBoundsException();
		}
		NodeGeneric<E> referenceOfNode = head;
		if (index == 0) {
			if (head == null) {
				tail = head;
				head = new NodeGeneric<E>(null, null, obj);
			}
		} 
		else if (index == this.size()) {
			NodeGeneric<E> newNode = new NodeGeneric<E>(null, tail, obj);
			tail.next = newNode;
			newNode.prev = tail;
			tail = newNode;
		} 
		else {
			for (int i = 0; i < index && referenceOfNode != null; i++) {
				referenceOfNode = referenceOfNode.next;
			}
			NodeGeneric<E> newNode = new NodeGeneric<E>(referenceOfNode, referenceOfNode.prev, obj);
			referenceOfNode.prev.next = newNode;
			referenceOfNode.prev = newNode;
		}
		return true;
	}

	//searches list for parameter's String return true if found
	public boolean contains(E obj) {
		if (obj == null) {
			throw new NullPointerException();
		}
		NodeGeneric<E> referenceOfNode = head;
		while (referenceOfNode != null) {
			if (referenceOfNode.get().equals(obj)) {
				return true;
			}
			referenceOfNode = referenceOfNode.next;
		}
		return false;
	}

	//removes the parameter's item form the list
	public boolean remove(E obj) {
		if (obj == null || head == null) {
			throw new NullPointerException();
		}
		NodeGeneric<E> previousNode = null;
		NodeGeneric<E> currentNode = head;
		while (currentNode != null && !currentNode.get().equals(obj)) {
			previousNode = currentNode;
			currentNode = currentNode.next;
		}
		if (previousNode == null) {
			head = head.next;
			if (head != null) {
				head.prev = null;
			}
		}
		else {
			previousNode.next = currentNode.next;
			if (previousNode.next != null) {
				previousNode.next.prev = previousNode;
			}
		}
		return true;
	}
	
	@Override
	public int hashCode() {
		return 0;
	}

	@Override
	public boolean equals(Object other) {
		if (other == null) { 
			return false;
		}
		else if (getClass() != other.getClass()) {
			return false;
		} else {
			@SuppressWarnings("unchecked")
			DSEListGeneric<E> otherList = (DSEListGeneric<E>) other;
			if (size() != otherList.size()) { 
				return false;
			}
			NodeGeneric<E> otherReferenceOfNode = otherList.head;
			NodeGeneric<E> referenceOfNode = head;
			while (referenceOfNode != null) {
				if (!(referenceOfNode.get().equals(otherReferenceOfNode.get()))) {
					return false;
				}
				otherReferenceOfNode = otherReferenceOfNode.next;
				referenceOfNode = referenceOfNode.next;
			}
			return true;
		}
	}
}