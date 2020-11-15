<template>
  <tr>
    <td>
      <div class="text-center">
        <div>{{ item.id }}</div>
      </div>
    </td>
    <td>
      <div class="text-center">
        <div @click="editCategory">{{ item.name }} (کلیک برای ویرایش)</div>
        <div v-if="showEdit">
          <input
            type="text"
            v-on:keyup.enter="sendUpdate"
            v-model="text"
            class="form-control ff-input"
          />
          <div class="close" @click="showEdit = false">X</div>
        </div>
      </div>
    </td>
    <td>
      <div>
        <button class="btn btn-danger" @click="deleteCategory">حذف</button>
      </div>
    </td>
  </tr>
</template>

<script>
import api from "../services/api";
export default {
  data() {
    return {
      showEdit: false,
      text: "",
    };
  },
  props: ["item"],
  methods: {
    editCategory() {
      this.showEdit = true;
    },
    sendUpdate() {
      if (this.text.trim() != "") {
        api
          .post("api/v1/data/edit-category", {
            category: this.text,
            id: this.item.id,
          })
          .then(() => {
            Event.$emit("update-category", {
              category: this.text,
              id: this.item.id,
            });

            this.text = "";
            this.showEdit = false;
          })
          .catch((e) => console.log(e));
      }
    },
    deleteCategory() {
      if (confirm("حذف شود؟")) {
        api
          .post("api/v1/data/delete-category", {
            id: this.item.id,
          })
          .then(() => {
            Event.$emit("delete-category", {
              id: this.item.id,
            });
          })
          .catch((e) => console.log(e));
      }
    },
  },
};
</script>

<style scoped>
.ff-input {
  width: 50%;
  text-align: center;
  margin: 10px auto;
  display: inline;
}
.close {
  display: inline-block;
  padding: 5px;
  background: #b3a59f;
  border-radius: 50%;
  width: 33px;
  height: 32px;
  color: #fff;
  cursor: pointer;
  border: 1px solid transparent;
  text-align: center;
  vertical-align: middle;
  float: none;
  margin-right: 5px;
  line-height: 20px;
}
table tbody tr td {
  vertical-align: middle;
}
table tbody tr td > div {
  text-align: right !important;
}
table thead tr th {
  font-size: 15px;
}
</style>