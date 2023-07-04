import { LightningElement, api } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import REVENUE_FIELD from '@salesforce/schema/Account.OwnerId';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Active__c'

export default class LightningRecordFormLWC extends LightningElement {
    @api recordId;
    @api objectApiName;
    fields = [REVENUE_FIELD, INDUSTRY_FIELD];
    handleSubmit(event) {
        console.log('Account Detail: ', JSON.stringify(event.detail.fields));
        console.log('Event Detail: ',  JSON.stringify(event.detail));
        console.log('Name Is: ', event.detail.fields);
    }
}