import App from "./App.vue";
import Vue from "vue";

Vue.config.productionTip = false;

new Vue({
  render: (h) =>
    h(App, {
      props: {
        user: document.querySelector("#app").dataset.initialValue,
      },
    }),
}).$mount("#app");
