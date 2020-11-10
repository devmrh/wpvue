<template>
    <Form :authuser="user"/>
</template>

<script>
import Form from './components/Form.vue'

export default {
  name: 'App',
  props: ['user'],
  components: {
    Form
  }
}
</script>

<style>
#app {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
  direction: rtl;
  text-align: right;
}
</style>
