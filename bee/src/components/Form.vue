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

        <div class="form-row mt-3 mb-3">
          <div class="form-group col">
            <label for="price">قیمت ملک</label>
            <input
              type="number"
              name="price"
              class="form-control"
              id="price"
              v-model="form.price"
              placeholder="قیمت"
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
        <div class="form-row">
          <div class="form-group col-md-6">
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
              <option>...</option>
            </select>
          </div>
          <div class="form-group col-md-6">
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
              <option>...</option>
            </select>
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
        <div class="form-row">
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
          <input
            type="text"
            name="build_time"
            v-model="form.build_time"
            class="form-control"
            id="build_time"
            placeholder="تاریخ ساخت بنا"
          />
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
        <button type="submit" class="btn btn-lg btn-primary">ذخیره فرم</button>
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
      form: {
        title: "",
        property_category_id: "",
        sell_type_id: "",
        feature_id: "",
        price: "",
        price_label: "",
        rent_price: "",
        rent_label: "",
        province_id: "",
        city_id: "",
        size: "",
        size_unit: "",
        bed_count: "",
        bath_count: "",
        parking_count: "",
        owner: "",
        phone: "",
        build_time: "",
        address: "",
        description: "",
        special: "",
        user_id: "",
      },
    };
  },
  props: {
    authuser: {},
  },
  methods: {
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
    handleSubmit() {

      this.form.user_id = this.user.ID;

      let form = this.form;

      api
        .post("api/v1/data/save-form", {
          ...form,
        })
        .then((res) => {
          console.log(res.data);
        })
        .catch((e) => {
          console.log(e);
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
      })
      .catch((error) => console.log(error));

     // console.log(this.user);
      //this.user_id = this.user.user.ID;
  },
  computed: {
    ...mapState({
      user: (state) => state.user
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
input,
select {
  font-size: 15px !important;
}

</style>
