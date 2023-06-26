public class customPagination {
    public integer totalSize = 0;
    public integer offsetValue = 0; 
    public integer limitSize = 10;
    
    public customPagination(){
        totalSize = [select count() from Account];
    }
    
    public List<Account> getAcclist(){
        list<account> accList= Database.Query('select name, website, description from account limit '+limitSize+' Offset '+offsetValue);
		return accList;
	}
    
    public boolean hasPrevious(){
        if((limitSize+offsetValue) > totalSize){
            return false;
        }
        else
            return true;
    }
    
    public boolean hasNext(){
        if(totalSize< offsetValue+limitSize){
            return false;
        }
        return true;
    }
    
    public void previous(){
        offsetValue = offsetValue - limitSize;
    }
    
    public void next(){
        offsetValue = offsetValue + limitSize;
    }
    
}