public class accountTriggerHandler {
    public static void beforeInsertLogic(List<Account> accountList){
        
        //myFirstClass
        System.debug(accountList);
        accountList[0].Phone = '00-000';
        System.debug(accountList);
    }
}