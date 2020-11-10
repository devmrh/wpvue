import Axios from 'axios';

let server = {
  "dev":"http://amlak.com/wp-json/",
  "prod" : "http://"
};

const api = Axios.create({
  baseURL: server["dev"]
})

export default api;