import Axios from 'axios';

let server = {
  "dev":"http://amlak.com/wp-json/",
  "dev2": "http://amlak.ne/wp-json/",
  "prod" : "http://amlak.ne/wp-json/"
};

const api = Axios.create({
  baseURL: server["prod"]
})

export default api;