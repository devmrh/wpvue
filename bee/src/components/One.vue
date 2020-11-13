<template>
  <div class="row main-row">
    <div class="col-md-2">
      <Panel></Panel>
    </div>
    <div class="col-md-10">
      <div v-if="check">
        <Form />
      </div>
      <div class="err" v-else>شما دسترسی کافی برای افزودن ملک ندارید</div>
    </div>
  </div>
</template>

<style  scoped>
.err {
  text-align: center;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #7b1b1b;
  font-size: 15px;
  font-weight: bold;
}
</style>
<script>
import Form from "./Form.vue";
import Panel from "./Panel";
import { mapState } from "vuex";

export default {
  data() {
    return {
      allow: null,
    };
  },
  props: [],
  components: {
    Form,
    Panel,
  },
  methods: {
    findOne(haystack, arr) {
      return arr.some(function (v) {
        return haystack.indexOf(v) >= 0;
      });
    },

  },
  mounted() {
   // this.allow = this.check();
   // if (!this.allow) return false;
  },
  computed: {
    ...mapState({
      user: (state) => state.user,
      roles: (state) => state.user && state.user.roles,
    }),
    check() {
      if(this.roles){

        if (!this.findOne(this.roles, ["ml-author", "administrator"])) {
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