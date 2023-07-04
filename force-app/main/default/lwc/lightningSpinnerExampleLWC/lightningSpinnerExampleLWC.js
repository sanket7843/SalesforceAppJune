import { LightningElement, api } from 'lwc';

export default class LightningSpinnerExampleLWC extends LightningElement {
    @api isLoaded = false;
    handleClick() {
        this.isLoaded = !this.isLoaded;
    }
}