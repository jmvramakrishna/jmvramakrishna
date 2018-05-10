public class AuraExample1 {
    public static string Name{set;get;}
    //Comment testing merge7
    public AuraExample1(){Name='Name assigned by Constructor';}

    //Comment testing merge7
    @AuraEnabled
    //Comment testing merge7
    public static string getName(){Name='My Name'; return Name;}
    //Comment testing merge7
    //Comment testing merge7
}