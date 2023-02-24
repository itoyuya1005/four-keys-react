import axios from "axios"

const client = axios.create({
    baseURL: "http://localhost:3050/api/v1"
})

export default client