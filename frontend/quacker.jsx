import React from "react";
import ReactDOM from "react-dom";
import configureStore from "./store/store";

import App from "./components/app";

document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  const root = document.getElementById("root");
  ReactDOM.render(<App store={store} />, root);
});