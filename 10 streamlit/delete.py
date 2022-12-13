import pandas as pd
import streamlit as st
from database import view_all_data, view_only_train_number, delete_data
def delete():
    result = view_all_data()
    df = pd.DataFrame(result, columns=["Train_No", "Name", "Train_Type", "Source", "Destination", "Availability"])
    with st.expander("View all Trains"):
        st.dataframe(df)

    list_of_train = [i[0] for i in view_only_train_number()]
    selected_train = st.selectbox("Task to Delete", list_of_train)
    st.warning("Do you want to delete ::{}".format(selected_train))
    if st.button("Delete Train"):
        delete_data(selected_train)
        st.success("Train entry has been deleted successfully")
    new_result = view_all_data()
    df = pd.DataFrame(new_result, columns=["Train_No", "Name", "Train_Type", "Source", "Destination", "Availability"])
    with st.expander("Updated Train data"):
        st.dataframe(df)