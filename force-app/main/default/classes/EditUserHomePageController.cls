public class EditUserHomePageController {
    
    public String accountId { get; set; }
    public String username { get; set; }    
    public String lastname { get; set; }    
    public String address { get; set; }    
    public String country { get; set; }    
    public Date dob { get; set; }    
    public String email { get; set; }    
    public String password { get; set; }    
    public String phone { get; set; }    
    public User_AdVertIn__c userAdVertIn { get; set; }
    
    public EditUserHomePageController(){
        userAdVertIn = new User_AdVertIn__c();
        
        accountId = ApexPages.currentPage().getParameters().get('accountId');
        //accountId = 'a0R5j000007ZQyUEAW';
        
        User_AdVertIn__c userList = [SELECT id, First_Name__c,Last_Name__c, Address__c, Country__c, Date_Of_Birth__c, Email__c, Password__c, Phone__c FROM User_AdVertIn__c WHERE Id = :accountId LIMIT 1];
        username = userList.First_Name__c;
        lastname = userList.Last_Name__c;
        address = userList.Address__c;
        country = userList.Country__c;
        dob = userList.Date_Of_Birth__c;
        email = userList.Email__c;
        password = userList.Password__c;
        phone = userList.Phone__c;
        
        system.debug('old username is: ' +username);
        system.debug('old lastname is: ' +lastname);
    }
    
    public pageReference logoutbtn(){
           pagereference goToHomePage = new pageReference('/apex/AdVenInHomePage');
        goToHomePage.getParameters().put('accountId',' ');
        return goToHomePage;
    }
    
    public pageReference goToAddsBtn(){
        pagereference goToAddsBtn = new pageReference('/apex/userAdsPage');
        goToAddsBtn.getParameters().put('accountId',accountId);
        return goToAddsBtn;
    }     
    public pageReference goToAccountPage(){
        pagereference goToAccountBtn = new pageReference('/apex/UserHomepage');
        goToAccountBtn.getParameters().put('accountId',accountId);
        return goToAccountBtn;
    }
    public pageReference goToReportPage(){
        pagereference goToReportBtn = new pageReference('/apex/userreportPage');
        goToReportBtn.getParameters().put('accountId',accountId);
        return goToReportBtn;
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
    
    public pageReference saveBtn(){
        User_AdVertIn__c newUser = new User_AdVertIn__c();
        newUser.Id = accountId;
        newUser.First_Name__c = username;
        newUser.Last_Name__c = lastname;
        newUser.Email__c = email;
        newUser.Date_Of_Birth__c = dob;
        newUser.Address__c = address;
        newUser.Country__c = country;
        newUser.Phone__c = phone;
        
        try{
            update newUser;
            system.debug('updated username is: ' + newUser.First_Name__c);
            system.debug('updated lastname is: ' + newUser.Last_Name__c);
            PageReference nextPage = new PageReference('/apex/UserHomepage');
            nextPage.getParameters().put('accountId',accountId);
            return nextPage;
        }
        catch(Exception e){
            system.debug('error while updating is: ' + e);
            return null;
        }
    }
}