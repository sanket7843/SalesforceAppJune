public class addUserPageController {
    
    public User_AdVertIn__c userAdVertIn { get; set; }
    public String accountId{ get; set; }    
    public String userRole{ get;set; }
    public String username { get; set; }    
    public String lastname { get; set; }    
    public String firstname { get; set; }    
    public String address { get; set; }    
    public String isAdmin { get; set; }    
    public String country { get; set; }    
    public String secretQuestion { get; set; }    
    public String secretAnswer { get; set; }    
    public Date dob { get; set; }    
    public String email { get; set; }    
    public String password { get; set; }   
    public String confirmPassword { get; set; }    
    public String phone { get; set; }      
    public List<User_AdVertIn__c> userRecords { get; set; }

    
    public addUserPageController() {
        userAdVertIn = new User_AdVertIn__c();
   		accountId = ApexPages.currentPage().getParameters().get('accountId');
       Admin_AdvertIn__c[] userList = [SELECT Admin_Name__c FROM Admin_AdvertIn__c WHERE Id = 'a0S5j0000072brAEAQ' LIMIT 1];
        if (userList.size() > 0) {
            Admin_AdvertIn__c user = userList[0];
            username = user.Admin_Name__c;
        }
    }
      public List<SelectOption> getsecurityOptions() {
        List<SelectOption> options = new List<SelectOption>();
        Schema.DescribeFieldResult fieldResult = User_AdVertIn__c.Secret_Question__c.getDescribe();
        List<Schema.PicklistEntry> picklistValues = fieldResult.getPicklistValues();
        
        for (Schema.PicklistEntry picklistEntry : picklistValues) {
            options.add(new SelectOption(picklistEntry.getValue(), picklistEntry.getLabel()));
        }
        return options;
    }
    public List<SelectOption> getCountryOptions() {
        List<SelectOption> options = new List<SelectOption>();
        Schema.DescribeFieldResult fieldResult = User_AdVertIn__c.Country__c.getDescribe();
        List<Schema.PicklistEntry> picklistValues = fieldResult.getPicklistValues();
        
        for (Schema.PicklistEntry picklistEntry : picklistValues) {
            options.add(new SelectOption(picklistEntry.getValue(), picklistEntry.getLabel()));
        }
        return options;
    }
    public pagereference logoutbtn() {
        pagereference goToHomePage = new pageReference('/apex/AdVentInHomePage');
        goToHomePage.getParameters().put('accountId',' ');
        return goToHomePage;
    }
        
    public PageReference registerUser() {
            
            System.debug('pw match');
            User_AdVertIn__c newUser = new User_AdVertIn__c();
            newUser.First_Name__c = firstname;
            newUser.Last_Name__c = lastname;
            newUser.Email__c = email;
            newUser.Password__c = password;
            newUser.Date_Of_Birth__c = dob;
            newUser.Address__c = address;
            newUser.Country__c = country;
            newUser.Phone__c = phone;
            newUser.Secret_Question__c = secretQuestion;
            newUser.Secret_Answer__c = SecretAnswer;
            try{
                insert newUser;
                System.debug('inside try ');
                system.debug('accountId is: ' +accountId);
                System.debug('Name: ' + userAdVertIn.First_Name__c);
                System.debug('Last Name: ' + userAdVertIn.Last_Name__c);
                System.debug('country: ' + userAdVertIn.Country__c);
                System.debug('secuity question: ' + userAdVertIn.Secret_Question__c);
                
                PageReference userPage = new PageReference('/apex/AdminOrUserHomepage');
                return userPage;
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
        goToshowClient.getParameters().put('accountId',accountId);
        return goToshowClient;
    }    
    
    public pagereference insertAd() {
        pagereference goToinsertAd = new pageReference('/apex/insertAdPage');
        goToinsertAd.getParameters().put('accountId',accountId);
        return goToinsertAd;
    }    
    
    public pagereference sendAdvertise() {
        pagereference goTosendAdvertise = new pageReference('/apex/sendAdvertisePage');
        goTosendAdvertise.getParameters().put('accountId',accountId);
        return goTosendAdvertise;
    }    
    
    public pagereference redemption() {
        pagereference goToredemptionPage = new pageReference('/apex/redemptionPage');
        goToredemptionPage.getParameters().put('accountId',accountId);
        return goToredemptionPage;
    }    
    
    public pagereference redemptionRequest() {
        pagereference gotoredemptionRequestPage = new pageReference('/apex/redemptionRequestPage');
        gotoredemptionRequestPage.getParameters().put('accountId',accountId);
        return gotoredemptionRequestPage;
    }    
    
}