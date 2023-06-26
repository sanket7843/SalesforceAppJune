public class AccountHandler {

    public static Account insertNewaccount(String name){
        try{
            Account acc = new Account(Name = name);
            insert acc;
            //insert acc;
            return acc;
        }catch(DMLException e){
            return null;
        }
            
    
    }
}