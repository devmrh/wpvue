<template>
  <div class="row" :class="{ mobileSnackBar: is_mobile }">
    <div class="col-md-2">
      <Panel></Panel>
    </div>
    <div class="col-md-10" v-if="allow">
      <div class="create-from-title">جستجو در املاک</div>
      <div class="container search-form">
        <form @submit.prevent="handleSubmit" style="width: 100%">
          <div class="row">
            <div class="col-md-4">
              <div class="form-row distinct">
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
              <div class="form-row distinct">
                <div class="form-group col-md-12 distinct">
                  <label for="neighborhooh_id">محله</label>
                  <div v-if="neighborhoods.length < 1">شهر مشخص نشده</div>
                  <div
                    class="form-check"
                    v-for="(item, index) in neighborhoods"
                    :key="index"
                  >
                    <input
                      class="form-check-input"
                      @change="setNeighborhoodByCity($event)"
                      type="checkbox"
                      :id="'neighborhooh_id' + index"
                      :value="item.id"
                    />
                    <label class="form-check-label" :for="'gridCheck' + index">
                      {{ item.name }}
                    </label>
                  </div>
                </div>
                <div class="form-group col-md-12 direction distinct">
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
              <div class="form-group">
                <label for="address">جستجو در نشانی</label>
                <textarea
                  class="form-control"
                  name="address"
                  v-model="form.address"
                  id="address"
                  rows="3"
                ></textarea>
              </div>
              <div class="form-group">
                <label for="form_id">جستجو در شناسه</label>
                <input
                  type="text"
                  name="form_id"
                  v-model="form.form_id"
                  class="form-control"
                  id="form_id"
                  placeholder="DATABAM-ID"
                />
              </div>
            </div>
            <div class="col-md-8">
              <div class="form-row align-items-center distinct">
                <div class="col-md-6 dist-1">
                  <div class="row" style="justify-content: center">
                    <div class="form-group fgd">
                      <label for="from_build_time">تاریخ ثبت</label>
                      <input
                        type="text"
                        v-model="form.from_register_time"
                        class="form-control"
                        id="from_build_time"
                        :placeholder="today"
                      />
                    </div>
                    <div class="mx-4" style="align-self: center">الی</div>
                    <div class="form-group fgd">
                      <label for="to_build_time">تاریخ ثبت</label>
                      <input
                        type="text"
                        v-model="form.to_register_time"
                        class="form-control"
                        id="to_build_time"
                        :placeholder="today"
                      />
                    </div>
                  </div>
                </div>
                <div class="col-md-6 dist-1">
                  <div class="row" style="justify-content: center">
                    <div class="form-group fgd">
                      <label for="from_build_time">تاریخ ساخت بنا</label>
                      <input
                        type="text"
                        name="from_build_time"
                        v-model="form.from_build_time"
                        class="form-control"
                        id="from_build_time"
                        placeholder="مانند 1390"
                      />
                    </div>
                    <div class="mx-4" style="align-self: center">الی</div>
                    <div class="form-group fgd">
                      <label for="to_build_time">تاریخ ساخت بنا</label>
                      <input
                        type="text"
                        name="to_build_time"
                        v-model="form.to_build_time"
                        class="form-control"
                        id="to_build_time"
                        placeholder="مانند 1399"
                      />
                    </div>
                  </div>
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
                  <label for="phone">شماره تماس</label>
                  <input
                    type="text"
                    name="phone"
                    v-model="form.phone"
                    class="form-control"
                    id="phone"
                    placeholder="شماره تماس مالک"
                  />
                </div>
              </div>
              <!-- part 2 -->
              <div class="form-row distinct">
                <div class="form-group col-md-6 dist-1">
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
                <div class="form-group col-md-6 dist-1">
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
              <div class="form-row">
                <div class="form-group col-md-6 dist-1">
                  <label for="sell_type">نوع معامله</label>
                  <div class="d-flex" style="flex-wrap: wrap">
                    <div
                      class="form-check"
                      v-for="(item, index) in sellTypes"
                      :key="index"
                    >
                      <input
                        class="form-check-input"
                        @change="checkSellType($event)"
                        type="checkbox"
                        :id="'gridCheck' + index"
                        :value="item.id"
                      />
                      <label
                        class="form-check-label"
                        name="special"
                        :for="'gridCheck' + index"
                      >
                        {{ item.name }}
                      </label>
                    </div>
                  </div>
                </div>

                <div class="form-group col-md-6 dist-1">
                  <label for="facilities">امکانات</label>
                  <div class="d-flex" style="flex-wrap: wrap">
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
              <div class="form-row">
                <div class="form-group col-md-12 dist-1">
                  <label for="documenttype">نوع سند</label>
                  <div class="d-flex" style="flex-wrap: wrap">
                    <div
                      class="form-check"
                      v-for="(item, index) in documentTypes"
                      :key="index"
                    >
                      <input
                        class="form-check-input"
                        @change="checkDocumentType($event)"
                        type="checkbox"
                        :id="'documenttype' + index"
                        :value="item.id"
                      />
                      <label
                        class="form-check-label"
                        name="documenttype"
                        :for="'documenttype' + index"
                      >
                        {{ item.name }}
                      </label>
                    </div>
                  </div>
                </div>
              </div>
              <!-- End part 2 -->

              <!-- Start part 3 -->
              <div
                class="form-row mt-3 mb-3 align-items-center distinct"
                style="flex-flow: inherit"
              >
                <div class="col-md-6 col-sm-12 dist-1">
                  <div class="row" style="align-items: center;">
                    <div class="col-md-5 col-sm-12">
                      <div class="form-group">
                        <label for="from_price">قیمت ملک به تومان</label>
                        <input
                          type="text"
                          name="from_price"
                          class="form-control"
                          id="from_price"
                          v-model="form.from_price"
                          placeholder="قیمت"
                          @keyup="handleChange($event, 'from_price')"
                        />
                      </div>
                    </div>
                    <div class="col-md-2 col-sm-12">
                      <div class="mx-2">تا</div>
                    </div>
                    <div class="col-md-5 col-sm-12">
                      <div class="form-group">
                        <label for="price">قیمت ملک به تومان</label>
                        <input
                          type="text"
                          name="to_price"
                          class="form-control"
                          id="to_price"
                          v-model="form.to_price"
                          placeholder="قیمت"
                          @keyup="handleChange($event, 'to_price')"
                        />
                      </div>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-sm-12 dist-2">
                  <div class="row" style="align-items: center;">
                    <div class="col-md-5 col-sm-12">
                      <div class="form-group">
                        <label for="from_rent_price">قیمت اجاره به تومان</label>
                        <input
                          type="text"
                          name="from_rent_price"
                          class="form-control"
                          id="from_rent_price"
                          v-model="form.from_rent_price"
                          placeholder="قیمت اجاره"
                          @keyup="handleChange($event, 'from_rent_price')"
                        />
                      </div>
                    </div>
                    <div class="col-md-2 col-sm-12">
                      <div class="mx-2">تا</div>
                    </div>
                    <div class="col-md-5 col-sm-12">
                      <div class="form-group">
                        <label for="to_rent_price">قیمت اجاره به تومان</label>
                        <input
                          type="text"
                          name="to_rent_price"
                          class="form-control"
                          id="to_rent_price"
                          v-model="form.to_rent_price"
                          placeholder="قیمت اجاره"
                          @keyup="handleChange($event, 'to_rent_price')"
                        />
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- End part 3 -->

              <!-- start part 4 -->
              <div class="form-row align-items-center distinct">
                <div class="form-group col">
                  <label for="from_size">متراژ ملک/بنا</label>
                  <input
                    type="number"
                    name="from_size"
                    class="form-control"
                    id="from_size"
                    v-model="form.from_size"
                    placeholder="متراژ"
                  />
                </div>
                <div class="mx-2">تا</div>
                <div class="form-group col">
                  <label for="to_size">متراژ ملک/بنا</label>
                  <input
                    type="number"
                    name="to_size"
                    class="form-control"
                    id="to_size"
                    v-model="form.to_size"
                    placeholder="متراژ"
                  />
                </div>
              </div>
              <div class="form-row align-items-center">
                <div class="form-group col">
                  <label for="from_size_g">متراژ زمین</label>
                  <input
                    type="number"
                    name="from_size"
                    class="form-control"
                    id="from_size_g"
                    v-model="form.from_size_g"
                    placeholder="متراژ"
                  />
                </div>
                <div class="mx-2">تا</div>
                <div class="form-group col">
                  <label for="to_size_g">متراژ زمین</label>
                  <input
                    type="number"
                    name="to_size"
                    class="form-control"
                    id="to_size_g"
                    v-model="form.to_size_g"
                    placeholder="متراژ"
                  />
                </div>
              </div>

              <!-- end part 4 -->

              <!-- start part 5 -->
              <div class="form-row distinct">
                <div class="form-group col">
                  <label for="bed_count">حداقل تعداد خواب</label>
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
                  <label for="bath_count">حداقل تعداد مستر(حمام)</label>
                  <input
                    type="number"
                    name="bath_count"
                    v-model="form.bath_count"
                    class="form-control"
                    id="bath_count"
                    placeholder="تعداد مستر"
                  />
                </div>
                <div class="form-group col">
                  <label for="parking_count">حداقل تعداد پارکینگ</label>
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
              <div class="form-group">
                <div class="form-check">
                  <input
                    class="form-check-input"
                    v-model="form.special"
                    type="checkbox"
                    id="gridCheck"
                  />
                  <label
                    class="form-check-label"
                    name="special"
                    for="gridCheck"
                  >
                    ویژه؟
                  </label>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col">
              <button type="submit" class="btn btn-lg btn-block btn-primary">
                جستجو
              </button>
            </div>
            <div class="col">
              <button
                type="button"
                class="btn btn-warning text-white btn-lg btn-block cus-btn"
              >
                <router-link to="/amlak" class="text-white">بازگشت</router-link>
              </button>
            </div>
            <div class="col">
              <button
                type="button"
                @click="clearForm"
                class="btn btn-lg btn-block text-white btn-warning"
              >
                پاک کردن فرم
              </button>
            </div>
          </div>
        </form>
      </div>
    </div>
    <div class="col-md-10" v-if="!allow">
      <div class="err">شما دسترسی کافی برای جستجوی ملک ندارید</div>
    </div>
    <transition name="bounce">
      <div v-if="viewstatus == 'result'" class="col">
        <SearchResult :sdata="searchdata" @clicked="childEvent"></SearchResult>
      </div>
    </transition>
  </div>
