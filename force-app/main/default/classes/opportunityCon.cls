public class opportunityCon {
    
    public Apexpages.StandardSetController setCon {
        
        get{
            if(setcon==null){
                setcon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [select id, name from opportunity ]));
            }
            return setcon;
        }
        set;
        
    }

    public List<Opportunity> getOpp(){
        return (List<Opportunity>) setCon.getrecords();
    }
}