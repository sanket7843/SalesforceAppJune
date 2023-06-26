public class MyController {
    
    private final Account account;
    
    public mycontroller(){
        account = [select id, name from account
                  where id =:apexpages.currentPage().getParameters().get('id')];
    }
    
    public account getAccount(){
        return account;
    }
    
    public pagereference save(){
        update account;
        return null;
    }

}