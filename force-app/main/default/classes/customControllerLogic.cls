public class customControllerLogic {

    private integer offsetvalue = 0;
    private integer limitsize = 10;
    private integer totalrecord = 0;
    
    public customControllerLogic(){
        totalrecord = [select count() from account];
    }
    
    public list<Account> getAcc(){
        list<Account> acc =  database.query('SELECT Name, website FROM account LIMIT '+limitsize+' OFFSET '+offsetvalue );
        return acc;
    }
    
    public void next(){
        offsetvalue = offsetvalue + limitsize;
    }
    
    public void previous(){
        offsetvalue = offsetvalue - limitsize;
    }
    
    public Boolean hasNext(){
        if((offsetvalue + limitsize) < totalrecord){
            return true;
        	}
        else 
            return false;
        }
    
}