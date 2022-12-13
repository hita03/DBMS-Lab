import streamlit as st
from database import add_data
def create_t():

    col1, col2 = st.columns(2)
    with col1:
        Train_No = st.text_input("Train Number")
        Name = st.text_input("Name")
        Train_Type = st.text_input("Type")
    with col2:
        Source = st.text_input("Source")
        Destination  = st.text_input("Destination")
        Availability = st.text_input("Availability")
    if st.button("Add Train Details"):
        add_data(Train_No, Name, Train_Type, Source, Destination, Availability)
        st.success("Successfully added railway: {}".format(Train_No))