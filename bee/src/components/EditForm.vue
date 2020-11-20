<template>
  <div class="row" :class="{ mobileSnackBar: is_mobile }" >
    <div class="col-md-2">
      <Panel></Panel>
    </div>
    <div class="col-md-10">
      <div class="shadow-sm rounded" style="margin: 0 25px">
        <div class="create-from-title">ویرایش ملک {{ form.title }}</div>
        <div class="create-form">
          <form @submit.prevent="handleSubmit">
            <div class="form-row">
              <div class="form-group col-md-3">
                <label for="title">عنوان</label>
                <input
                  type="title"
                  class="form-control"
                  id="title"
                  name="title"
                  v-model="form.title"
                  placeholder="عنوان ملک"
                />
              </div>
              <div class="form-group col-md-3">
                <label for="category">دسته</label>
                <select
                  id="category"
                  @change="changeCategory($event)"
                  name="property_category_id"
                  class="form-control"
                  v-model="form.property_category_id"
                >
                  <option
                    :value="item.id"
                    v-for="(item, index) in categories"
                    :key="index"
                  >
                    {{ item.name }}
                  </option>
                  <option value="">مشخص نشده</option>
                </select>
              </div>
              <div class="form-group col-md-3">
                <label for="sell_type">نوع معامله</label>
                <select
                  id="sell_type"
                  @change="changeSellType($event)"
                  name="sell_type_id"
                  class="form-control"
                  v-model="form.sell_type_id"
                >
                  <option
                    v-for="(item, index) in sellTypes"
                    :key="index"
                    :value="item.id"
                  >
                    {{ item.name }}
                  </option>
                  <option value="">مشخص نشده</option>
                </select>
              </div>
              <div class="form-group col-md-3">
                <label for="feature">ویژگی ملک</label>
                <select
                  id="feature"
                  @change="changeFeature($event)"
                  name="feature_id"
                  class="form-control"
                  v-model="form.feature_id"
                >
                  <option
                    v-for="(item, index) in features"
                    :key="index"
                    :value="item.id"
                  >
                    {{ item.name }}
                  </option>
                  <option value="">مشخص نشده</option>
                </select>
              </div>
            </div>
            <div class="form-row">
              <div class="form-group col-md-6 col-sm-12">
                <label for="owner">مالک</label>
                <input
                  type="text"
                  name="owner"
                  v-model="form.owner"
                  class="form-control"
                  id="owner"
                  placeholder="نام مالک"
                />
              </div>
              <div class="form-group col-md-6 col-sm-12">
                <label for="phone">شماره تماس مالک</label>
                <input
                  type="text"
                  name="phone"
                  v-model="form.phone"
                  class="form-control"
                  id="phone"
                  placeholder="شماره تماس"
                />
              </div>
            </div>
            <div class="form-row distinct">
              <div class="col-md-6">
                <label for="address">آدرس</label>
                <input
                  type="text"
                  name="address"
                  v-model="form.address"
                  class="form-control"
                  id="address"
                  placeholder="آدرس ملک"
                />
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="doc">نوع سند</label>
                  <select
                    id="doc"
                    @change="changeDocument($event)"
                    name="document_id"
                    class="form-control"
                    v-model="form.document_id"
                  >
                    <option
                      v-for="(item, index) in documentTypes"
                      :key="index"
                      :value="item.id"

                    >
                      {{ item.name }}
                    </option>
                    <option value="">مشخص نشده</option>
                  </select>
                </div>
              </div>
            </div>
            <div class="form-group">
              <label for="description">توضیحات</label>
              <textarea
                class="form-control"
                name="description"
                v-model="form.description"
                id="description"
                rows="3"
              ></textarea>
            </div>
            <div class="form-row mb-2 mt-2 distinct">
              <div
                class="form-group row"
                style="
                  flex-flow: wrap;
                  margin-right: 15px;
                  padding: 10px 5px;
                  align-items: center;
                "
              >
                <label for="facilities" style="margin: 0; margin-left: 20px"
                  >امکاناتس</label
                >
                <div v-if="property && property.facilities.length > 0" class="d-flex" style="flex-wrap: wrap">
                  <div
                    class="form-check"
                    v-for="(item, index) in facilities"
                    :key="index"
                  >
                    <input
                      class="form-check-input"
                      @change="checkFacility($event)"
                      type="checkbox"
                      :id="'facilities' + index"
                      :value="item.id"
                      v-model="form.facilities"
                      :checked=form.facilities.includes(item.id)

                    />
                    <label
                      class="form-check-label"
                      name="facilities"
                      :for="'facilities' + index"
                    >
                      {{ item.name }}
                    </label>
                  </div>
                </div>
              </div>
            </div>
            <div class="form-row mt-3 mb-3">
              <div class="form-group col-md-3 col-sm-12">
                <label for="price">قیمت ملک</label>
                <input
                  type="text"
                  name="price"
                  class="form-control"
                  id="price"
                  v-model="form.price"
                  placeholder="قیمت"
                  @keyup="handleChange($event, 'price')"
                />
              </div>
              <div class="form-group col-md-3 col-sm-12">
                <label for="price_label">پسوند قیمت</label>
                <input
                  type="text"
                  name="price_label"
                  class="form-control"
                  id="price_label"
                  v-model="form.price_label"
                  placeholder="مانند: میلیون تومان"
                />
              </div>
              <div class="form-group col-md-3 col-sm-12">
                <label for="rent_price">قیمت اجاره</label>
                <input
                  type="text"
                  name="rent_price"
                  class="form-control"
                  id="rent_price"
                  v-model="form.rent_price"
                  placeholder="قیمت اجاره"
                  @keyup="handleChange($event, 'rent_price')"
                />
              </div>
              <div class="form-group col-md-3 col-sm-12">
                <label for="rent_label">پسوند قیمت اجاره</label>
                <input
                  type="text"
                  name="rent_label"
                  class="form-control"
                  id="rent_label"
                  v-model="form.rent_label"
                  placeholder="مانند: هزار تومان"
                />
              </div>
            </div>
            <div class="form-row distinct">
              <div class="form-group col">
                <label for="province_id">استان</label>
                <select
                  id="province_id"
                  @change="getCityByProvince($event)"
                  class="form-control"
                  v-model="form.province_id"
                >
                  <option
                    :value="item.id"
                    v-for="(item, index) in provinces"
                    :key="index"
                  >
                    {{ item.name }}
                  </option>
                  <option>...</option>
                </select>
              </div>
              <div class="form-group col-md-6">
                <label for="city_id">شهر</label>
                <select
                  id="city_id"
                  @change="changeCity($event)"
                  class="form-control"
                  v-model="form.city_id"
                >
                  <option
                    v-for="(item, index) in cities"
                    :value="item.id"
                    :key="index"
                  >
                    {{ item.name }}
                  </option>
                  <option>...</option>
                </select>
              </div>
              <div class="form-group col-md-6">
                <label for="neighborhooh_id">محله</label>
                <select
                  id="neighborhooh_id"
                  @change="setNeighborhoodByCity($event)"
                  class="form-control"
                  v-model="form.neighborhood_id"
                >
                  <option
                    :value="item.id"
                    v-for="(item, index) in neighborhoods"
                    :key="index"
                  >
                    {{ item.name }}
                  </option>
                  <option value="">...</option>
                </select>
              </div>
              <div class="form-group col-sm-12 col-md-6 direction">
                <div
                  v-for="(item, index) in directions"
                  :key="index"
                  class="custom-control custom-radio custom-control-inline"
                >
                  <input
                    @change="setDirection($event)"
                    type="radio"
                    :value="item.id"
                    :id="'customRadioInline1' + index"
                    name="customRadioInline1"
                    class="custom-control-input"
                    :checked="item.id == form.direction_id"
                  />
                  <label
                    class="custom-control-label"
                    :for="'customRadioInline1' + index"
                    >{{ item.name }}</label
                  >
                </div>
              </div>
            </div>
            <div class="form-row">
              <div class="form-group col">
                <label for="size">متراژ</label>
                <input
                  type="number"
                  name="size"
                  class="form-control"
                  id="size"
                  v-model="form.size"
                  placeholder="متراژ"
                />
              </div>
              <div class="form-group col">
                <label for="size_unit">واحد متراژ</label>
                <input
                  type="text"
                  name="size_unit"
                  v-model="form.size_unit"
                  class="form-control"
                  id="size_unit"
                  placeholder="مانند: متر"
                />
              </div>
            </div>
            <div class="form-row distinct">
              <div class="form-group col-md-4 col-sm-12">
                <label for="bed_count">تعداد خواب</label>
                <input
                  type="number"
                  name="bed_count"
                  v-model="form.bed_count"
                  class="form-control"
                  id="bed_count"
                  placeholder="تعداد اتاق خواب"
                />
              </div>
              <div class="form-group col-md-4 col-sm-12">
                <label for="bath_count">تعداد حمام</label>
                <input
                  type="number"
                  name="bath_count"
                  v-model="form.bath_count"
                  class="form-control"
                  id="bath_count"
                  placeholder="تعداد حمام"
                />
              </div>
              <div class="form-group col-md-4 col-sm-12">
                <label for="parking_count">تعداد پارکینگ</label>
                <input
                  type="number"
                  name="parking_count"
                  v-model="form.parking_count"
                  class="form-control"
                  id="parking_count"
                  placeholder="تعداد پارکینگ"
                />
              </div>
            </div>
            <div class="form-row">
              <div class="col-md-4 col-sm-12">
                <div class="form-group">
                  <label for="build_time">تاریخ ساخت بنا</label>
                  <input
                    type="text"
                    name="build_time"
                    v-model="form.build_time"
                    class="form-control"
                    id="build_time"
                    placeholder="مانند 1390"
                  />
                </div>
              </div>
              <div class="col-md-4 col-sm-12">
                <div class="form-group">
                  <label for="property_id">کد ملک</label>
                  <input
                    type="text"
                    name="property_id"
                    v-model="property_id"
                    class="form-control"
                    id="property_id"
                    disabled
                    placeholder="مانند 1390"
                  />
                </div>
              </div>
              <div class="col-md-4 col-sm-12">
                <label for="today">تاریخ ثبت در پایگاه</label>
                <input
                  type="text"
                  v-model="today"
                  class="form-control"
                  id="today"
                  disabled
                />
              </div>
            </div>

            <div class="form-group">
              <div class="form-check">
                <input
                  class="form-check-input"
                  v-model="form.special"
                  type="checkbox"
                  id="gridCheck"
                  :checked="form.special"
                />
                <label class="form-check-label" name="special" for="gridCheck">
                  ویژه؟
                </label>
              </div>
            </div>
            <div class="row">
              <div class="col-md-2">
                <button type="submit" class="btn btn-lg btn-primary">
                  بروزرسانی
                </button>
              </div>
              <div class="col-md-10">
                <button
                  type="button"
                  class="btn btn-warning text-white btn-lg btn-block mt-3 cus-btn"
                >
                  <router-link to="/manage" class="text-white"
                    >بازگشت</router-link
                  >
                </button>
              </div>
            </div>
            <div class="my-2 font-weight-bold text-success" v-if="info">
              {{ info }}
            </div>
            <div class="my-2 font-weight-bold text-danger" v-if="err">
              {{ err }}
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import api from "../services/api";
import { mapState } from "vuex";
import Panel from "./Panel";

