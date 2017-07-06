import PropTypes from 'prop-types';
import React from 'react';

export default class HelloWorld extends React.Component {
  static propTypes = {
    name: PropTypes.string.isRequired, // this is passed from the Rails view
  };


  constructor(props, _railsContext) {
    super(props);

    // How to set initial state in ES6 class syntax
    // https://facebook.github.io/react/docs/reusable-components.html#es6-classes
    this.state = { terms: "" };
  }

  // updateName = (name) => {
  // his.setState({ name });
  // };



  render() {
	return (
		<div>
			<form >
	          <label htmlFor="name">
	            Say hello to:
	          </label>
	          <input
	            id="name"
	            type="text"
	            value={this.state.terms}
	            onChange={(e) => this.updateName(e.target.value)}
	          />
	        </form>
		</div>
	);
  }
}
