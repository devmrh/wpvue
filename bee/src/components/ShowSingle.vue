<template>
  <div class="shadow-sm rounded" style="margin: 0 25px">
    <button
      type="button"
      @click="$emit('clicked', 'all')"
      class="btn btn-warning btn-lg text-white btn-block mt-3 cus-btn"
    >
      بستن
    </button>
    <div class="create-from-title">مشاهده ملک {{ form.title }}</div>
    <div class="create-form">
      <form>
        <div class="form-row">
          <div class="form-group col-md-3 col-sm-12">
            <label for="title">عنوان</label>
            <input
              disabled
              type="title"
              class="form-control"
              id="title"
              name="title"
              v-model="form.title"
              placeholder="عنوان ملک"
            />
          </div>
          <div class="form-group col-md-3 col-sm-12">
            <label for="category">دسته</label>
            <select
              disabled
              id="category"
              name="property_category_id"
              class="form-control"
            >
              <option
                :value="item.id"
                v-for="(item, index) in categories"
                :key="index"
                :selected="item.id == form.property_category_id"
              >
                {{ item.name }}
              </option>
              <option value="">مشخص نشده</option>
            </select>
          </div>
          <div class="form-group col-md-3 col-sm-12">
            <label for="sell_type">نوع معامله</label>
            <select
              id="sell_type"
              disabled
              name="sell_type_id"
              class="form-control"
            >
              <option
                v-for="(item, index) in sellTypes"
                :key="index"
                :value="item.id"
                :selected="item.id == form.sell_type_id"
              >
                {{ item.name }}
              </option>
              <option value="">مشخص نشده</option>
            </select>
          </div>
          <div class="form-group col-md-3 col-sm-12">
            <label for="feature">ویژگی ملک</label>
            <select
              id="feature"
              disabled
              name="feature_id"
              class="form-control"
            >
              <option
                v-for="(item, index) in features"
                :key="index"
                :value="item.id"
                :selected="item.id == form.feature_id"
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
            <div class="">
              <div
                class="form-check"
                v-for="(item, index) in facilities"
                :key="index"
              >
                <input
                  disabled
                  class="form-check-input"
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
          <div class="form-group col-md-6 col-sm-12">
            <label for="price">قیمت ملک</label>
            <input
              disabled
              type="number"
              name="price"
              class="form-control"
              id="price"
              v-model="form.price"
              placeholder="قیمت"
            />
          </div>
          <div class="form-group col-md-6 col-sm-12">
            <label for="price_label">پسوند قیمت</label>
            <input
              disabled
              type="text"
              name="price_label"
              class="form-control"
              id="price_label"
              v-model="form.price_label"
              placeholder="مانند: میلیون تومان"
            />
          </div>

        </div>
        <div class="form-row">
                    <div class="form-group col-md-6 col-sm-12">
            <label for="rent_price">قیمت اجاره</label>
            <input
              disabled
              type="text"
              name="rent_price"
              class="form-control"
              id="rent_price"
              v-model="form.rent_price"
              placeholder="قیمت اجاره"
            />
          </div>
          <div class="form-group col-md-6 col-sm-12">
            <label for="rent_label">پسوند قیمت اجاره</label>
            <input
              disabled
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
          <div class="form-group col-md-6">
            <label for="province_id">استان</label>
            <select disabled id="province_id" class="form-control">
              <option
                :value="item.id"
                v-for="(item, index) in provinces"
                :key="index"
                :selected="item.id == form.province_id"
              >
                {{ item.name }}
              </option>
              <option>...</option>
            </select>
          </div>
          <div class="form-group col-md-6">
            <label for="city_id">شهر</label>
            <select disabled id="city_id" class="form-control">
              <option
                v-for="(item, index) in cities"
                :value="item.id"
                :key="index"
                :selected="item.id == form.city_id"
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
              disabled
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
              disabled
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
              disabled
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
              disabled
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
              disabled
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
          <div class="form-group col-md-6 col-sm-12">
            <label for="owner">مالک</label>
            <input
              disabled
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
              disabled
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
            disabled
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
            disabled
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
            disabled
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
              disabled
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
          <div class="col-md-12">
            <button
              type="button"
              @click="$emit('clicked', 'all')"
              class="btn btn-warning text-white btn-lg btn-block mt-3 cus-btn"
            >
              بستن
            </button>
          </div>
        </div>
      </form>
    </div>
  </div>
</template>

<script>
import api from "../services/api";
//import { mapState } from "vuex";
export default {
  data() {
    return {
      categories: [],
      sellTypes: [],
      provinces: [],
      features: [],
      cities: [],
      facilities: [],
      form: {
        id: "",
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
        facilities: [],
      },
    };
  },
  props: ["singleform"],
  methods: {},
  mounted() {
    this.form = { ...this.singleform };
    this.form.facilities = this.facilities;
    this.form.id = this.singleform.id;

    api
      .get("api/v1/data")
      .then((response) => {
        this.categories = response.data.categories;
        this.sellTypes = response.data.sellTypes;
        this.provinces = response.data.provinces;
        this.cities = response.data.cities;
        this.features = response.data.features;
        this.facilities = response.data.facilities;
      })
      .catch((error) => console.log(error));

    // console.log(this.user);
    //this.user_id = this.user.user.ID;
  },
  computed: {
    // ...mapState({
    //   user: (state) => state.user,
    // }),
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
input,
select {
  font-size: 15px !important;
}
</style>
