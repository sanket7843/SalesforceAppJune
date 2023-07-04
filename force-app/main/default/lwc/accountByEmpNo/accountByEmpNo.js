import { LightningElement, wire } from 'lwc';
import getAccountsByEmployeeNumber from '@salesforce/apex/GetAccountWithEmpNo.getAccountsByEmployeeNumber';

export default class AccountByEmpNo extends LightningElement {

    noOfEmp = null;

    numberChange(event) {
        this.noOfEmp = event.detail.value;
    }

    reset() {
        this.noOfEmp = null;
    }

    @wire(getAccountsByEmployeeNumber, { noOfEmp: '$noOfEmp' })
    accounts;

}