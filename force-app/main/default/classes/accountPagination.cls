public class accountPagination {
    
    private final Account account {get;set;}
    
    public accountPagination(ApexPages.StandardSetController controller){
        this.account =(Account)controller.getRecord();
    }
    
    public ApexPages.StandardSetController getAccount{
        get{
            if(getAccount==null){
                getAccount= new ApexPages.StandardSetController(
                Database.getQueryLocator([select id, name from account LIMIT 5 ]));
            }
            return getAccount;
        }
        private set;
    }
    public List<Account> getAccountPagination(){
        return (List<account>) getAccount.getRecords();
    }
}