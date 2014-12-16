package jk.o1office.ht.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

public class ContextListener implements ServletContextListener {

	public void contextDestroyed(ServletContextEvent e) {
	}

	public void contextInitialized(ServletContextEvent e) {
	//	 PropertyConfigurator.configure("log4j.properties");
		Logger logger = Logger.getLogger(ContextListener.class);
		logger.info("ServletContextEvent....");
	    logger.debug( " debug " );
	    logger.error( " error " );
	    logger.info("info");
	}

}
