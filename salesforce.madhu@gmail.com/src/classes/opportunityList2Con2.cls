public class opportunityList2Con2 {
    // ApexPages.StandardSetController must be instantiated
    // for standard list controllers
    public ApexPages.StandardSetController setCon {
        get {
            if(setCon == null) {
                setCon = new ApexPages.StandardSetController(Database.getQueryLocator(
                    [SELECT Name, Id, CreatedDate FROM Account]));
            }
            return setCon;
        }
        set;
    }

    // Initialize setCon and return a list of records
    public List<Account> getAccount() {
        return (List<Account>) setCon.getRecords();
    }
}