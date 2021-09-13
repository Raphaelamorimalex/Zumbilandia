import { LightningElement, api } from 'lwc';

import getHerois from '@salesforce/apex/CalloutToSalesforce.getHeroisBootcamp3';

const columns = [
    {label: 'Name Hero', fieldName: 'nome' },
    {label: 'Nível Hero', fieldName: 'nivel' },
    {label: 'Total de Habilidades', fieldName: 'total', type: 'number' }
];


export default class LwcChild extends LightningElement {

    @api dados = [];
    columns = columns;

}