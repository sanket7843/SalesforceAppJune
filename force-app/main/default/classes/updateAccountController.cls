public class updateAccountController {

    private final Account account;
    
    public updateAccountController(){
        account = [select id, name, site from account where id=:ApexPages.currentPage().getParameters().get('id')];
    }
    
    public Account getAccount(){
        return account;
    }
    
    public pagereference save(){
        update account;
        return null;
    }
    
}