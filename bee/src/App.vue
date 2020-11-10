<template>
  <div class="main-row">
    <router-view class="view"></router-view>
  </div>
</template>

<script>

export default {
  name: "App",
  props: ["user"],
  mounted() {
    this.$store.commit("setUser", this.user);
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
