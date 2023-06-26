public with sharing class listStandard {
    
    public string student{get;set;}
    Public List<String> studentList{get;set;}
    
    public listStandard(){
        
        studentList = new List<string>();
        studentList.add('a');
        studentList.add('b');
        studentList.add('c');
        
        student = 'pqr';
    }
    
    public void studentlists(){
        studentList.add('d');
        student='stu';
    }

}