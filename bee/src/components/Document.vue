<template>
  <div class="row main-row" :class="{ mobileSnackBar: is_mobile }">
    <div class="col-md-2">
      <Panel></Panel>
    </div>
    <div class="col-md-10" v-if="allow">
      <div class="cc-title">
        <div>مدیریت نوع سند</div>
        <div class="add-new">
          <div class="ml-2">افزودن جدید</div>
          <div>
            <input
              style="width: 300px"
              type="type"
              placeholder="نوع جدید را وارد و اینتر بزنید"
              class="form-control"
              v-model="document"
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
            <template v-for="(item, index) in documents">
              <DocumentItem :key="index" :item="item"></DocumentItem>
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
.mobileSnackBar {
  flex-flow: column-reverse !important;
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
import DocumentItem from "./DocumentItem";
import Panel from "./Panel";
import { mapState } from "vuex";

export default {
  data() {
    return {
      documents: [],
      document: "",
      allow: null,
    };
  },
  mounted() {
    this.allow = this.check();
    if (!this.allow) return false;
    this.getdocument();
  },
  components: { DocumentItem, Panel },
  methods: {
    addNew() {
      if (this.document.trim() != "") {
        api
          .post("api/v1/data/add-document-type", { document: this.document })
          .then((res) => {
            this.documents.push(res.data.document);
            this.document = "";
          })
          .catch((e) => console.log(e));
      }
    },
    async getdocument() {
      await api
        .get("api/v1/data/get-document-types")
        .then((res) => {
          this.documents = res.data.documents;
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
    Event.$on("update-document", (data) => {
      let newState = this.documents.map((item) =>
        item.id === data.id ? { id: data.id, name: data.document } : item
      );
      this.documents = newState;
    });
    Event.$on("delete-document", (data) => {
      let newState = this.documents.filter((u) => u.id !== data.id);
      this.documents = newState;
    });
  },
  computed: {
    ...mapState({
      roles: (state) => state.user && state.user.roles,
    }),
    is_mobile() {
      const isMobile = window.matchMedia("only screen and (max-width: 760px)");
      return isMobile.matches ? true : false;
    },
  },
};
</script>