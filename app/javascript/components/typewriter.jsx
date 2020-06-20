import React from "react";
import { Link } from "react-router-dom";
import Typist from 'react-typist'

class Typewriter extends React.Component {
    constructor(props){
        super(props)
        this.state = {
            text: ["This course is Full :(", "yeah I got a seat (:"],
            current: 0,
            next: 1
        }; 
    }

    textTyped = () => {
        let currstate = this.state
        let temp = currstate.current
        currstate.current = currstate.next
        currstate.next = temp
        this.setState({currstate})
        console.log("lol")
    }
    render(){
        return(
            <Typist>
  <h1 white-space="nowrap">F** {this.state.text[this.state.current]} </h1>
  <Typist.Backspace onTypingDone={this.texttyped} count={this.state.text[this.state.current].length} delay={200} />
  <h1> {this.state.text[this.state.next]} </h1>
</Typist>
        )
    }
}
export default  Typewriter; 