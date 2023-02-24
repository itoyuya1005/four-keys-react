import axios from 'axios';

export const getReleases = () => {
    return axios.get("http://localhost:3050/api/v1/release/index")
        .then(res => {
            return res.data
        })
        .catch((e) => console.error(e))
}
