<template>
  <div class="main-row">
    <router-view class="view"></router-view>
  </div>
</template>

<script>
export default {
  name: "App",
  props: ["user"],
  methods: {
    check() {
      if (this.roles) {
        if (
          !this.findOne(this.user.roles, [
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
  mounted() {
    this.$store.commit("setUser", this.user);
    if(!this.check()){
      return  this.$router.push("/error");
    }
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
