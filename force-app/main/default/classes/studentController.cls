public class studentController {
    
    public string student {get;set;}
    
    public studentController(){
        student = 'controller';
    }
    
    public void changeValue(){
        student = 'dyanmic';
    }

}