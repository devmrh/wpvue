<template>
  <div class="shadow-sm rounded" style="margin: 0 50px">
    <div class="err-form">
        <div>دسترسی کافی نیست</div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Form",
  data() {
    return {

    };
  },
  props: {

  },
  methods: {

  },
  mounted() {

  },

};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
* {
  font-family: "Irs" !important;
  font-size: 14px;
}
.err-form {
  font-family: "Irs";
  direction: rtl;
  text-align: right;
  min-width: 50%;
  padding: 20px;
  background: #ffffff;
  border: 1px solid #eee;
}

</style>
