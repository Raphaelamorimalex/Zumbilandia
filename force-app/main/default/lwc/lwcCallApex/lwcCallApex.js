import { LightningElement, wire, api } from 'lwc';

import getHerois from '@salesforce/apex/CalloutToSalesforce.getHeroisBootcamp3';


export default class LwcCallApex extends LightningElement {
    @api herois = [];
    
    @wire(getHerois)
    wiredRecord({error, data}){
        if(data){
            console.log(data);
            this.herois = data.herois;

        /*    this.data.forEach(heroi => {
                console.log('nome :: ', heroi.nome);
                console.log('HeroiHabilidade :: ', heroi.habilidades.lenght);

                let totalHabilidades = heroi.habilidades.lenght;
                console.log('total:: ', totalHabilidades);
                heroi.total =  totalHabilidades;
            })*/
        }else
            console.log(error);
    }

    connectedCallback(){
        getHerois()
        .then(result => {
            this.herois = result.herois;
        })
        .catch(error =>{
            console.error(error);
        })
    }

}