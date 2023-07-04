import { LightningElement, wire } from 'lwc';
import getAccountsByEmployeeNumber from '@salesforce/apex/getAccountsList.getAccountsByEmployeeNumber';

export default class LWC2006 extends LightningElement {

numberOfEmployees = null;

 handleChange(event) {
    this.numberOfEmployees = event.detail.value;
}

    reset() { 
        this.numberOfEmployees = null;
    }

    @wire(getAccountsByEmployeeNumber, { numberOfEmployees: '$numberOfEmployees' })
    accounts;

}