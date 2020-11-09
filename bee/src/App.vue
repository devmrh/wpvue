<template>
    <Form msg="Welcome to Your Vue.js App"/>
</template>

<script>
import Form from './components/Form.vue'

export default {
  name: 'App',
  props: ['users'],
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
