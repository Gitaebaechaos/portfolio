package unisa.dse.a2.students;

import unisa.dse.a2.interfaces.List;

/**
 * @author simont
 * @author Gitae Bae
 */
public class DSEList implements List {
	
	public Node head;
	private Node tail;

	public DSEList() {
		head = null;
		tail = null;
	}
	public DSEList(Node head_) {
		head = head_;
	}
	
	//Takes a list then adds each element into a new list
	public DSEList(DSEList other) { // Copy constructor. 
		DSEList copy = new DSEList();
		if (other.head == null) {
			this.head = null;
			}
		
		//Copy detail each node in a other list 
		else {
			copy.head = new Node(other.head.next, null, other.head.getString());
			Node previousNode = copy.head;
			Node currentNode = copy.head.next;
			while (currentNode != null) { 
				Node newNode = new Node(previousNode, currentNode.next, currentNode.getString());
				previousNode = newNode;
				previousNode.next = newNode;
				currentNode = currentNode.next;
			}
		this.head = copy.head;
		}
	}

	//remove the String at the parameter's index
	public String remove(int index) {
		if (index < 0 || index > this.size()) {
			throw new IndexOutOfBoundsException();
		}
			else if (head == null) {
				throw new NullPointerException();
			}
			Node previousNode = null;
			Node currentNode = head;
			if (index == 0 && head.next != null) {
				String item = head.getString();
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
			return currentNode.getString();
		}
	
		// returns the index of the String parameter
		public int indexOf(String obj) {
			Node referenceOfNode = head;
			int calculation = 0;
			while (referenceOfNode != null && !referenceOfNode.getString().equals(obj)) {
				referenceOfNode = referenceOfNode.next;
				calculation++;
			}
			if (referenceOfNode == null) {
				return -1;
			} else {
				return calculation;
			}
		} 
	
	//returns String at parameter's index
		public String get(int index) {
			if (index < 0 || index >= this.size()) {
				return null;
			}
			Node referenceOfNode = head;
			for (int i = 0; i < index && referenceOfNode != null; i++) {
				referenceOfNode = referenceOfNode.next;
			}
			return referenceOfNode.getString();
		}
		
	//checks if there is a list
	public boolean isEmpty() {
		return head == null;
	}

	//return the size of the list
	public int size() {
		int calculation = 0;
		Node referenceOfNode = head;
		while (referenceOfNode != null) {
			calculation++;
			referenceOfNode = referenceOfNode.next;
		}
		return calculation;
	}
	
	//Take each element of the list a writes them to a string 
	@Override
	public String toString() {
		Node referenceOfNode = head;
		String valueOfNode = "";
		while (referenceOfNode != null) {
			valueOfNode += referenceOfNode.getString() + " ";
			referenceOfNode = referenceOfNode.next;
		}
		return valueOfNode.trim();
	}

	//add the parameter String at of the end of the list
	public boolean add(String obj) {
		if (obj == null) {
			throw new NullPointerException();
		} else {
			if (head == null) {
				head = new Node(null, null, obj);
				tail = head;
			} else {
				Node referenceOfNode = head;
				while (referenceOfNode.next != null) {
					referenceOfNode = referenceOfNode.next;
				}
				tail = referenceOfNode.next;
				referenceOfNode.next = new Node(null, referenceOfNode, obj);
			}
			return true;
		}
	}
	
	//add String at parameter's index
	public boolean add(int index, String obj) {
		if (obj == null) {
			throw new NullPointerException();
		}
		if (index < 0 || index > this.size()) {
			throw new IndexOutOfBoundsException();
		}
		Node referenceOfNode = head;
		if (index == 0) {
			if (head == null) {
				tail = head;
				head = new Node(null, null, obj);
			} else {
				referenceOfNode.prev = head;
				head = new Node(referenceOfNode, null, obj);
			}
		} 
		else {
			for (int i = 0; i < index && referenceOfNode != null; i++) {
				referenceOfNode = referenceOfNode.next;
			}
			Node newNode = new Node(referenceOfNode, referenceOfNode.prev, obj);
			referenceOfNode.prev.next = newNode;
			referenceOfNode.prev = newNode;
		}
		return true;
	}
	
	//searches list for parameter's String return true if found
	public boolean contains(String obj) {
		if (obj == null) {
			throw new NullPointerException();
		}
		Node referenceOfNode = head;
		while (referenceOfNode != null) {
			if (referenceOfNode.getString().equals(obj)) {
				return true;
			}
			referenceOfNode = referenceOfNode.next;
		}
		return false;
	}

	//removes the parameter's String form the list
	public boolean remove(String obj) {
		if (obj == null || head == null) {
			throw new NullPointerException();
		}
		Node previousNode = null;
		Node currentNode = head;
		while (currentNode != null && !currentNode.getString().equals(obj)) {
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
			DSEList otherList = (DSEList) other;
			if (size() != otherList.size()) { 
				return false;
			}
			Node otherReferenceOfNode = otherList.head;
			Node referenceOfNode = head;
			while (referenceOfNode != null) {
				if (!(referenceOfNode.getString().equals(otherReferenceOfNode.getString()))) {
					return false;
				}
				otherReferenceOfNode = otherReferenceOfNode.next;
				referenceOfNode = referenceOfNode.next;
			}
			return true;
		}
	}
	
}