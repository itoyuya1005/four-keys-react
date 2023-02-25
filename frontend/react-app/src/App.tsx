import React from "react"
import Header from './components/Header'
import {ReleaseItem} from "./components/Release";
import {TeamItem} from "./components/team";

const App: React.FC = () => {
    return (
        <header className="header">
            <Header/>
            <ReleaseItem/>
            <TeamItem/>
        </header>
    )
}

export default App