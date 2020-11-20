import App from "./App.vue";
import Category from "./components/Category";
import Document from "./components/Document";
import EditForm from "./components/EditForm";
import Error from './components/Error';
import Facility from './components/Facility';
import Feature from './components/Feature';
import Neighborhood from "./components/Neighborhood";
import One from "./components/One";
import PDatePicker from 'vue2-persian-datepicker'
import Property from "./components/Property";
import Search from "./components/Search";
import SellType from './components/SellType';
import Vue from "vue";
import VueRouter from "vue-router";
import Vuex from "vuex";
Vue.config.productionTip = false;
Vue.use(Vuex);
Vue.use(VueRouter);
//window.moment = moment();
window.moment = require('moment-jalaali')
//moment().format('jYYYY/jM/jD')

Vue.component('pdatepicker', PDatePicker)
window.Event = new Vue();

const router = new VueRouter({
  mode: "history",
  base: __dirname,
  routes: [
    { path: "/amlak", component: One },
    { path: "/search", component: Search },
    { path: "/manage", component: Property },
    { path: "/edit-property/:id", component: EditForm },
    { path: '/error', component: Error },
    { path: '/category', component:  Category},
    { path: '/selltype', component:  SellType},
    { path: '/feature', component:  Feature},
    { path: '/facilities', component:  Facility},
    { path: '/neighborhoods', component: Neighborhood},
    { path: '/documents', component: Document}

  ],
});

const store = new Vuex.Store({
  state: {
    user: null,
    auth: null,
    properties: null,
    property: null
  },
  mutations: {
    setUser(state, user) {
      state.user = user;
    },
    setProperties(state, data){
      state.properties = data;
    },
    setProperty(state, data){
      state.property = data;
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
    },
    property: (state) => {
      return state.property;
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
