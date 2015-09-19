package cn.com.nl.framework.exception;

/**
 * @Title AuthorizationException.java
 * @Package cn.com.nl.framework.exception
 * @Description 用例登录验证异常
 * @Date 2015年8月29日 下午12:11:21
 * @Version V1.0
 */
public class AuthorizationException extends Exception {

	private static final long serialVersionUID = 1L;

    public AuthorizationException() {
        super();
    }

    public AuthorizationException(String message) {
        super(message);
    }

    public AuthorizationException(String message, Throwable cause) {
        super(message, cause);
    }

    public AuthorizationException(Throwable cause) {
        super(cause);
    }

    protected AuthorizationException(String message
    								,Throwable cause
    								,boolean enableSuppression
    								,boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
