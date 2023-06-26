public class StringArrayTest {
    public static List<String> generateStringArray(Integer num) {

         List<String> listOfString = new List<String>();

        for (Integer i = num; i<= num; i++){
            listOfString.add('Test '+ i);
        }

        return listOfString;

    }
}