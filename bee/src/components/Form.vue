<template>
  <div class="shadow-sm rounded" style="margin: 0 50px">
    <div class="create-from-title">ثبت ملک جدید</div>
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
        <div class="form-row mb-2 mt-2 distinct">
          <div class="form-group col-md-3">
            <label for="facilities">امکانات</label>
            <div class="d-flex">
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
          <div class="form-group col">
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
          <div class="form-group col">
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
          <div class="form-group col">
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
          <div class="form-group col">
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
            <label for="neighborhooh_id">محله</label>
            <select
              id="neighborhooh_id"
              @change="setNeighborhoodByCity($event)"
              class="form-control"
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
          <div class="form-group col direction">
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
          <div class="form-group col">
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
          <div class="form-group col">
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
          <div class="form-group col">
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
          <div class="form-group col">
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
          <div class="form-group col">
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
        <div class="form-group">
          <label for="build_time">تاریخ ساخت بنا</label>
          <!-- <input
            type="text"
            name="build_time"
            v-model="form.build_time"
            class="form-control"
            id="build_time"
            placeholder="تاریخ ساخت بنا"
          /> -->
          <pdatepicker
            placeholder="تاریخ ساخت"
            class="fgd"
            v-model="form.build_time"
          ></pdatepicker>
        </div>
        <div class="form-group">
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
        <div class="form-group">
          <div class="form-check">
            <input
              class="form-check-input"
              v-model="form.special"
              type="checkbox"
              id="gridCheck"
            />
            <label class="form-check-label" name="special" for="gridCheck">
              ویژه؟
            </label>
          </div>
        </div>
        <button type="submit" class="btn btn-lg btn-primary">ذخیره ملک</button>
        <div class="my-2 font-weight-bold text-success" v-if="info">
          {{ info }}
        </div>
        <div class="my-2 font-weight-bold text-danger" v-if="err">
          {{ err }}
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import api from "../services/api";
import { mapState } from "vuex";
export default {
  name: "Form",
  data() {
    return {
      categories: [],
      sellTypes: [],
      provinces: [],
      features: [],
      cities: [],
      facilities: [],
      directions: [],
      neighborhoods: [],
      form: {
        title: null,
        property_category_id: null,
        sell_type_id: null,
        feature_id: null,
        price: null,
        price_label: null,
        rent_price: null,
        rent_label: null,
        province_id: null,
        neighborhood_id: null,
        city_id: null,
        size: null,
        size_unit: null,
        bed_count: null,
        bath_count: null,
        parking_count: null,
        owner: null,
        phone: null,
        build_time: window.moment().format("jYYYY/jM/jD"),
        address: null,
        description: null,
        special: null,
        facilities: [],
        user_id: null,
        direction_id: null,
      },
      info: "",
      err: "",
    };
  },
  props: {},
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
      this.form.user_id = this.user.ID;

      let form = this.form;

      this.info = null;
      this.err = null;
      api
        .post("api/v1/data/save-form", {
          ...form,
        })
        .then((res) => {
          this.info = res.data;
        })
        .catch((e) => {
          this.err = e.response.data.data;
        });
    },
  },
  mounted() {
    api
      .get("api/v1/data")
      .then((response) => {
        this.categories = response.data.categories;
        this.sellTypes = response.data.sellTypes;
        this.provinces = response.data.provinces;
        this.features = response.data.features;
        this.facilities = response.data.facilities;
        this.directions = response.data.directions;
      })
      .catch((error) => console.log(error));
    this.form.build_time = window.moment().format("jYYYY/jM/jD");

    // console.log(this.user);
    //this.user_id = this.user.user.ID;
  },
  computed: {
    ...mapState({
      user: (state) => state.user,
    }),
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
input,
select {
  font-size: 15px !important;
}
</style>
