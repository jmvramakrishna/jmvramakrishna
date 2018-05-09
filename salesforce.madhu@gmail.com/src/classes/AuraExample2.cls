public class AuraExample2 {
    @AuraEnabled
    public static list<Account> getAccounts(){
        return [select id, Name, Industry, Phone from Account];
    }
}