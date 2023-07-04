import { LightningElement,api,wire,track } from 'lwc';
import getContactForAccount from '@salesforce/apex/getContactForAccount.getContactForAccount';
export default class ContactWithAccountId extends LightningElement {
    @api recordId;
    @wire(getContactForAccount, { accountId: '$recordId' })
    contacts;
    @track columns = [
        { label: 'Account Id', fieldName: 'AccountId', type: 'text', sortable: 'true' },
        { label: 'First Name', fieldName: 'FirstName', type: 'text', sortable: 'true' },
        { label: 'Last Name', fieldName: 'LastName', type: 'text', sortable: 'true' },
        { label: 'Email', fieldName: 'Email', type: 'text', sortable: 'true' }
    ];
}