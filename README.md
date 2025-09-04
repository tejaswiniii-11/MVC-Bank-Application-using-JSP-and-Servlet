# MVC-Bank-Application-using-JSP-and-Servlet

```markdown
# 🏦 Tej Bank - Online Banking Application

A Java-based **Banking Web Application** built using **JSP, Servlets, JDBC, and MySQL**.  
The application provides core banking functionalities such as account management, beneficiaries, fund transfer, and viewing transaction history (passbook).  

---

## 🚀 Features

### 👤 Customer Features
- **Authentication**: Secure login/logout system for customers and admins.
- **Dashboard**: Personalized customer dashboard after login.
- **Account Management**: Create and manage multiple bank accounts.
- **Beneficiary Management**: Add and view beneficiaries for fund transfers.
- **Fund Transfer**: Make payments to beneficiaries via secure transaction handling.
- **Transaction History**: View passbook containing detailed records of transactions.
- **Profile Management**: View customer profile details.

### 🛠️ Admin Features
- **Admin Dashboard**: Centralized admin panel.
- **Customer Management**: View and manage registered customers.
- **Transaction Monitoring**: Track all transactions across the system.

---

## 🏗️ Tech Stack

- **Frontend**: JSP, HTML5, CSS3, Bootstrap 5  
- **Backend**: Java (Servlets, JSP)  
- **Database**: MySQL  
- **Server**: Apache Tomcat  
- **ORM / DB Access**: JDBC  

---

## 📂 Project Structure

```

<img width="449" height="183" alt="image" src="https://github.com/user-attachments/assets/630b11e9-97f9-4505-a668-98b0ff99ff38" />

````

---

## ⚙️ Installation & Setup

1. **Clone the repository**  
   ```bash
   git clone https://github.com/your-username/BankingApplication.git
   cd BankingApplication
````

2. **Database Setup**

   * Install MySQL and create a database:

     ```sql
     CREATE DATABASE tejbank;
     ```
   * Import the schema:

     ```bash
     mysql -u root -p tejbank < database/schema.sql
     ```

3. **Configure Database Connection**
   Update your `DBUtil.java` (or equivalent) with your MySQL credentials:

   ```java
   private static final String URL = "jdbc:mysql://localhost:3306/tejbank";
   private static final String USER = "root";
   private static final String PASSWORD = "yourpassword";
   ```

4. **Deploy on Tomcat**

   * Add the project to **Apache Tomcat Server** in Eclipse/IntelliJ.
   * Start the server.
   * Visit: `http://localhost:8080/BankingApplication/`

---

## 📸 Screenshots

<img width="956" height="526" alt="image" src="https://github.com/user-attachments/assets/b421e237-5200-4471-bc40-c8519d90fed5" />

<img width="953" height="530" alt="image" src="https://github.com/user-attachments/assets/c855ee23-1296-425c-8fa0-5e1db8187fca" />

<img width="958" height="554" alt="image" src="https://github.com/user-attachments/assets/60343e8f-cf5b-4a5b-9937-a5cfe545abc0" />

<img width="958" height="526" alt="image" src="https://github.com/user-attachments/assets/66e3615e-2301-4aa3-b8c0-85ac83911413" />

<img width="956" height="519" alt="image" src="https://github.com/user-attachments/assets/adeb13ca-e1b1-4b5f-a19e-fb267a718e0b" />

<img width="959" height="526" alt="image" src="https://github.com/user-attachments/assets/9e3ffb97-516e-4ae4-9584-1eee98049bef" />

<img width="958" height="528" alt="image" src="https://github.com/user-attachments/assets/71a1d298-a3d1-4ad5-9592-b6b426e30781" />

<img width="959" height="529" alt="image" src="https://github.com/user-attachments/assets/24726ee5-13d8-411e-9425-b4b2e9add8f9" />

<img width="959" height="508" alt="image" src="https://github.com/user-attachments/assets/98be792e-a3a5-4178-848e-30c4a364cc7f" />

<img width="950" height="532" alt="image" src="https://github.com/user-attachments/assets/7fabe2e4-61d7-438e-b6db-491f86a3c0a8" />

<img width="957" height="535" alt="image" src="https://github.com/user-attachments/assets/05621ae0-f42c-485c-ae92-17d2d72f341b" />

<img width="957" height="532" alt="image" src="https://github.com/user-attachments/assets/58415382-ca82-46ea-9634-3d123192ef61" />

<img width="956" height="535" alt="image" src="https://github.com/user-attachments/assets/f6f2da9c-0dab-4650-b573-7203f2bc3d52" />

<img width="956" height="524" alt="image" src="https://github.com/user-attachments/assets/c4aabd5a-515d-4c45-b9e7-21c5d2e50068" />

<img width="952" height="521" alt="image" src="https://github.com/user-attachments/assets/e9470ebb-89aa-48e8-84e8-d3b076db7cf3" />

<img width="959" height="521" alt="image" src="https://github.com/user-attachments/assets/2def5dc3-99d5-4585-9d3f-f0bfd8170c78" />

<img width="958" height="517" alt="image" src="https://github.com/user-attachments/assets/254ade59-6157-49d6-a4b6-c4f0f16e27b3" />

<img width="959" height="521" alt="image" src="https://github.com/user-attachments/assets/82e948bf-9509-4888-a614-1676a9a1d39e" />




---

## 🔐 Security Considerations

* Passwords should be hashed before storing in DB.
* Input validations applied for forms (JSP + Servlet side).
* Sessions are validated to prevent unauthorized access.

---

## ✨ Future Enhancements

* ✅ Email/SMS notifications for transactions.
* ✅ Two-factor authentication for login.
* ✅ Role-based access for staff vs admin.
* ✅ Export passbook as PDF/Excel.

---

## 🤝 Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

---

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

```

---

👉 This README has all sections: **intro, features, tech stack, setup guide, project structure, screenshots, security, future scope, contributing, license**.  

Do you want me to also prepare a **`schema.sql`** file (with all table creation queries like `customers`, `accounts`, `transactions`, etc.) so you can put it in your `database/` folder and link it in the README?
```
