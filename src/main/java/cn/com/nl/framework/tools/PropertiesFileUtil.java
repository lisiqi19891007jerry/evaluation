package cn.com.nl.framework.tools;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Properties;

import org.apache.commons.lang3.StringUtils;

import cn.com.nl.framework.constant.SystemConstant;

public class PropertiesFileUtil {

	public static Properties getProperties(String fileName) {

		if (StringUtils.isBlank(fileName)) {
			return null;
		}

		InputStream propertiesInputStream = getPropertiesFileInputStream(fileName);

		Properties prop = new Properties();

		try {
			prop.load(propertiesInputStream);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (propertiesInputStream != null) {
					propertiesInputStream.close();
					propertiesInputStream = null;
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return prop;
	}

	private static InputStream getPropertiesFileInputStream(String configFile) {

		InputStream in = null;

		String path = "";

		try {

			path = URLDecoder.decode(PropertiesFileUtil.class.getResource(configFile).getFile()
									,SystemConstant.CHARSET_UTF8);

			in = new BufferedInputStream(new FileInputStream(path));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		return in;
	}
}
