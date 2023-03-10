import client from "./client";

export const getReleases = () => {
    return client.get("/release/index")
        .then(res => {
            return res.data
        })
        .catch((e) => console.error(e))
}
