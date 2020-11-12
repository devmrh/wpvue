<template>
  <div class="row">
    <div class="col-md-2">
      <Panel></Panel>
    </div>
    <div class="col-md-10">
      <div
        v-if="showCondition == 'form'"
        class="shadow-sm rounded"
        style="margin: 0 50px"
      >
        <div class="cc-title">مدیریت ملک</div>
        <div class="cc">
          <table class="table my-4">
            <thead>
              <tr>
                <th>ID</th>
                <th>عنوان</th>
                <th>مالک</th>
                <th>آدرس</th>
                <th>ویرایش</th>
              </tr>
            </thead>
            <tbody v-if="propdata">
              <tr v-for="(item, index) in propdata.data" :key="index">
                <td>
                  <div class="text-center">{{ item.id }}</div>
                </td>
                <td>
                  <div class="text-center">{{ item.title }}</div>
                </td>
                <td>
                  <div class="text-center">{{ item.owner }}</div>
                </td>
                <td>
                  <div class="text-center">{{ item.address }}</div>
                </td>
                <td>
                  <div class="d-flex">
                    <button
                      class="btn btn-primary mx-2"
                      @click="editProperty(item)"
                    >
                      ویرایش
                    </button>
                    <button
                      class="btn btn-danger"
                      @click="deleteProperty(item.id)"
                    >
                      حذف
                    </button>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>

          <Pagination
            :toPage="topage"
            :fromPage="frompage"
            :currentPage="currentpage"
            :nextUrl="nexturl"
            :perPage="perpage"
            paginationUrl="api/v1/data/get-all-properties?page="
          ></Pagination>
          <div class="my-2 mx-3 font-weight-bold text-success" v-if="info">
            {{ info }}
          </div>
          <div class="my-2 mx-3 font-weight-bold text-danger" v-if="err">
            {{ err }}
          </div>
        </div>
      </div>
      <div v-if="showCondition == 'edit-form'">
        <EditForm @clicked="childEvent" :editform="editFormdata"></EditForm>
      </div>
    </div>
  </div>
</template>

<script>
import api from "../services/api";
import Pagination from "./Pagination";
import Panel from "./Panel";
import EditForm from "./EditForm";
import { mapState } from "vuex";

export default {
  data() {
    return {
      showCondition: "form",
      editFormdata: "",
      properties: {},
      topage: "",
      frompage: "",
      currentpage: "",
      nexturl: "",
      perpage: "",
      info: "",
      err: "",
    };
  },
  components: { Pagination, Panel, EditForm },
  methods: {
    editProperty(item) {
      this.showCondition = "edit-form";
      this.editFormdata = item;
    },
    deleteProperty(id) {
      if (confirm("آیا مطمن هستید؟!")) {
        api
          .post("api/v1/data/delete-property", {
            id,
          })
          .then((res) => {
            this.info = res.data;
            this.propdata.data = this.propdata.data.filter((el) => el.id != id);
          })
          .catch((e) => {
            this.err = e;
          });
      }
    },
    childEvent(value) {
      this.showCondition = value;
    },
    getPaginationData(e) {
      console.log(e);
    },
    async getResults(page = 1) {
      await api
        .get(`api/v1/data/get-all-properties?page=${page}`)
        .then((response) => {
          //this.laravelData = response.data;
          // this.$store.commit("users/setUsers", response.data);
          this.topage = response.data.to;
          this.frompage = response.data.from;
          this.currentpage = response.data.current_page;
          this.nexturl = response.data.next_page_url;
          this.perpage = response.data.per_page;
          this.$store.commit("setProperties", response.data);
        });
    },
  },
  mounted() {
    this.getResults();
    // api
    //   .get("api/v1/data/get-all-properties?page=1")
    //   .then((response) => {
    //     this.properties = response.data.data;
    //   })
    //   .catch((error) => console.log(error));
  },
  computed: {
    ...mapState({
      propdata: (state) => state.properties,
    }),
  },
};
</script>
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