</template>

<script>
import api from "../services/api";
import Panel from "./Panel";
import SearchResult from "./SearchResult";
import { mapState } from "vuex";

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
      viewstatus: "search",
      searchdata: [],
      allow: null,
      form: {
        form_id: "",
        from_build_time: "",
        to_build_time: "",
        from_price: "",
        to_price: "",
        from_rent_price: "",
        to_rent_price: "",
        from_size: "",
        to_size: "",
        from_size_g: "",
        to_size_g: "",
        bed_count: "",
        bath_count: "",
        parking_count: "",
        owner: "",
        phone: "",
        special: "",
        address: "",
        property_category_id: "",
        sell_type_id: "",
        feature_id: "",
        city_id: "",
        province_id: "",
        facilities: [],
        sellTypes: [],
        neighborhoods: [],
        documentTypes: [],
        direction_id: "",
        from_register_time: "",
        to_register_time: "",
      },
      today: window.moment().format("jYYYY/jM/jD"),
    };
  },
  components: { Panel, SearchResult },
  mounted() {
    this.allow = this.check();
    if (!this.allow) return false;

    api
      .get("api/v1/data")
      .then((response) => {
        this.categories = response.data.categories;
        this.sellTypes = response.data.sellTypes;
        this.provinces = response.data.provinces;
        this.features = response.data.features;
        this.facilities = response.data.facilities;
        this.directions = response.data.directions;
        this.documentTypes = response.data.documentTypes;
        //this.neighborhoods = response.data.neighborhoods;
      })
      .catch((error) => console.log(error));
  },
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
    setNeighborhoodByCity(e) {
      if (e.target.checked) {
        this.form.neighborhoods.push(e.target.value);
      } else {
        let filter = this.form.neighborhoods.filter(
          (el) => el != e.target.value
        );
        this.form.neighborhoods = filter;
      }
    },
    childEvent(value) {
      this.viewstatus = value;
    },
    checkFacility(e) {
      if (e.target.checked) {
        this.form.facilities.push(e.target.value);
      } else {
        let filter = this.form.facilities.filter((el) => el != e.target.value);
        this.form.facilities = filter;
      }
    },
    checkSellType(e) {
      if (e.target.checked) {
        this.form.sellTypes.push(e.target.value);
      } else {
        let filter = this.form.sellTypes.filter((el) => el != e.target.value);
        this.form.sellTypes = filter;
      }
    },
    checkDocumentType(e) {
      if (e.target.checked) {
        this.form.documentTypes.push(e.target.value);
      } else {
        let filter = this.form.documentTypes.filter(
          (el) => el != e.target.value
        );
        this.form.documentTypes = filter;
      }
    },
    changeCategory(e) {
      this.form.property_category_id = e.target.value;
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
    handleSubmit() {
      let form = this.form;
      api
        .get("api/v1/data/search", {
          params: {
            ...form,
          },
        })
        .then((res) => {
          this.viewstatus = "result";
          this.searchdata = res.data;
        })
        .catch((e) => {
          console.log(e);
        });
    },
    clearForm() {
      this.form = {
        form_id: "",
        from_build_time: "",
        to_build_time: "",
        from_price: "",
        to_price: "",
        from_rent_price: "",
        to_rent_price: "",
        from_size: "",
        to_size: "",
        from_size_g: "",
        to_size_g: "",
        bed_count: "",
        bath_count: "",
        parking_count: "",
        owner: "",
        phone: "",
        special: "",
        address: "",
        property_category_id: "",
        sell_type_id: "",
        feature_id: "",
        city_id: "",
        province_id: "",
        facilities: [],
        sellTypes: [],
        neighborhoods: [],
        documentTypes: [],
        direction_id: "",
        from_register_time: "",
        to_register_time: "",
      };
    },
    findOne(haystack, arr) {
      return arr.some(function (v) {
        return haystack.indexOf(v) >= 0;
      });
    },
    check() {
      if (!this.findOne(this.roles, ["ml-adviser", "administrator"])) {
        // return this.$router.push("/error");
        return false;
      }
      return true;
    },
  },
  computed: {
    ...mapState({
      user: (state) => state.user,
      roles: (state) => state.user && state.user.roles,
    }),
    is_mobile() {
      const isMobile = window.matchMedia("only screen and (max-width: 760px)");
      return isMobile.matches ? true : false;
    },
  },
};
</script>