export default {
  data() {
    return {
      categories: [],
      sellTypes: [],
      provinces: [],
      features: [],
      cities: [],
      facilities: [],
      neighborhoods: [],
      directions: [],
      documentTypes: [],
      form: {
        id: "",
        title: "",
        property_category_id: "",
        sell_type_id: "",
        feature_id: "",
        document_id: "",
        price: "",
        price_label: "",
        rent_price: "",
        rent_label: "",
        province_id: "",
        neighborhood_id: "",
        city_id: "",
        size: "",
        size_unit: "",
        bed_count: "",
        bath_count: "",
        parking_count: "",
        owner: "",
        phone: "",
        build_time: null,
        address: "",
        description: "",
        special: "",
        facilities: [],
        direction_id: "",
      },
      err: "",
      info: "",
      today: window.moment().format("jYYYY/jM/jD"),
      property_id: "{DATABAM-ID}",
      property: "",
    };
  },
  props: [],
  components: { Panel },
  methods: {
    handleChange(e, name) {
      let res = e.target.value
        .toString()
        .replace(/\D/g, "")
        .replace(/\B(?=(\d{3})+(?!\d))/g, ",");
      this.$set(this.form, name, res);
    },
    setDirection(e) {
      let id = e.target.value;
      this.form.direction_id = id;
    },
    checkFacility(e) {
      if (e.target.checked) {
        this.form.facilities.push(e.target.value);
      } else {
        let filter = this.form.facilities.filter((el) => el != e.target.value);
        this.form.facilities = filter;
      }
    },
    changeCategory(e) {
      this.form.property_category_id = e.target.value;
    },
    changeDocument(e) {
      this.form.document_id = e.target.value;
    },
    changeSellType(e) {
      this.form.sell_type_id = e.target.value;
    },
    changeFeature(e) {
      this.form.feature_id = e.target.value;
    },
    changeCity(e) {
      this.form.city_id = e.target.value;

      api
        .get(`api/v1/data/get-neighborhood-by-city?city=${e.target.value}`)
        .then((response) => {
          this.neighborhoods = response.data.neighborhoods;
        })
        .catch((error) => console.log(error));
    },
    getCityByProvince(e) {
      let id = e.target.value;
      this.form.province_id = id;
      api
        .get(`api/v1/data/get-cities?province=${id}`)
        .then((response) => {
          this.cities = response.data.cities;
        })
        .catch((error) => console.log(error));
    },
    setNeighborhoodByCity(e) {
      //get neighborhoodbycity
      let id = e.target.value;
      this.form.neighborhood_id = id;
    },
    handleSubmit() {
      //  this.form.user_id = this.user.ID;

      let form = this.form;

      api
        .post("api/v1/data/update-form", {
          ...form,
        })
        .then((res) => {
          this.info = res.data;
        })
        .catch((e) => {
          this.err = e.response.data.data;
        });
    },
    getData(id) {
      let data = this.properties.data.find((el) => el.id == id);
      return data;
    },
  },
  mounted() {
    const id = this.$route.params.id;
    //console.log(a);
    this.property = this.getData(id);
    this.form = { ...this.property };
    this.form.id = this.property.id;
    let ids = this.property.facilities.map((a) => a.id);
    this.form.facilities = ids;

    api
      .get("api/v1/data")
      .then((response) => {
        this.categories = response.data.categories;
        this.sellTypes = response.data.sellTypes;
        this.provinces = response.data.provinces;
        this.cities = response.data.cities;
        this.features = response.data.features;
        this.facilities = response.data.facilities;
        this.directions = response.data.directions;
        this.neighborhoods = response.data.neighborhoods;
        this.documentTypes = response.data.documentTypes;
      })
      .catch((error) => console.log(error));
  },
  computed: {
    ...mapState({
      properties: (state) => state.properties && state.properties,
    }),
    is_mobile() {
      const isMobile = window.matchMedia("only screen and (max-width: 760px)");
      return isMobile.matches ? true : false;
    },

  },
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
  border: 1px solid #eee;
}
.direction {
  justify-content: center;
  display: flex;
  align-items: center;
  flex-wrap: wrap;
}
.fgd {
  width: 165px;
}
.mobileSnackBar {
  flex-flow: column-reverse !important;
}
input,
select {
  font-size: 15px !important;
}
</style>
