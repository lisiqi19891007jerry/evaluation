package cn.com.nl.evaluation.info.detail;

import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.nl.evaluation.info.detail.dao.DetailInfoDao;
import cn.com.nl.framework.base.BasicController;
import cn.com.nl.framework.exception.DownloadFileNotFoundException;

/**
 * @Title ShowImageController.java
 * @Package cn.com.nl.evaluation.info.detail
 * @Description 在前台显示服务器硬盘中的图片
 * @Date 2015年10月25日 下午9:12:39
 * @Version V1.0
 */
@Scope("prototype")
@Controller
public class ShowImageController extends BasicController {

	@Autowired
	private DetailInfoDao detailInfoDao;

	@ResponseBody
	@RequestMapping(value = "/showImages")
	public void doShowImage(ModelMap model
						   ,@PathParam(value = "fileId") String fileId) throws DownloadFileNotFoundException {

		Map<String, Object> fileInfoMap = detailInfoDao.doSelectFileInfo(fileId);

		if (fileInfoMap == null || fileInfoMap.size() < 1) {
			throw new DownloadFileNotFoundException("在数据表中查不到文件记录");
		}

		FileInputStream inputStream = null;
		OutputStream outputStream   = null;

		getClienHttpResponse().setContentType("application/octet-stream;charset=UTF-8");

		try {

			inputStream  = new FileInputStream((String) fileInfoMap.get("file_path"));
			outputStream = new BufferedOutputStream(getClienHttpResponse().getOutputStream());

			byte[] data = new byte[inputStream.available()];

			inputStream.read(data);

			outputStream.write(data);
			outputStream.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				inputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			try {
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
