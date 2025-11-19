package ch3;
import java.util.Scanner;
public class wdf {

	public static void main(String[] args) {
			int sum=0;
			int i=0;
			System.out.println("输入一个数字");
			Scanner sc = new Scanner(System.in);
			int guess = sc.nextInt();
			//for循环实现求解任意数的累加和;
//			for(i=0; i<=guess;i++) {
//				sum=sum+i;
//			}
//			System.out.print(sum);
			//do..while循环实现求解任意数的累加和;
//			do {
//				sum+=i;
//				i++;
//			}while(i<=100);
//			System.out.print(sum);
			//while循环实现求解?以内的偶数
			while(i<=guess) {
				i+=1;
				if(i%2==0) {
					System.out.print(i+"\t\n");
				}
			}
	}

}
