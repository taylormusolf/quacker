import * as APIUtil from "../util/api_util";

export const ADD_POST = "ADD_POST";
export const ADD_POSTS = "ADD_POSTS";

export const receivePost = (post) => {
  return {
    type: ADD_POST,
    post,
  };
};

export const receivePosts = (posts) => {
  // if we used "payload" instead of "{quackers, user}"
  // const {quackers, user} = payload // would also create variables quackers and user with the correct values
  // destructuring in js
  return {
    type: ADD_POSTS,
    posts,
  };
};

//thunk action creators
export const fetchPosts = () => {
  return (dispatch) => {
    return APIUtil.fetchPosts().then((posts) => {
      
      return dispatch(receivePosts(posts));
    });
  };
};

export const fetchUserPosts = (id) => {
  return (dispatch) => {
    return APIUtil.fetchUserPosts(id).then((posts) => {
      return dispatch(receivePosts(posts));
    });
  };
};

export const createPost = (post) => {
  return (dispatch) => {
    
    return APIUtil.createPost(post).then((newPost) => {
      return dispatch(receivePost(newPost));
    });
  };
};