package com.fmpro.dao;
 
import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


import com.fmpro.entity.Account;
import com.fmpro.entity.Area;
import com.fmpro.entity.Order;
import com.fmpro.entity.Restro;
import com.fmpro.model.OrderInfo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
 
@Transactional
@Repository
public class AccountDAO {
 
    @Autowired
    private SessionFactory sessionFactory;
 
    public Account findAccount(String userName) {
        Session session = this.sessionFactory.getCurrentSession();
        return session.find(Account.class, userName);
    }
 

    
    
    // save area location
    public void saveArea(Area area) {
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
 
        area.setArea_name(area.getArea_name());

        session.persist(area);
        tx.commit();
        session.close();
       
 
        }
 
    
    
    
    // read all area list
	public  List<Area> readAllArea() {
		Session session = sessionFactory.openSession();
		
		// HQL
		List<Area> list = session.createQuery("FROM Area", Area.class).list();
	
		
		session.close();
		return list;
	}
    
    
    
	
	// save restro
	public void saveRestro(Restro restro) {
        Session session = this.sessionFactory.openSession();
        Transaction tx = session.beginTransaction();
 
     

        restro.setRestro_name(restro.getRestro_name());
        restro.setRestro_address(restro.getRestro_address());
        restro.setArea_id(restro.getArea_id());
        
        session.persist(restro);
        tx.commit();
        session.close();
       
 
        }
 
    
	
    //read all restro
	public  List<Restro> readAllRestro() {
		Session session = sessionFactory.openSession();
		
		
		List<Restro> list = session.createQuery("FROM Restro", Restro.class).list();
	
		
		session.close();
		return list;
	}
	
	
	
	// find or read restolist by id
	public  List<Restro> findRestro(int area_id) {
	        try {
	        
	 
	            Session session = this.sessionFactory.openSession();
	            
	    		String sql = "Select e from " + Restro.class.getName() + " e Where e.area_id =:area_id";
	    		
	    		List <Restro> list =  session.createQuery(sql, Restro.class).setParameter("area_id", area_id).getResultList();
	            
	    		System.out.println(list);
	    		session.close();
	    		return list;
	    		
	        } catch (NoResultException e) {
	            return null;
	        }
	    }

	
	 
	
	
	
	
	
	
	 
	 //complete code----
	 
	 
	 /*
	 
	   public  Order updateOrder(String id) {
	        try {

	            Session session = this.sessionFactory.openSession();
	            session.beginTransaction();

//	    		String sql = "from "+Order.class.getName()+" o set o.progress = "+ str+"  where o.id =:id";
	            
	            String sql = "Select o from " + Order.class.getName() + " o Where o.id =:id";
   
	           Order o  = session.createQuery(sql, Order.class).setParameter("id", id).getSingleResult();
	
	            o.setProgress("1");
	            System.out.println(o.getProgress());
	            OrderInfo of = new OrderInfo("1");
	            System.out.println(of.getProgress());
	            session.persist(o);
		
	    		session.getTransaction().commit();
	    		
	    		return o;
	        } catch (NoResultException e) {
	            return null;
	        }
	    }

	 
	 */
	 
	 
	 
	 
	 
	 
	
	
	
}