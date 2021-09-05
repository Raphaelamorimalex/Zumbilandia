trigger CriaturaTrigger on Criatura__c (after insert, after update, after delete) 
{
    Map<id,Bunker__C> bunkerUpdateMap = new Map<id,Bunker__c>();
    
    for(Criatura__c cr: trigger.new){
        Criatura__c nova = cr;
        Criatura__c antiga = trigger.oldMap.get(nova.id);
        if(nova.Bunker__c != antiga.Bunker__c){
            bunkerUpdateMap.put(cr.Bunker__c, new Bunker__c(id = cr.Bunker__c));
        }
    }
    for(Criatura__c cr : trigger.old){
        if(trigger.isDelete && cr.Bunker__c != null){
            bunkerUpdateMap.put(cr.Bunker__c, new Bunker__c(id = cr.Bunker__c));
        }
    }
    List<Bunker__c> bkList = [select id, (Select id from Criaturas__r) from Bunker__c where id in : bunkerUpdateMap.keySet()];
    for(Bunker__c bk : bkList){
        bunkerUpdateMap.get(bk.id).Populacao__c = bk.Criaturas__r.size();
    }
    
    update bunkerUpdateMap.values();
}