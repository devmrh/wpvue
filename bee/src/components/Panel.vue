<template>
  <div class="container">
    <div class="control-box shadow-sm">
      <div>
        <button class="btn btn-primary btn-lg btn-block mb-3 cus-btn">
          <router-link to="/search" class="text-white">صفحه جستجو</router-link>

        </button>
      </div>
      <div>
        <button class="btn btn-primary btn-lg btn-block cus-btn">
            <router-link to="/manage" class="text-white">مدیریت</router-link>
        </button>
      </div>
      <div>
        <button class="btn btn-primary btn-lg btn-block mt-3 cus-btn">
            <router-link to="/amlak" class="text-white">افزودن ملک</router-link>
        </button>
      </div>
      <div>
        <button class="btn btn-primary btn-lg btn-block mt-3 cus-btn">
            <router-link to="/category" class="text-white">مدیریت دسته ها</router-link>
        </button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
};
</script>

<style scoped>
* {
  font-family: "Irs";
}
.cus-btn {
  height: 55px;
}
.control-box {
  display: flex;
  flex-flow: column;
  justify-content: center;
  background: #fff;
  border: 1px solid #eee;
  text-align: center;
  width: 100%;
  margin-bottom: 10px;
  padding: 10px;
}
</style>