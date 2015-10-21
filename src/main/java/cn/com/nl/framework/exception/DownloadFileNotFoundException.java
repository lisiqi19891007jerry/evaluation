package cn.com.nl.framework.exception;

/**
 * @Title DownloadFileNotFoundException.java
 * @Package cn.com.nl.framework.exception
 * @Description 下载文件不存在异常
 * @Date 2015年10月21日 下午5:48:51
 * @Version V1.0
 */
public class DownloadFileNotFoundException extends Exception {

	private static final long serialVersionUID = 1L;

    public DownloadFileNotFoundException() {
        super();
    }

    public DownloadFileNotFoundException(String message) {
        super(message);
    }

    public DownloadFileNotFoundException(String message, Throwable cause) {
        super(message, cause);
    }

    public DownloadFileNotFoundException(Throwable cause) {
        super(cause);
    }

    protected DownloadFileNotFoundException(String message
    									   ,Throwable cause
    									   ,boolean enableSuppression
    									   ,boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }
}
