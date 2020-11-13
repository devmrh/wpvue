<template>
  <div class="main-row" v-if="check">
    <router-view class="view"></router-view>
  </div>
</template>

<script>
import { mapState } from "vuex";

export default {
  name: "App",
  props: ["user"],
  methods: {
    findOne(haystack, arr) {
      return arr.some(function (v) {
        return haystack.indexOf(v) >= 0;
      });
    },
  },
  mounted() {
    this.$store.commit("setUser", JSON.parse(this.user));
    // if (!this.check) {
    //   return this.$router.push("/error");
    // }
  },
  computed: {
    ...mapState({
      roles: (state) => state.user && state.user.roles,
    }),
    check() {
      if (this.roles) {
        if (
          !this.findOne(this.roles, [
            "ml-author",
            "ml-editor",
            "ml-adviser",
            "administrator",
          ])
        ) {
          // return this.$router.push("/error");
          return false;
        }
        return true;
      }
      return false;
    },
  },
};
</script>

<style>
.main-row {
  max-width: unset !important;
  direction: rtl;
}
#app {
  font-family: "Irs", Helvetica, Arial;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
  direction: rtl;
  text-align: right;
}
</style>
