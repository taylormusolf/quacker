import { ADD_POST, ADD_POSTS } from "../actions/post_actions";

const postsReducer = (state = {}, action) => {
  
  Object.freeze(state);
  switch (action.type) {
    case ADD_POST:
      
      const newPost = action.post;
      return Object.assign({}, state, {
        [newPost.id]: newPost,
      });
    case ADD_POSTS:
      return action.posts
      
    default:
      return state;
  }
};

export default postsReducer;