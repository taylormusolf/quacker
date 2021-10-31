import React from "react";
import { Provider } from "react-redux";

import PostFormContainer from "./posts/post_form_container";
import PostIndexContainer from "./posts/post_index_container";

const App = ({ store }) => {
  return (
    <Provider store={store}>
      <div className="quacker-content">
        <div className="logo">
          <h1>Quacker</h1>
        </div>
        <PostFormContainer />
        <PostIndexContainer />
      </div>
    </Provider>
  );
};
export default App;