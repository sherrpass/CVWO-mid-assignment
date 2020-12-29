import React from 'react';
import {NavLink} from 'react-router-dom';
import {connect} from "react-redux";
import {logout} from "../../actions/auth";

const NavBar = ({logout, auth:{loading, isAuthenticated}}) => {
    const guestNavBar = (
        <header>
            <h1>TODO App</h1>
            <NavLink to="/login">Login</NavLink>
            <NavLink to="/register">Register</NavLink>
        </header>
    )
    const authNavBar = (
        <header>
            <h1>TODO App</h1>
            <NavLink to="/dashboard" exact={true}>Dashboard</NavLink>
            <NavLink to="/create">Create</NavLink>
            <NavLink to="/categories">Categories</NavLink>
            <NavLink onClick={logout} to="/">Logout</NavLink>
        </header>
    );
    return (
        <>
        {!loading && (isAuthenticated ? authNavBar : guestNavBar)}
        </>
    );

};

const mapStateToProps = (state) => ({
    auth : state.auth
});
export default connect(mapStateToProps,{logout})(NavBar);