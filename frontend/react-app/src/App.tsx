import React from "react"
import Header from './components/Header'

const App: React.FC = () => {
  return (
      <header className="header">
        <div className="title-container">
          <h1 className="title">Snake Game</h1>
        </div>
        <Header />
      </header>
  )
}

export default App