public class JqueryAuto {
    public List<Account> getAccs(){
        List<Account> accs=[select name from Account];
        return accs;
    }
}