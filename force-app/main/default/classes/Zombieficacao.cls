public class Zombieficacao {
	@InvocableMethod(label='Transforma Zombie')
    public static void Zumbificar(List<id> ids){
        List<Criatura__c> criList = [SELECT id, bunker__r.name, bunker__c,(SELECT id FROM RecursosCriatura__r) FROM Criatura__c WHERE id in:ids];
        List<Recurso_da_Criatura__c>  rcDeleteList = new List<Recurso_da_Criatura__c>();
        for(Criatura__c cr : criList){
            String tipoZumbi = '';
            integer rand = Math.mod(Integer.valueof(Math.random()*100000),100);
            if(rand < 50){
                tipoZumbi = 'Normal';
            }
            else if(rand < 80){
                tipoZumbi = 'Rápido';
            }
            else{
                tipoZumbi = 'Gordo';
            }
            cr.Tipo_Zombie__c = tipoZumbi;
            if(cr.RecursosCriatura__r != null)
                rcDeleteList.addall(cr.RecursosCriatura__r);
        }
        update criList;
        delete rcDeleteList;


    }
}