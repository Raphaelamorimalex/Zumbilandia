public with sharing class FormularioNovasCriaturasController {
    
    public Criatura__c criatura {get;set;}

    public FormularioNovasCriaturasController() {
        id criaturaId = ApexPages.currentPage().getParameters().get('Id');
        this.criatura = [SELECT ID  FROM Criatura__c WHERE ID=: criaturaId];
    }

    public static void save(){

    }
}