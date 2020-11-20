<template>
  <div class="row main-row">
    <div class="col-md-12">
      <div class="cc-title">نتیجه جستجو</div>

      <div v-if="status == 'all'" class="cc">
        <button
          type="button"
          @click="$emit('clicked', 'search')"
          class="btn btn-warning btn-lg btn-block mt-3 cus-btn"
        >
          بستن
        </button>
        <table class="table my-4">
          <thead>
            <tr>
              <th>ID</th>
              <th>عنوان</th>
              <th>مالک</th>
              <th>آدرس</th>
              <th>بیشتر</th>
            </tr>
          </thead>
          <tbody v-if="sdata">
            <tr v-for="(item, index) in sdata" :key="index">
              <td>
                <div class="text-center">{{ item.id }}</div>
              </td>
              <td>
                <div class="text-center">
                  <a class="font-weight-bold" @click="setSingleData(item)">{{
                    item.title
                  }}</a>
                </div>
              </td>
              <td>
                <div class="text-center">{{ item.owner }}</div>
              </td>
              <td>
                <div class="text-center">{{ item.address }}</div>
              </td>
              <td>
                <div class="d-flex">
                  <a class="font-weight-bold" @click="setSingleData(item)"
                    >مشاهده</a
                  >

                    <router-link
                      :to="'/edit-property/' + item.id"
                      class="text-warning mr-3"
                      >ویرایش</router-link
                    >


                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      <div v-if="status == 'single'">
        <ShowSingle
          v-if="singledata"
          :singleform="singledata"
          @clicked="childEvent"
        >
        </ShowSingle>
      </div>
    </div>
  </div>
</template>

<style  scoped>
* {
  font-family: "Irs";
  font-size: 14px;
}
.cc-title {
  text-align: center;
  background: white;
  margin-bottom: 2px;
  padding: 20px 0;
  font-size: 20px;
  font-weight: bold;
  display: block;
}
.cc {
  font-family: "Irs";
  direction: rtl;
  text-align: right;
  min-width: 50%;
  padding: 20px;
  background: #ffffff;
  border: 1px solid #eee;
}
.distinct {
  background: #f7f7f7;
  padding: 5px;
}
input,
select {
  font-size: 15px !important;
}
table tbody tr td > div {
  text-align: right !important;
}
table thead tr th {
  font-size: 15px;
}
</style>
<script>
import ShowSingle from "./ShowSingle";

export default {
  data() {
    return {
      singledata: null,
      status: "all",
    };
  },
  props: ["sdata"],
  components: { ShowSingle },
  mounted() {},
  methods: {
    setSingleData(item) {
      this.singledata = item;
      this.status = "single";
    },
    childEvent(value) {
      this.status = value;
    },
  },
};
</script>