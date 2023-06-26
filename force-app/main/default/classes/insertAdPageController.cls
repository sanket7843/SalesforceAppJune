public class insertAdPageController {
    
    public Ad__c ad { get; set; }    
    public String username { get; set; }
    public String adname { get; set; }
    public String client { get; set; }   
    public String noOfClick { get; set; }      
    public List<Ad__c> ads { get; set; }      
    public List<Client_AdVertIn__c> clientRecords { get; set; }
    public Blob file { get; set; }
    public String parentId { get; set; } // Id of the parent record
    public List<SelectOption> clientOptions { get; set; }
    public String selectedClientId { get; set; }
    
    public insertAdPageController() {
        getClientOptions(); 
        Admin_AdvertIn__c[] userList = [SELECT Admin_Name__c FROM Admin_AdvertIn__c WHERE Id = 'a0S5j0000072brAEAQ' LIMIT 1];
        if (userList.size() > 0) {
            Admin_AdvertIn__c user = userList[0];
            username = user.Admin_Name__c;
        }
    }
    
    public List<SelectOption> getClientOptions() {
        system.debug('client options called');
        clientOptions = new List<SelectOption>();
        // Retrieve the list of clients from your data source
        List<Client_AdVertIn__c> clients = [SELECT Id, Client_Name__c FROM Client_AdVertIn__c];
        
        // Populate the select options with client names and IDs
        for (Client_AdVertIn__c client : clients) {
            clientOptions.add(new SelectOption(client.Id, client.Client_Name__c));
        }
        system.debug('client options are: '+clientOptions);
        return clientOptions;
        
    }
   
    
    public pagereference logoutbtn() {
        pagereference goToHomePage = new pageReference('/apex/AdVentInHomePage');
        goToHomePage.getParameters().put('accountId',' ');
        return goToHomePage;
    }
    
    public PageReference addAdvert() {
        //content version content document
        //Attachment newAttachment = new Attachment();
        //newAttachment.Name = adname;
        //newAttachment.Body = file;
        //newAttachment.ParentId = parentId;
        //try {
        //    insert newAttachment;
        //    system.debug('attachment id is: ' +newAttachment.Id);
        //} 
        //catch (Exception e) {
        //}
        
        //save the file and save the attachment.id in a seperate variable in custom obj
        System.debug('inside save button');
        Ad__c newAd = new Ad__c();
        
        System.debug('adname: '+adname);
        System.debug('client: '+client);
        System.debug('noOfClick: '+noOfClick);
        newAd.Ad_Name__c = adname;
        newAd.Client__c = client;
        newAd.No_Of_Clicks__c = noOfClick;
        try{
            insert newAd;
            System.debug('inside try ');
            System.debug('Name: ' + newAd.Client__c);
            adname='';
            client='';
            noOfClick='';
            PageReference adPage = new PageReference('/apex/insertAdPage');
            return adPage;
        }
        catch(exception e){
            system.debug('the error is: ' +e);
            return null;
        }
        
    }
    
      public pagereference showUser() {
        pagereference goToshowUser = new pageReference('/apex/AdminOrUserHomepage');
        return goToshowUser;
    }    
    
    public pagereference showClient() {
        pagereference goToshowClient = new pageReference('/apex/showClientPage');
        return goToshowClient;
    }    
    
    public pagereference insertAd() {
        pagereference goToinsertAd = new pageReference('/apex/insertAdPage');
        return goToinsertAd;
    }    
    
    public pagereference sendAdvertise() {
        pagereference goTosendAdvertise = new pageReference('/apex/sendAdvertisePage');
        return goTosendAdvertise;
    }    
    
    public pagereference redemption() {
        pagereference goToredemptionPage = new pageReference('/apex/redemptionPage');
        return goToredemptionPage;
    }    
    
    public pagereference redemptionRequest() {
        pagereference gotoredemptionRequestPage = new pageReference('/apex/redemptionRequestPage');
        return gotoredemptionRequestPage;
    }    
}