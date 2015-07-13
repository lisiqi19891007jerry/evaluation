package cn.com.nl.framework.base;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.com.nl.framework.constant.SystemConstant;
import cn.com.nl.framework.tools.MessageUtils;

/**
 * @Title BasicController.java
 * @Package cn.com.nl.framework.base
 * @Description 基础的Controller类
 * @Author Li Siqi
 * @Date 2015年7月10日 下午10:28:11
 * @Version V1.0
 */
public class BasicController {

	private Map<String, String> screenParameterMap = null;

	private HttpServletRequest clienHttpRequest = null;
	private HttpServletResponse clienHttpResponse = null;
	private HttpSession clienHttpSession = null;

	/**
	 * 取得浏览器传入的参数
	 */
	protected Map<String, String> getScreenParameterMap() {

		if (screenParameterMap == null) {
			screenParameterMap = getParameterMap();
		}

		return screenParameterMap;
	}

	public HttpServletRequest getClienHttpRequest() {
		return clienHttpRequest;
	}

	public void setClienHttpRequest(HttpServletRequest clienHttpRequest) {
		this.clienHttpRequest = clienHttpRequest;
	}

	public HttpServletResponse getClienHttpResponse() {
		return clienHttpResponse;
	}

	public void setClienHttpResponse(HttpServletResponse clienHttpResponse) {
		this.clienHttpResponse = clienHttpResponse;
	}

	public HttpSession getClienHttpSession() {
		return clienHttpSession;
	}

	public void setClienHttpSession(HttpSession clienHttpSession) {
		this.clienHttpSession = clienHttpSession;
	}

	public void clearHttpServletObject() {
		this.clienHttpRequest = null;
		this.clienHttpResponse = null;
		this.clienHttpSession = null;
	}

	protected void setAttributeToSession(String key, Object value) {
		if (clienHttpSession != null) {
			this.clienHttpSession.setAttribute(key, value);
		}
	}

	protected void setAttributesToSession(Map<String, Object> values) {

		Iterator<String> iterator = values.keySet().iterator();

		while (iterator.hasNext()) {

			String key = iterator.next();

			this.setAttributeToSession(key, values.get(key));
		}
	}

	protected Object getAttributeFromSession(String key) {

		if (clienHttpSession != null) {
			return clienHttpSession.getAttribute(key);
		}

		return null;
	}

	protected String getParameter(String key) {
		return getClienHttpRequest().getParameter(key);
	}

	protected Map<String, String> getParameterMap() {

		Map<String, String[]> paramMap   = getClienHttpRequest().getParameterMap();
		Map<String, String> postParamMap = new HashMap<String, String>();

		TreeSet<String> keys = new TreeSet<String>(paramMap.keySet());

		Iterator<String> itKey = keys.iterator();

		while (itKey.hasNext()) {

			String key = (String) itKey.next();
			String val = "";

			Object obj = paramMap.get(key);

			if (obj instanceof Object[]) {
				for (int i = 0; i < ((Object[]) obj).length; i++) {
					if (obj != null) {
						val = (String) ((Object[]) obj)[i];
						break;
					}
				}
			} else {
				if (null != obj) {
					val = String.valueOf(obj);
				}
			}

			postParamMap.put(key, MessageUtils.convertCharset(val, SystemConstant.CHARSET_UTF8));
		}

		return postParamMap;
	}
}
