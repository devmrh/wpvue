<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
  </div>
</template>

<script>

import axios from 'axios'

export default {
  name: "HelloWorld",
  props: {
    msg: String,
  },
  mounted() {
    axios
      .get("http://wp.com/wp-json/api/v1/product")
      .then((response) => {
        console.log(response.data);
      })
      .catch((error) => console.log(error));
  },
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
</style>
