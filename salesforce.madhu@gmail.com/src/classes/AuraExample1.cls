public class AuraExample1 {
    public static string Name{set;get;}
    //Comment testing merge6
    public AuraExample1(){Name='Name assigned by Constructor';}

    //Comment testing merge6
    @AuraEnabled
    //Comment testing merge6
    public static string getName(){Name='My Name'; return Name;}
    //Comment testing merge6
    //Comment testing merge6
}