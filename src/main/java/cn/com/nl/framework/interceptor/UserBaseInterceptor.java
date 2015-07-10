package cn.com.nl.framework.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.com.nl.framework.base.BasicController;

/**
 * @Title PanBI.java
 * @Package cn.com.nl.framework.interceptor
 * @Description 用户基本操作准备拦截器
 * @Author Li Siqi
 * @Date 2015年7月10日 下午11:18:40
 * @Version V1.0
 */
public class UserBaseInterceptor extends HandlerInterceptorAdapter {

	private static final Log log = LogFactory.getLog(UserBaseInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request
							,HttpServletResponse response
							,Object handler) throws Exception {

		log.info("===== 初始化Controller对象 =====");

		HttpSession session = request.getSession();

		if (BasicController.class.isAssignableFrom(handler.getClass()) || handler instanceof BasicController) {

			BasicController controller = (BasicController) handler;

			// 注入HttpServlet对象
			controller.setClienHttpRequest(request);
			controller.setClienHttpResponse(response);
			controller.setClienHttpSession(session);
		}

		log.info("===== 初始化Controller对象完成 =====");

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request
						  ,HttpServletResponse response
						  ,Object handler
						  ,ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request
							   ,HttpServletResponse response
							   ,Object handler
							   ,Exception ex) {

		if (BasicController.class.isAssignableFrom(handler.getClass())
		 || handler instanceof BasicController) {

			log.info("===== 开始清理HttpServlet对象 =====");

			BasicController controller = (BasicController) handler;

			controller.clearHttpServletObject();

			log.info("===== 清理HttpServlet对象完成 =====");
		}
	}
}
