public class UserHomepageController {
    
    public String accountId { get; set; }
    public String username { get; set; }    
    public String lastname { get; set; }    
    public String address { get; set; }    
    public String country { get; set; }    
    public Date dob { get; set; }    
    public String email { get; set; }    
    public String password { get; set; }    
    public String phone { get; set; }    
    
    public UserHomepageController(){
        accountId = ApexPages.currentPage().getParameters().get('accountId');
        //accountId = 'a0R5j000007ZQyUEAW';
        system.debug('acocuntId is from userHomePage: ' +accountId);
        User_AdVertIn__c userList = [SELECT First_Name__c,Last_Name__c, Address__c, Country__c, Date_Of_Birth__c, Email__c, Password__c, Phone__c FROM User_AdVertIn__c WHERE Id = :accountId LIMIT 1];
        username = userList.First_Name__c;
        lastname = userList.Last_Name__c;
        address = userList.Address__c;
        country = userList.Country__c;
        dob = userList.Date_Of_Birth__c;
        email = userList.Email__c;
        password = userList.Password__c;
        phone = userList.Phone__c;
        
        system.debug('username is: ' +username);
        system.debug('lastname is: ' +lastname);
        system.debug('address is: ' +address);
        system.debug('country is: ' +country);
        system.debug('dob is: ' +dob);
        system.debug('email is: ' +email);
        system.debug('password is: ' +password);
        system.debug('phone is: ' +phone);
    }
    
    public pagereference updatebtn() {
        pagereference goToEditPage = new pageReference('/apex/EditUserHomePage');
        goToEditPage.getParameters().put('accountId',accountId);
        return goToEditPage;
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
    
    public pagereference logoutbtn() {
        pagereference goToHomePage = new pageReference('/apex/AdVentInHomePage');
        goToHomePage.getParameters().put('accountId',' ');
        return goToHomePage;
    }
    
    
    public String getUsername() {
        return username;
    }
    
}