import { connect } from "react-redux";

import { createPost } from "../../actions/post_actions";
import PostForm from "./post_form";

const mapStateToProps = (state) => {
  return {};
};

const mapDispatchToProps = (dispatch) => {
  return {
    createPost: (body) => {
      dispatch(createPost(body));
    },
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(PostForm);