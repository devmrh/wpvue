<template>
  <div class="row main-row">
    <div class="col-md-12">
      <div class="cc-title">
        <div>مدیریت نوع فروش ملک</div>
        <div class="add-new">
          <div class="ml-2">افزودن جدید</div>
          <div>
            <input
              style="width: 300px"
              type="type"
              placeholder="عنوان ویژگی جدید را وارد و اینتر بزنید"
              class="form-control"
              v-model="selltype"
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
            <template v-for="(item, index) in selltypes">
              <SellTypeItem :key="index" :item="item"></SellTypeItem>
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
import SellTypeItem from "./SellTypeItem";
export default {
  data() {
    return {
      selltypes: [],
      selltype: "",
    };
  },
  mounted() {
    this.getSellTypes();
  },
  components: { SellTypeItem },
  methods: {
    addNew() {
      if (this.selltype.trim() != "") {
        api
          .post("api/v1/data/add-sell-type", { selltype: this.selltype })
          .then((res) => {
            this.selltypes.push(res.data.selltype);
            this.selltype = "";
          })
          .catch((e) => console.log(e));
      }
    },
    async getSellTypes() {
      await api
        .get("api/v1/data/get-sell-types")
        .then((res) => {
          this.selltypes = res.data.selltypes;
        })
        .catch((e) => console.log(e));
    },
  },
  created() {
    Event.$on("update-selltype", (data) => {
      let newState = this.selltypes.map((item) =>
        item.id === data.id ? { id: data.id, name: data.selltype } : item
      );
      this.selltypes = newState;
    });
    Event.$on("delete-selltype", (data) => {
      let newState = this.selltypes.filter((u) => u.id !== data.id);
      this.selltypes = newState;
    });
  },
};
</script>