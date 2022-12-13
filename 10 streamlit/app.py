
import streamlit as st
from create import create_t
from database import create_table
from delete import delete
from read import read
from update import update

def main():
    st.title("Hita Juneja, PES1UG20CS645")
    menu = ["Add", "View", "Edit", "Remove"]
    choice = st.sidebar.selectbox("Menu", menu)
    create_table()
    if choice == "Add":
        st.subheader("Enter train Details:")
        create_t()
    elif choice == "View":
        st.subheader("View created tasks")
        read()
    elif choice == "Edit":
        st.subheader("Update created tasks")
        update()
    elif choice == "Remove":
        st.subheader("Delete created tasks")
        delete()
    else:
        st.subheader("About tasks")


if __name__ == '__main__':
    main()
