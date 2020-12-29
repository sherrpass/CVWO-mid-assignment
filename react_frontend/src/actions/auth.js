import axios from "axios";
import setAlert from "./alert";

//register user
export const register = ({email, password}) => async (dispatch) => {
    const formData = {email,password};
    try {
        const response = await axios.post(
            "/api/users",
            formData
        );
        dispatch({ type: "REGISTER_SUCCESS", payload: response.data });
        // dispatch(loadUser());
    } catch (error) {
        const errorMsg = error.response.data.message;
        if (errorMsg) { 
            dispatch(setAlert(errorMsg, "danger"));
        }
        dispatch({ type: "REGISTER_FAIL" });
    }
};

//login user
export const login = ({ email, password }) => async (dispatch) => {
    const formData = {email, password};
    try {
        console.log("reached login action generator");
        const response = await axios.post(
            "/api/login",
            formData
        );
        console.log(response);
        dispatch({ type: "LOGIN_SUCCESS", payload: response.data });
        // dispatch(loadUser());
    } catch (error) {
        const errorMsg = error.response.data.message;
        if (errorMsg) { 
            dispatch(setAlert(errorMsg, "danger"));
        }
        dispatch({ type: "LOGIN_FAIL" });
    }
};

export const loadUser = () => async (dispatch) => {
    try {
        const response = await axios.get("/api/auto_login");
        dispatch({ type: "USER_LOADED", payload: response.data });
    } catch (error) {
        dispatch({ type: "AUTH_ERROR" });
    }
};

export const logout = () => (dispatch) => {
    dispatch({ type: "LOGOUT" });
};
