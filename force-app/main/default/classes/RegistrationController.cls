public class RegistrationController {
    
    public User_AdVertIn__c userAdVertIn { get; set; }
    public String ll {get;set;}
    public String accountId{ get; set; }    
    public String username { get; set; }    
    public String lastname { get; set; }    
    public String address { get; set; }    
    public String country { get; set; }    
    public String secretQuestion { get; set; }    
    public String secretAnswer { get; set; }    
    public Date dob { get; set; }    
    public String email { get; set; }    
    public String password { get; set; }   
    public String confirmPassword { get; set; }    
    public String phone { get; set; }     
    
    public RegistrationController() {
        userAdVertIn = new User_AdVertIn__c();
        ll = 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.';
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
    
    public PageReference loginUser(){
        List<User_AdVertIn__c> userList = [SELECT Id, First_Name__c FROM User_AdVertIn__c WHERE First_Name__c=:username LIMIT 1];
        if (!userList.isEmpty()) {
            User_AdVertIn__c user = userList[0];
            if(user.First_Name__c.equals(username) ){
                
                system.debug('username and password is right');
                accountId = user.Id;
                PageReference homepage = new PageReference('/apex/UserHomepage');
                homepage.getParameters().put('accountId', accountId);
                return homepage;
            }
            else{
                system.debug('username and password doesnt match');
                return null;
            }
        } else {
            String errorMessage = 'Username and password do not match.';
            String alertScript = 'showAlert(\'' + errorMessage + '\');';
            ApexPages.currentPage().getParameters().put('alertScript', alertScript);
            return null;
            //system.debug('No record found');
        }
    } 
    
    public PageReference registerUser() {
        
        if (true) {
            
            System.debug('pw match');
            User_AdVertIn__c newUser = new User_AdVertIn__c();
            newUser.First_Name__c = username;
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
                accountId = newUser.Id;
                System.debug('inside try ');
                system.debug('accountId is: ' +accountId);
                System.debug('Name: ' + userAdVertIn.First_Name__c);
                System.debug('Last Name: ' + userAdVertIn.Last_Name__c);
                System.debug('country: ' + userAdVertIn.Country__c);
                System.debug('secuity question: ' + userAdVertIn.Secret_Question__c);
                
                PageReference nextPage = new PageReference('/apex/UserHomepage');
                nextPage.getParameters().put('accountId', accountId);
                return nextPage;
            }
            catch(exception e){
                system.debug('the error is: ' +e);
                return null;
            }
        } else {
            System.debug('inside else');
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Password and Confirm Password do not match.'));
            return null;
        }
    }
}