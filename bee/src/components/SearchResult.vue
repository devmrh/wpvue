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
              <th>شماره تماس</th>
              <th>آدرس</th>
              <th>بیشتر</th>
            </tr>
          </thead>
          <tbody v-if="sdata">
            <tr v-for="(item, index) in searchdata" :key="index">
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
                <div class="text-center">{{ item.phone }}</div>
              </td>
              <td>
                <div class="text-center">{{ item.address }}</div>
              </td>
              <td>
                <div class="d-flex">
                  <a
                    class="font-weight-bold text-success"
                    @click="setSingleData(item)"
                    >مشاهده</a
                  >

                  <router-link
                    v-if="isEditor()"
                    :to="'/edit-property/' + item.id"
                    class="text-warning mr-3"
                    >ویرایش</router-link
                  >

                  <button
                    v-if="allowDel"
                    class="btn btn-danger mr-3"
                    @click="deleteProperty(item.id)"
                  >
                    حذف
                  </button>
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
import api from "../services/api";
import { mapState } from "vuex";

export default {
  data() {
    return {
      singledata: null,
      searchdata: null,
      status: "all",
      allowDel: false,
    };
  },
  props: ["sdata"],
  components: { ShowSingle },
  mounted() {
    this.searchdata = this.sdata;
    this.allowDel = this.check();
  },
  methods: {
    setSingleData(item) {
      this.singledata = item;
      this.status = "single";
    },
    deleteProperty(id) {
      if (confirm("آیا مطمن هستید؟!")) {
        api
          .post("api/v1/data/delete-property", {
            id,
          })
          .then(() => {
            this.searchdata = this.searchdata.filter((el) => el.id != id);
            this.propdata.data = this.propdata.data.filter((el) => el.id != id);
          })
          .catch((e) => {
            this.err = e;
          });
      }
    },
    childEvent(value) {
      this.status = value;
    },
    findOne(haystack, arr) {
      return arr.some(function (v) {
        return haystack.indexOf(v) >= 0;
      });
    },
    check() {
      if (!this.findOne(this.roles, ["administrator"])) {
        // return this.$router.push("/error");
        return false;
      }
      return true;
    },
    isEditor() {
      if (!this.findOne(this.roles, ["ml-editor", "administrator"])) {
        // return this.$router.push("/error");
        return false;
      }
      return true;
    },
    isAuthor() {
      if (!this.findOne(this.roles, ["ml-author", "administrator"])) {
        // return this.$router.push("/error");
        return false;
      }
      return true;
    },
  },
  computed: {
    ...mapState({
      propdata: (state) => state.properties,
      roles: (state) => state.user && state.user.roles,
    }),
  },
};
</script>