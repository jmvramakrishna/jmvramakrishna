public class AuraExample2 {
	// testing list of comps
    @AuraEnabled
    public static list<Account> getAccounts(){
        return [select id, Name, Industry, Phone from Account];
    }
}