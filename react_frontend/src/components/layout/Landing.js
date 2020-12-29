import React from 'react';
import {Redirect} from "react-router-dom";
import {connect} from "react-redux";
const Landing = ({isAuthenticated}) => {
    if (isAuthenticated) {
        return <Redirect to="/dashboard" />;
    }
    return (
        <div>
            Landing page for this app
        </div>
    );
};
const mapStateToProps = (state) => {
    return { isAuthenticated: state.auth.isAuthenticated };
};
export default connect(mapStateToProps)(Landing);
