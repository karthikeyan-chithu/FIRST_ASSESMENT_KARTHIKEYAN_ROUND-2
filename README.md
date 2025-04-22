# 📄 RHB Credit Card Statement Generator

This is a multilingual web-based PDF generator for RHB Bank Malaysia credit card statements. The application is built using **Flask**, **MySQL**, and **WeasyPrint** for professional PDF rendering. It supports **English**, **Bahasa Melayu**, **中文 (Chinese)**, and **தமிழ் (Tamil)**.

## 🚀 Features

- Generate PDF statements for RHB credit card customers.
- Supports 4 languages with proper formatting and date localization.
- Automatically detects customer transactions from the MySQL database.
- Stylish and responsive HTML form interface.
- Secure session-based language preference handling.

## 🛠️ Technologies Used

- Python 3
- Flask
- MySQL (via PyMySQL)
- WeasyPrint (for PDF generation)
- Jinja2 (for HTML templating)
- Bootstrap-like custom styles

---

## 📦 Project Structure

project/ │ ├── app.py # Main Flask application ├── templates/ │ └── index.html # HTML template for form ├── statement*customer*\*.pdf # Generated PDFs (temporary files) ├── README.md # This readme file
