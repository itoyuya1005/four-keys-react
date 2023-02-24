import React from "react"
import Header from './components/Header'
import {ReleaseItem} from "./components/Release";

const App: React.FC = () => {
    return (
        <header className="header">
            <Header/>
            <ReleaseItem/>
        </header>
    )
}

export default App