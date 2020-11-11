import Axios from 'axios';

let server = {
  "dev":"http://amlak.com/wp-json/",
  "dev2": "http://wp.com/wp-json/",
  "prod" : ""
};

const api = Axios.create({
  baseURL: server["dev2"]
})

export default api;