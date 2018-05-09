trigger Repository_on_Dress on Repository__c (after insert, after update) {
    list<ID> listDrIds = new list<ID>();
    map<ID,Dress__c> mapIdQnt = new map<ID,Dress__c>();
    list<Dress__c> updtDr = new list<Dress__c>();
    for(Repository__c rep: Trigger.new){
        if (rep.Quantity__c > 0) {
            listDrIds.add(rep.Dress__c);
            Dress__c drs = new Dress__c();
            drs.id = rep.Dress__c;
            drs.Repository__c = rep.Quantity__c;
            if (mapIdQnt.size() > 0) {
                if (mapIdQnt.get(rep.Dress__c) != null) {
                    mapIdQnt.get(rep.Dress__c).Repository__c = mapIdQnt.get(rep.Dress__c).Repository__c + rep.Quantity__c;
                }
                else mapIdQnt.put(rep.Dress__c,drs);
            }
            else mapIdQnt.put(rep.Dress__c,drs);
        }
    }
    
    map<ID,Repository__c> mapIdQntOld = new map<ID,Repository__c>();
    if(Trigger.isUpdate){
    for(Repository__c rep: Trigger.old){
        if (rep.Quantity__c > 0) {
            Repository__c reps = new Repository__c();
            reps.id = rep.dress__c;
            reps.Quantity__c = rep.Quantity__c;
            if (mapIdQntOld.size() > 0) {
                if (mapIdQntOld.get(rep.Dress__c) != null) {
                    mapIdQntOld.get(rep.Dress__c).Quantity__c = mapIdQntOld.get(rep.Dress__c).Quantity__c + rep.Quantity__c;
                }
            }
            else mapIdQntOld.put(rep.Dress__c,reps);
        }
    }
    }
        
    list<Dress__c> drs = [select id, Repository__c from Dress__c where id in :listDrIds];
    if(drs.size() > 0) {
        for(Dress__c dr: drs){
            if(Trigger.isInsert && Trigger.isAfter) {
            dr.Repository__c = dr.Repository__c + mapIdQnt.get(dr.id).Repository__c;
        }
        else if(Trigger.isUpdate && Trigger.isAfter){
            dr.Repository__c = dr.Repository__c + mapIdQnt.get(dr.id).Repository__c - mapIdQntOld.get(dr.id).Quantity__c;
        }
        updtDr.add(dr);
        }
        update updtDr;
    }
}