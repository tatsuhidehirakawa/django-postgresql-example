import React from "react";
import logo from '../../logo.svg';
import { Link } from "react-router-dom";
import "../../App.css";

const Nukes = () => {
  return (
    <header className="App-header">
      <img src={logo} className="App-logo" alt="logo" />
      <p>
        Welcome to the "<code>django-nextjs-postgresql-example</code>" - Ver 0.4.0.0
      </p>
      <Link to="/SiteTop" className="App-link">View Package Summary</Link>
    </header>
  )
}

export default Nukes;