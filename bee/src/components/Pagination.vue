
<template>
  <div>
    <div class="pagination">
      <div key="back" @click="fetchSkip(currentpage - perpage)">back</div>
      <div
        v-for="fromPage in toPage"
        :key="fromPage"
        :class="fromPage == currentpage ? 'active' : ''"
        @click="fetchTarget(fromPage)"
      >
        {{ fromPage }}
      </div>
      <div key="next" @click="fetchSkip(perPage)">right</div>
    </div>
  </div>
</template>
<script>
import api from "../services/api";

export default {
  data() {
    return {
      nexturl: "",
      perpage: "",
      currentpage: "",
      paginationurl: "",
      topage: "",
      frompage: "",
    };
  },
  mounted() {
    this.nexturl = this.nextUrl;
    this.currentpage = this.currentPage;
    this.perpage = this.perPage;
    this.paginationurl = this.paginationUrl;
    this.topage = this.toPage;
  },
  props: [
    "perPage",
    "currentPage",
    "paginationUrl",
    "nextUrl",
    "toPage",
    "fromPage",
  ],
  methods: {
    fetchTarget(pageID = 1) {
      let url = `${this.paginationUrl}${pageID}`;
      if (this.nextUrl == null && pageID >= this.perpage) {
        return false;
      }

      this.currentpage = pageID;

      if (url) {
        api
          .get(url)
          .then((res) => {
            this.$store.commit("setProperties", res.data);
            this.perpage = res?.data.per_page;
            this.nexturl = res?.data.next_page_url;
          })
          .catch(() => {
            return [];
          });
      }
    },
    fetchSkip(sk) {
      var skip = sk;
      if (skip <= 0) {
        skip = 1;
      }
      if (this.nexturl == null) {
        if (this.currentpage != this.perpage) {
          return false;
        }
      }
      this.currentpage = skip;

      let url = `${this.paginationUrl}${skip}`;
      if (url) {
        api
          .get(url)
          .then((res) => {
            this.$store.commit("setProperties", res.data);
            this.perpage = res?.data.per_page;
            this.perpage = res?.data.next_page_url;
            this.nexturl = res?.data.next_page_url;
          })
          .catch(() => {
            return [];
          });
      }
    },
  },
};
</script>

<style scoped>
.pagination {
  display: flex;
  text-align: center;
  justify-content: center;
  margin-top: 50px;
}
.pagination > div {
  margin-left: 5px;
  padding: 5px 10px;
  border: 1px solid #eee;
  transition: all 200ms ease-in-out;
  -webkit-transition: all 200ms ease-in-out;
  -moz-transition: all 200ms ease-in-out;
  -ms-transition: all 200ms ease-in-out;
  -o-transition: all 200ms ease-in-out;
}

.pagination div:hover {
  background: #f1f1f1;
  cursor: pointer;
}
.active {
  background: #38b2ac;
  color: #fff;
}
.disabled {
  background: #d7d7d7;
  color: #f7f7f7;
  pointer-events: none;
}
</style>