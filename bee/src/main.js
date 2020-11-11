import App from "./App.vue";
import One from "./components/One";
import Property from "./components/Property";
import Search from "./components/Search";
import Vue from "vue";
import VueRouter from "vue-router";
import Vuex from "vuex";

Vue.config.productionTip = false;
Vue.use(Vuex);
Vue.use(VueRouter);


const router = new VueRouter({
  mode: "history",
  base: __dirname,
  routes: [
    { path: "/amlak", component: One },
    { path: "/search", component: Search },
    { path: "/manage", component: Property },
  ],
});

const store = new Vuex.Store({
  state: {
    user: null,
    auth: null,
    properties: null
  },
  mutations: {
    setUser(state, user) {
      state.user = JSON.parse(user);
    },
    setProperties(state, data){
      state.properties = data;
    }
  },
  actions: {
    // async getFiles() {
    //     // return fetch(API_FUNCTION_GET_FILES)
    //     //     .then((result) => result.json())
    //     //     .then((files) => {
    //     //         this.commit('setFiles', files)
    //     //     });
    // },
    // async updateFiles() {
    //     await fetch(API_FUNCTION_UPDATE_FILES)
    //     return store.dispatch('getFiles')
    // }
  },
  getters: {
    user: (state) => {
      return state.user;
    },
    properties: (state) => {
      return state.properties;
    }
  },
});

new Vue({
  store,
  router,
  render: (h) =>
    h(App, {
      props: {
        user: document.querySelector("#app").dataset.initialValue,
      },
    }),
}).$mount("#app");
