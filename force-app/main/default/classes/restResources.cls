@restResource(urlMapping= '/Account/*')
global with sharing class restResources{
    
    @httpGet
    global static string doGet(){
        RestRequest req = RestContext.request;
        string aId = req.requestURI.substring(req.requestURI.lastIndexof('/')+1);
        account ac = [select id from account where Id = :aId];
        return 'Account Id Is: '+ac.id;
    }
    
    @httpPost 
    global static string doPost(string name, string phone){
        account ac = new account();
        ac.name = name;
        ac.phone = phone;
        insert ac;
        return 'Account Inserted Successfully: '+ac.id;
    }
    
    @httpput
    global static string doPut(string name){
        RestRequest req = RestContext.request;
        string aid = req.requestURI.substring(req.requestURI.lastindexof('/')+1);
        account ac = [select id from account where id = :aid];
        ac.Name = name;
        update ac;
        return ac.id;
    }
    
    @httpDelete
    global static string doDelete(){
        RestRequest req = restContext.request;
        string aid = req.requestURI.substring(req.requestURI.lastindexof('/')+1);
        account ac = [select id from account where id = :aid];
        Delete ac;
        return 'Account deleted Successfully '+ac.id;
    }
}