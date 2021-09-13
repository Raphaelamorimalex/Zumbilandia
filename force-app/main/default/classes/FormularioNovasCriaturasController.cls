public without sharing class FormularioNovasCriaturasController {
    
    public Criatura__c criatura {get;set;}

    public FormularioNovasCriaturasController() {
        id criaturaId = ApexPages.currentPage().getParameters().get('id');
        this.criatura = [SELECT ID,Name FROM Criatura__c WHERE ID =: criaturaId];
    }

    public static void save(){

    }
}
