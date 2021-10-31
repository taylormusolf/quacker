import { connect } from "react-redux";
import PostIndex from "./post_index";
import { fetchPosts, fetchUserPosts } from "../../actions/post_actions";

const mapStateToProps = (state) => {
  
  return {
    posts: Object.values(state.entities.posts),
  };
};

const mapDispatchToProps = (dispatch) => {
  
  return {
    fetchPosts: () => {
      
      return dispatch(fetchPosts()); //thunk action creator from actions.js
    },
    fetchUserPosts: (id) => {
      
      return dispatch(fetchUserPosts(id)); //thunk action creator from actions.js
    },
  };
};
export default connect(mapStateToProps, mapDispatchToProps)(PostIndex);