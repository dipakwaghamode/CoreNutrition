package com.fmpro.entity;
 
import java.io.Serializable;
 
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fmpro.model.CustomerInfo;
 
@Entity
@Table(name = "Accounts")
public class Account implements Serializable {
 
    private static final long serialVersionUID = -2054386655979281969L;
 
    public static final String ROLE_MANAGER = "MANAGER";
    public static final String ROLE_EMPLOYEE = "EMPLOYEE";
 
    @Id
    @Column(name = "User_Name", length = 20, nullable = false)
    private String userName;
 
    @Column(name = "Encryted_Password", length = 128, nullable = false)
    private String encrytedPassword;
 
    @Column(name = "Active", length = 1, nullable = false)
    private boolean active;
 
    
    @Column(name = "User_Role", length = 20, nullable = false)
    private String userRole;
    
    
    
    public Account(Account account) {
        if (account != null) {
            this.userName = account.getUserName();
            this.encrytedPassword = account.getEncrytedPassword();
            this.active = account.isActive();
            this.userRole = account.getUserRole();
        }
    }
    
    
 
    public Account(String userName, String encrytedPassword, boolean active, String userRole) {
		super();
		this.userName = userName;
		this.encrytedPassword = encrytedPassword;
		this.active = active;
		this.userRole = userRole;
	}

	public Account() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getUserName() {
        return userName;
    }
 
    public void setUserName(String userName) {
        this.userName = userName;
    }
 
    public String getEncrytedPassword() {
        return encrytedPassword;
    }
 
    public void setEncrytedPassword(String encrytedPassword) {
        this.encrytedPassword = encrytedPassword;
    }
 
    public boolean isActive() {
        return active;
    }
 
    public void setActive(boolean active) {
        this.active = active;
    }
 
    public String getUserRole() {
        return userRole;
    }
 
    public void setUserRole(String userRole) {
        this.userRole = userRole;
    }
 
    @Override
    public String toString() {
        return "[" + this.userName + "," + this.encrytedPassword + "," + this.userRole + "]";
    }
 
}
