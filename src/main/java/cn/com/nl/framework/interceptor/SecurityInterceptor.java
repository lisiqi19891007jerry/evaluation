package cn.com.nl.framework.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.com.nl.framework.constant.SystemConstant;
import cn.com.nl.framework.exception.AuthorizationException;

public class SecurityInterceptor extends HandlerInterceptorAdapter {

	/**
	 * 重写 preHandle()方法，在业务处理器处理请求之前对该请求进行拦截处理
	 */
	@Override
	public boolean preHandle(HttpServletRequest request
							,HttpServletResponse response
							,Object handler) throws AuthorizationException {

		if(!isLoginSuccess(request, response)){
			throw new AuthorizationException("请重新登录");
		}

		return true;
	}

	/**
	 *
	 * 判断用户session中的登录标志是否有值
	 * true标识已经成功登录
	 *
	 * @param request
	 * @param response
	 * @return
	 */
	private boolean isLoginSuccess(HttpServletRequest request
								  ,HttpServletResponse response) {

		HttpSession session = request.getSession();

		if (session==null) {
			return false;
		}

		Object obj = session.getAttribute(SystemConstant.IS_LOGON_USER);

		if (obj instanceof Boolean) {
			if((Boolean) obj) {
				return true;
			}
		}

		return false;
	}
}
