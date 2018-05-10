public class AuraExample1 {
    public static string Name{set;get;}
    //Comment testing merge4
    public AuraExample1(){Name='Name assigned by Constructor';}

    //Comment testing merge4
    @AuraEnabled
    //Comment testing merge4
    public static string getName(){Name='My Name'; return Name;}
    //Comment testing merge4
    //Comment testing merge4
}