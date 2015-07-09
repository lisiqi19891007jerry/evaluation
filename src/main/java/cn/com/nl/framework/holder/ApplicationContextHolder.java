package cn.com.nl.framework.holder;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

public class ApplicationContextHolder implements ApplicationContextAware {

	private static Log log = LogFactory.getLog(ApplicationContextHolder.class);

	private static ApplicationContext applicationContext;

	@SuppressWarnings("all")
	public void setApplicationContext(ApplicationContext context) throws BeansException {

		if (this.applicationContext != null) {
			this.cleanHolder();
		}

		this.applicationContext = context;

		log.debug("holded applicationContext,displayName:" + applicationContext.getDisplayName());
	}

	public static ApplicationContext getApplicationContext() {
		if (applicationContext == null) {
			throw new IllegalStateException("'applicationContext' property is null,ApplicationContextHolder not yet init.");
		}
		return applicationContext;
	}

	public static <T> T getBean(String name) {
		return (T) applicationContext.getBean(name);
	}

	public static void cleanHolder() {
		applicationContext = null;
	}
}
