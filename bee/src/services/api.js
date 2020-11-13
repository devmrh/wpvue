import Axios from 'axios';

let server = {
  "dev":"http://amlak.com/wp-json/",
  "dev2": "http://wp.com/wp-json/",
  "prod" : "https://databam.ir/wp-json/"
};

const api = Axios.create({
  baseURL: server["dev"]
})

export default api;