package ch05;

public class Employee {
	    int id;
	    String name;
	    static int nextId;

	    static {
	        System.out.println("加载静态初始化块");
	        Employee.nextId = 1;
	    }

	    {
	        id = Employee.nextId;
	        Employee.nextId++;
	        System.out.println("初始化方法中实现" + id + "员工的初始化");
	    }

	    public Employee() {
	        System.out.println("初始化方法中实现" + id + "员工的初始化");
	    }

	    public Employee(String strName) {
	        name = strName;
	        System.out.println("初始化方法中实现" + id + "员工的初始化");
	    }

	    public static void main(String[] args) {
	        Employee ee1 = new Employee();
	        Employee ee2 = new Employee("李白");
	        System.out.println("第一名员工:" + ee1.id + " " + ee1.name);
	        System.out.println("第二名员工:" + ee2.id + " " + ee2.name);
	    }
	}