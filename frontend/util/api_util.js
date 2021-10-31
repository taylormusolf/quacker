export const fetchPosts = () => {
  return $.ajax({
    method: "GET",
    url: "/api/posts", //check rails routes
  });
};

export const fetchUserPosts = (id) => {
  
  return $.ajax({
    method: "GET",
    url: `/api/users/${id}`, //check rails routes
  });
};

export const createPost = (post) => {
  return $.ajax({
    method: "POST",
    url: "/api/posts",
    data: { post },
  });
};