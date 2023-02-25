import client from "./client";

export const getTeam = () => {
    return client.get("/team/index")
        .then(res => {
            return res.data
        })
        .catch((e) => console.error(e))
}
