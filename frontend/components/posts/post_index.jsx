import React from "react";

class PostIndex extends React.Component {
  constructor(props) {
    super(props);
  }

  componentDidMount() {
    this.props.fetchPosts();
  }

  render() {
    if (this.props.posts.length == 0) {
      return <span>No quacks yet!</span>;
    }

    const postList = this.props.posts.map((post) => {
      return <li key={post.id}>{post.body}</li>;
    });

    return <ul className="quacks">{postList}</ul>;
  }
}

export default PostIndex;