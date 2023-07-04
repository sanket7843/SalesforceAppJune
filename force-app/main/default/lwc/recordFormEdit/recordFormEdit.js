import { LightningElement,api } from 'lwc';

export default class RecordFormEdit extends LightningElement {
    @api recordId;
    handleSubmit(event) {
        console.log('submitted successfully ' + event.detail.fields);
    }
    handleSuccess(event) {
        console.log('hanldeSuccess handeled successfully ' + event.detail.id);
    }
}