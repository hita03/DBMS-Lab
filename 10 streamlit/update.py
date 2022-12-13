import pandas as pd
import streamlit as st
from database import view_all_data, view_only_train_number, update_new


def update():
    result = view_all_data()
    df = pd.DataFrame(result, columns=["Train_No", "Name", "Train_Type", "Source", "Destination", "Availability"])
    with st.expander("Current Trains with availabilities"):
        st.dataframe(df)
    list_of_trains = [i[0] for i in view_only_train_number()]
    selected_train = st.selectbox("train to Edit", list_of_trains)
    if selected_train:
        if st.button("Update Train's Availability"):
            update_new('Yes', selected_train)
            st.success("Successfully updated Availability of train :: {} to :: {}".format(selected_train, 'Yes'))
    result2 = view_all_data()
    df2 = pd.DataFrame(result2, columns=["Train_No", "Name", "Train_Type", "Source", "Destination", "Availability"])
    with st.expander("Updated Train data"):
        st.dataframe(df2)