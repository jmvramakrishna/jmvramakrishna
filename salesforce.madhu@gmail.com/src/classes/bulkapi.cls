public class bulkapi {
    public string uid {get;set;}
    public string pswd {get;set;}
    public string Result {get;set;}
    public boolean rs {get;set;}

    public bulkapi(){rs=false;}
    
    public pagereference submit(){
        string res = login();
        if(res == 'Login successfull') return (new PageReference('/apex/bulkapi2'));
        else {rs = true; return null;}

        //return (new PageReference('https://c.ap5.visual.force.com/apex/bulkapi2'));
    }
    
    public string login(){
        if (uid == 'abcd' && pswd == 'wxyz') Result = 'Login successfull';
        else Result = 'Please enter proper values';
        return Result;
    }
}