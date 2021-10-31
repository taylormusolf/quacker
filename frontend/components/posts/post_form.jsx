import React from "react";

class PostForm extends React.Component {
  constructor(props) {
    
    super(props);

    this.state = { body: "" };
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  update(field) {
    
    return (e) => {
      
      this.setState({ [field]: e.target.value });
    };
  }

  handleSubmit(e) {
    e.preventDefault();

    this.props.createPost(this.state);
    this.setState({ body: "" });
  }

  render() {
    return (
      <>
        <h2 className="new-post_header">Make a new post!</h2>

        <form className="new-post_form" onSubmit={this.handleSubmit}>
          <label htmlFor="post-body">Body</label>
          <input
            type="text"
            id="post-body"
            onChange={this.update("body")}
            value={this.state.body}
          />

          <button>Send it!</button>
        </form>
      </>
    );
  }
}
export default PostForm;