import { LightningElement, wire } from 'lwc';
import getAccountByEmployee from '@salesforce/apex/getAccountsList.getAccountByEmployee';

export default class LWC2006 extends LightningElement {

    greeting = 'Coder';
    numberOfEmployee = null; 

    changeHandler(event) { 
        this.greeting = event.target.value;
    }

    changenoe(event) { 
        this.numberOfEmployee = event.target.value;
    }

    reset(event) { 
        this.numberOfEmployee = null;
    }

    @wire(getAccountByEmployee, { noe: '$numberOfEmployee' })
    accounts;

}