@RestResource(urlMapping= '/zumbilandia/humanos/*')
global class GetHumansIS {
    
    @HttpGet
    global static HumanosResponse doGet(){
        List<Criatura__c> criaturasToReturn = new List<Criatura__c>();
        String getReturn = 'Não Tem Humanos';
        String recursoParam = RestContext.request.params.get('recurso');
        String bunkerName = RestContext.request.params.get('bunker');
        
        String dynamicQuery = 'select Id, Name, Idade__c, Bunker__r.Name from Criatura__c WHERE RecordType.DeveloperName = \'Humano\'';
        if(!String.isBlank(bunkerName)){
            List<String> bunkers = bunkerName.split(',');
            dynamicQuery += 'and Bunker__r.Name IN :bunkers';
        }        
        criaturasToReturn = Database.query(dynamicQuery);
        
        List<Humano> humanos = new List<Humano>();
        
        for(Criatura__c criatura : criaturasToReturn){
            
            Bunker bunker = new Bunker();
            	bunker.nome = criatura.Bunker__r.Name; 
            
            Humano human = new Humano();
            human.name = criatura.Name;
            human.idade = String.valueOf(criatura.Idade__c);
            human.bunker = bunker;
            
            humanos.add(human);
        }
        HumanosResponse humanosResponse = new HumanosResponse();
        HumanosResponse.humanos = humanos;
        HumanosResponse.total = humanos.size();
        return HumanosResponse;
    }
    
    global class HumanosResponse{
        public List<Humano> humanos;
        public integer total;
    } 
    
    global class Humano{
        public String name;
        public String idade;
        public Bunker bunker;
    }
    
    global class Bunker{
        public String nome;
    }
}