<style scoped>
* {
  font-family: "Irs" !important;
  font-size: 14px;
}
::-webkit-input-placeholder {
  font-size: 13px !important;
}

:-moz-placeholder {
  /* Firefox 18- */
  font-size: 13px !important;
}
::-moz-placeholder {
  /* Firefox 19+ */
  font-size: 13px !important;
}
.err {
  text-align: center;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: center;
  color: #7b1b1b;
  font-size: 15px;
  font-weight: bold;
}
.search-form {
  font-family: "Irs";
  direction: rtl;
  text-align: right;
  min-width: 80%;
  padding: 20px;
  background: #ffffff;
  border: 1px solid #eee;
  margin: 0 auto;
}
.create-from-title {
  text-align: center;
  background: white;
  margin-bottom: 2px;
  padding: 20px 0;
  font-size: 20px;
  font-weight: bold;
  display: block;
  width: 80%;
  margin: 0 auto;
}
.distinct {
  border-bottom: 2px dashed #eee;
  padding-bottom: 5px;
  margin-bottom: 10px;
}
.dist-1 {
  align-items: center;
  border-left: 3px dashed #eee;
  background: #fffdf6;
  padding: 15px 5px;
  margin-bottom: 5px;
}
.dist-2 {
  align-items: center;
  background: #fffdf6;
  padding: 15px 5px;
  margin-bottom: 5px;
}
.bounce-enter-active {
  animation: bounce-in 0.5s;
}
.bounce-leave-active {
  animation: bounce-in 0.5s reverse;
}
.direction {
  display: flex;
  flex-wrap: wrap;
}
.mobileSnackBar {
  flex-flow: column-reverse !important;
}
.fgd {
  width: 165px;
}
@keyframes bounce-in {
  0% {
    transform: scale(0);
  }
  50% {
    transform: scale(1.5);
  }
  100% {
    transform: scale(1);
  }
}
</style>