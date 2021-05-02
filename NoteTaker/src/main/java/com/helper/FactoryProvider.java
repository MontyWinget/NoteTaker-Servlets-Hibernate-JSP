package com.helper;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {

	public static SessionFactory factory;
	
	//To get Session Factory Object
	public static SessionFactory getFactory() {
		if(factory==null) {
			factory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		}
		return factory;
	}
	
	//To Close session Factory Object
	public void closeFactory() {
		if(factory.isOpen()) {
			factory.close();
		}
	}
	
}
