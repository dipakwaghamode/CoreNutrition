package com.fmpro.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.fmpro.entity.Account;


@Transactional
@Repository
public class RegisterDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	public  void saveManager(Account account) {
		
        Session session = this.sessionFactory.openSession();
        
        Transaction tx = session.beginTransaction();
 
 
        
        account.setUserName(account.getUserName());
        
		String encodedPassword = bCryptPasswordEncoder.encode(account.getEncrytedPassword());
        
        account.setEncrytedPassword(encodedPassword);
        
        account.setUserRole(account.getUserRole());
        
        
        session.persist(account);
        tx.commit();
        session.close();
       
 
        }
 
      
  
	 
	

}
