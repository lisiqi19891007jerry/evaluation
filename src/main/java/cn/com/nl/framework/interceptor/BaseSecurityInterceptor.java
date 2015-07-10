package cn.com.nl.framework.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.com.nl.framework.constant.SystemConstant;

public class BaseSecurityInterceptor extends HandlerInterceptorAdapter {

	/**
	 * 重写 preHandle()方法，在业务处理器处理请求之前对该请求进行拦截处理
	 */
	@Override
	public boolean preHandle(HttpServletRequest request
							,HttpServletResponse response
							,Object handler) throws Exception {

		HttpSession session = request.getSession();

		if(!isLogon(request, response, session)){
			throw new Exception("请重新登录");
		}

		return true;
	}

	@Override
	public void afterCompletion(HttpServletRequest request
							   ,HttpServletResponse response
							   ,Object handler
							   ,Exception ex) throws Exception {

		super.afterCompletion(request, response, handler, ex);
	}

	protected boolean isLogon(HttpServletRequest request
							 ,HttpServletResponse response
							 ,HttpSession session) {

//		if (session==null) {
//			return false;
//		}
//
//		Object obj = session.getAttribute(SystemConstant.IS_LOGON_USER);
//
//		if (obj instanceof Boolean) {
//			if((Boolean) obj) {
//				return true;
//			}
//		}

		return true;
	}
}
