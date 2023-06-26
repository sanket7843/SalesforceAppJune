import { LightningElement, api } from 'lwc';

import updateTodo from "@salesforce/apex/ToDoController.updateTodo";
import deleteTodo from "@salesforce/apex/ToDoController.deleteTodo";

export default class toDoItem extends LightningElement {


    @api todoId;
    @api todoName;
    @api done = false;

    get containerClass() {
        return this.done ? "todo completed" : "todo upcoming";
    }

    get iconName() {
        return this.done ? "utility:check" : "utility:add"
    }

    updateHandler() {
        const todo = {
            todoId: this.todoId,
            todoName: this.todoName,
            done: !this.done
        }
        updateTodo({ payload: JSON.stringify(todo) }).then(result => { 
            console.log('item updated');
            const updateEvent = new CustomEvent('update', { detail: 'item updated' });
            this.dispatchEvent(updateEvent);
        }).catch(error => {
            console.error('got error: ',error)
        });
    }

    deleteHandler() {
        deleteTodo({ todoId: this.todoId }).then(result => {
            console.log('item deleted');
            const deleteEvent = new CustomEvent('delete', { detail: 'item deleted' });
            this.dispatchEvent(deleteEvent);

        }).catch(error => {
            console.error('got error', error);
        })
    }
}