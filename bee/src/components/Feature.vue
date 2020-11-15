<template>
  <div class="row main-row">
    <div class="col-md-2">
      <Panel></Panel>
    </div>
    <div class="col-md-10">
      <div class="cc-title">
        <div>مدیریت ویژگی ملک</div>
        <div class="add-new">
          <div class="ml-2">افزودن جدید</div>
          <div>
            <input
              style="width: 300px"
              type="type"
              placeholder="عنوان ویژگی جدید را وارد و اینتر بزنید"
              class="form-control"
              v-model="feature"
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
            <template v-for="(item, index) in features">
              <FeatureItem :key="index" :item="item"></FeatureItem>
            </template>
          </tbody>
        </table>
      </div>
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
import FeatureItem from "./FeatureItem";
import Panel from "./Panel";

export default {
  data() {
    return {
      features: [],
      feature: "",
    };
  },
  mounted() {
    this.getFeatures();
  },
  components: { FeatureItem, Panel },
  methods: {
    addNew() {
      if (this.feature.trim() != "") {
        api
          .post("api/v1/data/add-feature", { feature: this.feature })
          .then((res) => {
            this.features.push(res.data.feature);
            this.feature = "";
          })
          .catch((e) => console.log(e));
      }
    },
    async getFeatures() {
      await api
        .get("api/v1/data/get-features")
        .then((res) => {
          this.features = res.data.features;
        })
        .catch((e) => console.log(e));
    },
  },
  created() {
    Event.$on("update-feature", (data) => {
      let newState = this.features.map((item) =>
        item.id === data.id ? { id: data.id, name: data.feature } : item
      );
      this.features = newState;
    });
    Event.$on("delete-feature", (data) => {
      let newState = this.features.filter((u) => u.id !== data.id);
      this.features = newState;
    });
  },
};
</script>