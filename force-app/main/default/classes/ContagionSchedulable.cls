global class ContagionSchedulable implements Schedulable {
    
    global void execute(SchedulableContext SC){
        this.contagiar();
    }
    private void contagiar(){
        List<Criatura__c> humanList = [SELECT id,Criatura__c.RecordTypeId,Bunker__r.DefesaBunker__c,Bunker__c,(SELECT id,AcrescimoDefesa__c from RecursosCriatura__r) FROM Criatura__c where recordtypeId = '0125e000000usKzAAI'];
        List<Criatura__c> zombieList = [SELECT id FROM Criatura__c where recordtypeId = '0125e000000usL9AAI'];
        
        for(Criatura__C zb : zombieList){
            if(humanList.size() == 0) break;
            Criatura__c human1 = humanList.get(Math.mod(Integer.valueOf(Math.random()*1000), humanList.size()));
            Decimal defesa = 0;
            if(human1.recordtypeId != '0125e000000usL9AAI'){
                if(human1.Bunker__c != null){
                    defesa += human1.Bunker__r.DefesaBunker__c;
                }
                if(human1.RecursosCriatura__r != null){
                    for(Recurso_da_Criatura__c recCri: human1.RecursosCriatura__r){
                        defesa += recCri.AcrescimoDefesa__c;
                    }
                }
            }
            Integer DiceRoll = Math.mod(Integer.valueOf(Math.random()*100000),100)+1;
            if(DiceRoll > defesa){
                human1.recordtypeId = '0125e000000usL9AAI';
            	human1.Data_de_Zombiefica_o__c = Date.today();
            }
            
            
            Criatura__c human2 = humanList.get(Math.mod(Integer.valueOf(Math.random()*1000), humanList.size()));
            defesa = 0;
            if(human2.recordtypeId != '0125e000000usL9AAI'){
                if(human2.Bunker__c != null){
                    defesa += human2.Bunker__r.DefesaBunker__c;
                }
                if(human2.RecursosCriatura__r != null){
                    for(Recurso_da_Criatura__c recCri: human2.RecursosCriatura__r){
                        defesa += recCri.AcrescimoDefesa__c;
                    }
                }
            }
            DiceRoll = Math.mod(Integer.valueOf(Math.random()*100000),100)+1;
            if(DiceRoll > defesa){
                human2.RecordTypeId = '0125e000000usL9AAI';
            	human2.Data_de_Zombiefica_o__c = Date.today();
            }
            
        }
        update humanList;
    }
}