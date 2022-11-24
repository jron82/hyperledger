import { useState } from 'react'

function App() {
  const [count, setCount] = useState(0)

  return (
    <main className="flex justify-center p-6 bg-gray-100 h-screen">
      <h1>Welcome to my HyperLedger</h1>
    </main>
  )
}

export default App
