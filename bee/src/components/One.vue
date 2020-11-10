<template>
  <div class="row main-row">
    <div class="col-md-2">
      <Panel></Panel>
    </div>
    <div class="col-md-10">
      <Form :authuser="user" />
    </div>
  </div>
</template>

<style  scoped>
</style>
<script>
import Form from "./Form.vue";
import Panel from "./Panel";
export default {
  props: ["user"],
  components: {
    Form,
    Panel,
  },
};
</script>