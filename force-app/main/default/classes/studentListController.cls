public class studentListController{
    public string studentSingle {get;set;}
    public List<String> studentList {get;set;}
    
    public studentListController(){
        studentList = new List<String>();
        studentList.add('c');
        studentList.add('z');
        studentList.add('ar');
        
        studentSingle = ' club';
    }
    
    public void changeData(){
        studentList.add(' is best');
        
        studentSingle='Haha Changed';
    }
}