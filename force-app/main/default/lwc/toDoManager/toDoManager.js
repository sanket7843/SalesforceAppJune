import { LightningElement, track } from 'lwc';
import addTodo from "@salesforce/apex/ToDoController.addTodo";
import getCurrentTodos from "@salesforce/apex/ToDoController.getCurrentTodos";
export default class ToDoManager extends LightningElement {
    @track time = "8:15pm";
    @track greeting = "";

    @track todos = [];
    
    connectedCallback() {
        this.getTime();
        //this.populateTodos();
        this.fetchTodos();

        setInterval(() => { 
            this.getTime();
        },6000 )
    }

    getTime() {
        const date = new Date();
        const hour = date.getHours();
        const min = date.getMinutes();

        this.time = `${this.getHour(hour)}:${this.getDoubleDigit(min)} ${this.getMidDay(hour)}`;
        this.setGreeting(hour);
    }

    getHour(hour) {
        return hour === 0 ? 12 : hour > 12 ? (hour - 12) : hour;
    }

    getMidDay(hour) {
        return hour <= 12 ? "AM" : "PM";
    }

    getDoubleDigit(min) {
        return min < 10? "0" + min : min;
    }

    setGreeting(hour) {
        if (hour < 12) {
            this.greeting = "Good Morning"
        } else if (hour >= 12 && hour <= 4) {
            this.greeting = "Good Afternoon"
        }
        else {
            this.greeting = "Good Evening"
        }        
    }

    addTodoHandler() {
        const inputBox = this.template.querySelector("lightning-input");
        console.log('Current Value Is: ' + inputBox.value);

        const todo = {
            todoName: inputBox.value,
            done: false,
        }

        addTodo({ payload: JSON.stringify(todo) }).then(response => {
            console.log('Data Inserted')
            this.fetchTodos();
        }).catch(error=> {
            console.log('Got Error' +error)
        }) 
        inputBox.value = '';
    }

    get completedTask() {
        return this.todos && this.todos.length
            ? this.todos.filter(todo => (todo.done))
            : [];
    }
    get upcomingTask() {
        return this.todos && this.todos.length
            ? this.todos.filter(todo => (!todo.done))
            : [];
    }
    
    populateTodos() {
        const todos = [
            {
                todoId: 0,
                todoName: "Feed the dog",
                done: false,
                todoDate: new Date()
            },
            {
                todoId: 1,
                todoName: "Feed the cat",
                done: false,
                todoDate: new Date()
            },
            {
                todoId: 2,
                todoName: "Feed the lion",
                done: true,
                todoDate: new Date()
            },
        ];
        this.todos = todos;
    }

    fetchTodos() {
        getCurrentTodos().then(result => {
                console.log('data is:' + result.length);
                this.todos = result;
        }).catch(error => {
            console.log('got error: ' + error);
        })
    }
    updateHandler() {
        this.fetchTodos();
    }
    deleteHandler() {
        this.fetchTodos();
    }
}