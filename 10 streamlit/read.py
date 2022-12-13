import pandas as pd
import streamlit as st

from database import view_all_data
def read():
    result = view_all_data()
    df = pd.DataFrame(result, columns=['Train_No', 'Name', 'Train_Type', 'Source', 'Destination', 'Availability'])
    with st.expander("View all Trains"):
        st.dataframe(df)