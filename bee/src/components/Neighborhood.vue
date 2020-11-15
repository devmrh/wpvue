<template>
  <div class="row">
    <div class="col-md-2">
      <Panel></Panel>
    </div>
    <div class="col-md-10">
      <div class="shadow-sm rounded" style="margin: 0 50px">
        <div class="create-from-title">مدیریت محل ها</div>
        <div class="create-form">
          <div class="form-row distinct">
            <div class="form-group col">
              <label for="province_id">استان</label>
              <select
                id="province_id"
                @change="getCityByProvince($event)"
                class="form-control"
              >
                <option
                  :value="item.id"
                  v-for="(item, index) in provinces"
                  :key="index"
                >
                  {{ item.name }}
                </option>
                <option value="">...</option>
              </select>
            </div>
            <div class="form-group col">
              <label for="city_id">شهر</label>
              <select
                id="city_id"
                @change="changeCity($event)"
                class="form-control"
              >
                <option
                  v-for="(item, index) in cities"
                  :value="item.id"
                  :key="index"
                >
                  {{ item.name }}
                </option>
                <option value="">...</option>
              </select>
            </div>
            <div class="form-group col">
              <label for="neighborhood_id"
                >محله
                <input
                  v-model="neighborhood"
                  v-on:keyup.enter="addNew"
                  :disabled="city_id == null"
                  class="form-control"
                  placeholder="افزودن محله جدید"
                />
              </label>
              <ul id="neighborhood_id" class="list-group">
                <li
                  v-for="(item, index) in neighborhoods"
                  :key="index"
                  class="list-group-item"
                >
                  {{ item.name }}
                  <button
                    type="button"
                    class="btn btn-sm btn-danger"
                    @click="deleteItem(item.id)"
                  >
                    حذف
                  </button>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import api from "../services/api";
import Panel from "./Panel";

export default {
  name: "Form",
  data() {
    return {
      provinces: [],
      cities: [],
      neighborhoods: [],
      neighborhood: "",
      city_id: null,
    };
  },
  props: {},
  components: { Panel },
  methods: {
    changeCity(e) {
      this.city_id = e.target.value;
      api
        .get(`api/v1/data/get-neighborhood-by-city?city=${e.target.value}`)
        .then((response) => {
          this.neighborhoods = response.data.neighborhoods;
        })
        .catch((error) => console.log(error));
    },
    getCityByProvince(e) {
      let id = e.target.value;
      api
        .get(`api/v1/data/get-cities?province=${id}`)
        .then((response) => {
          this.cities = response.data.cities;
        })
        .catch((error) => console.log(error));
    },
    addNew() {
      if (this.neighborhood.trim() != "") {
        api
          .post("api/v1/data/add-neighborhood", {
            neighborhood: this.neighborhood,
            city_id: this.city_id,
          })
          .then((res) => {
            this.neighborhoods.push(res.data.neighborhood);
            this.neighborhood = "";
          })
          .catch((e) => console.log(e));
      }
    },
    deleteItem(id) {
      if (confirm("حذف شود؟")) {
        api
          .post("api/v1/data/delete-neighborhood", {
            id: id,
          })
          .then(() => {
            let newState = this.neighborhoods.filter((u) => u.id !== id);
            this.neighborhoods = newState;
          })
          .catch((e) => console.log(e));
      }
    },
  },
  mounted() {
    api
      .get("api/v1/data/get-provinces")
      .then((response) => {
        this.provinces = response.data.provinces;
      })
      .catch((error) => console.log(error));
  },
  computed: {},
};
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
* {
  font-family: "Irs";
}
.create-from-title {
  text-align: center;
  background: white;
  margin-bottom: 2px;
  padding: 20px 0;
  font-size: 20px;
  font-weight: bold;
  display: block;
}
.create-form {
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
.direction {
  justify-content: center;
  display: flex;
  align-items: center;
  flex-wrap: wrap;
}
input,
select {
  font-size: 15px !important;
}
</style>
