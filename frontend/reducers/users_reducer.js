import { ADD_POST, ADD_POSTS } from "../actions/post_actions";

const usersReducer = (state = {}, action) => {
  Object.freeze(state);
  switch (action.type) {
    case ADD_POST:
      return Object.assign({}, state, action.user);
    case ADD_POSTS:
      return Object.assign({}, state, action.user);
    default:
      return state;
  }
};

export default usersReducer;