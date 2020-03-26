import java.util.Scanner;

class palidromo {

  public static boolean isPali(int i){
    String num = String.valueOf(i);
    int inicio = 0;
    int termino = num.length()-1;
    while (inicio < termino){
      if (num.charAt(inicio) != num.charAt(termino)){
        return false;
      }
      else{
        inicio = inicio + 1;
        termino = termino - 1;
      }
    }
    return true;
  }

  public static void DivPali(int N){
    for(int i=1;i<=N;i++){
      if (N%i==0 && isPali(i)){
        if (i!=1){
          System.out.print(',');
        }
        System.out.print(i);
      }
    }
  }

  public static void main(String[] args) {
    Scanner input = new Scanner(System.in);
    int N = input.nextInt();
    DivPali(N);
    System.out.print("\n");
  }
}
