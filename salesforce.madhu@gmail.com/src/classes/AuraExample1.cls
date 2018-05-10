public class AuraExample1 {
    public static string Name{set;get;}
    //Comment testing merge3
    public AuraExample1(){Name='Name assigned by Constructor';}

    //Comment testing merge3
    @AuraEnabled
    //Comment testing merge3
    public static string getName(){Name='My Name'; return Name;}
    //Comment testing merge3
    //Comment testing merge3
}