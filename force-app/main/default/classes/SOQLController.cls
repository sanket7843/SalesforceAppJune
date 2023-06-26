public class SOQLController {
    public list<opportunity> oppList {get;set;}
    public list<account> accList {get;set;}
    public list<contact> conList {get;set;}
    public String strSearch{get;set;}
    
    public void soslDemo(){
        oppList = new list<Opportunity>();
        conList = new list<Contact>();
        accList = new list<account>();
        
        if(strSearch.length() > 1){
            String strSearch1 = '*'+strSearch+'*';
            
            string searchQuery = 'find \'' + strSearch +
                '\' in all fields returning account(id,name), contact(name,email),opportunity(name, StageName)';
            
            List<List<sObject>> listToGet = search.query(searchQuery);
            
            accList = (list<account>)listToGet[0];
            conList = (list<contact>)listToGet[1];
            oppList = (list<opportunity>)listToGet[2];
            
            if(accList.size() == 0 && conList.size() == 0 && oppList.size()==0){
                apexpages.addMessage(new ApexPages.message(apexpages.Severity.ERROR,'Sorry, No results were found.'));
                return;
            }
        }        
            else{
                apexPages.addMessage(new ApexPages.message(apexpages.Severity.ERROR,'Please enter atleast two characters.'));
                return;
            }
            
        }
        
    }