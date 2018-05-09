trigger Dress on Dress__c (before insert) {
    for(Dress__c dr:trigger.new){
        if(dr.Color__c == 'red'){
            system.debug(dr);
        }
    }
}