import React, {Fragment, useEffect} from 'react';
import {getTeam} from "../lib/api/team";

export const TeamItem = () => {
    useEffect(() => {
        getTeam()
            .then((data) =>
                console.log(data)
            )
    }, [])
    return (
        <Fragment>
            team一覧
        </Fragment>
    )
}