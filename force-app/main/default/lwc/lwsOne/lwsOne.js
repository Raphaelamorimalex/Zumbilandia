import { LightningElement, api, wire} from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';

import NAME_FIELD from '@salesforce/schema/Bunker__c.Name';

const FIELDS = [
    'Bunker__c.Name'

]

export default class LwsOne extends LightningElement {
    
    @api recordId;

    something = 'WELCOME!!!';
    
    @wire( getRecord, { recordId  : '$recordId', fields : [NAME_FIELD] } ) bunker;

    get name(){
        return getFieldValue(this.bunker.data, NAME_FIELD);
    }

}