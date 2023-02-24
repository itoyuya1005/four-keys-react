import React, { Fragment, useEffect } from 'react';
import {getReleases} from "../lib/api/release";

export const ReleaseItem = () => {
    useEffect(() => {
        getReleases()
            .then((data) =>
                console.log(data)
            )
    }, [])
    return (
        <Fragment>
            リリース一覧
        </Fragment>
    )
}