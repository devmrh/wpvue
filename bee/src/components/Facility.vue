<template>
  <div class="row main-row">
    <div class="col-md-2">
      <Panel></Panel>
    </div>
    <div class="col-md-10" v-if="allow">
      <div class="cc-title">
        <div>مدیریت امکانات</div>
        <div class="add-new">
          <div class="ml-2">افزودن جدید</div>
          <div>
            <input
              style="width: 300px"
              type="type"
              placeholder="عنوان امکانات جدید را وارد و اینتر بزنید"
              class="form-control"
              v-model="facility"
              v-on:keyup.enter="addNew"
            />
          </div>
        </div>
      </div>

      <div class="cc">
        <table class="table my-4">
          <thead>
            <tr>
              <th>شناسه</th>
              <th>عنوان</th>
            </tr>
          </thead>
          <tbody>
            <template v-for="(item, index) in facilities">
              <FacilityItem :key="index" :item="item"></FacilityItem>
            </template>
          </tbody>
        </table>
      </div>
    </div>
    <div class="col-md-10" v-if="!allow">
      <div class="err">شما دسترسی کافی برای مشاهده این صفحه را ندارید</div>
    </div>
  </div>
</template>

<style  scoped>
* {
  font-family: "Irs";
  font-size: 14px;
}
.add-new {
  display: flex;
  align-items: center;
  justify-content: start;
  margin-right: 10px;
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
import api from "../services/api";
import FacilityItem from "./FacilityItem";
import Panel from "./Panel";
import { mapState } from "vuex";

export default {
  data() {
    return {
      facilities: [],
      facility: "",
      allow: null,
    };
  },
  mounted() {
    this.allow = this.check();
    if (!this.allow) return false;
    this.getFacility();
  },
  components: { FacilityItem, Panel },
  methods: {
    addNew() {
      if (this.facility.trim() != "") {
        api
          .post("api/v1/data/add-facility", { facility: this.facility })
          .then((res) => {
            this.facilities.push(res.data.facility);
            this.facility = "";
          })
          .catch((e) => console.log(e));
      }
    },
    async getFacility() {
      await api
        .get("api/v1/data/get-facilities")
        .then((res) => {
          this.facilities = res.data.facilities;
        })
        .catch((e) => console.log(e));
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
  },
  created() {
    Event.$on("update-facility", (data) => {
      let newState = this.facilities.map((item) =>
        item.id === data.id ? { id: data.id, name: data.facility } : item
      );
      this.facilities = newState;
    });
    Event.$on("delete-facility", (data) => {
      let newState = this.facilities.filter((u) => u.id !== data.id);
      this.facilities = newState;
    });
  },
  computed: {
    ...mapState({
      roles: (state) => state.user && state.user.roles,
    }),
  },
};
</script>