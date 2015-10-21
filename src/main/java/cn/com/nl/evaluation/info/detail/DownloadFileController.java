package cn.com.nl.evaluation.info.detail;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.com.nl.evaluation.info.detail.dao.DetailInfoDao;
import cn.com.nl.framework.base.BasicController;
import cn.com.nl.framework.exception.DownloadFileNotFoundException;

@Scope("prototype")
@Controller
public class DownloadFileController extends BasicController {

	@Autowired
	private DetailInfoDao detailInfoDao;

	/**
	 *
	 * 根据URL请求跳转到detailInfo.jsp画面
	 *
	 * @param model
	 * @return
	 * @throws DownloadFileNotFoundException 如果文件不存在的情况下，抛出异常
	 */
	@RequestMapping(value = "/detailInfo/download")
	public ResponseEntity<byte[]> doShowDetailInfo(ModelMap model
												  ,@RequestParam(value = "fileID", required = false) String fileID)
												  throws DownloadFileNotFoundException {

		Map<String, Object> fileInfoMap = detailInfoDao.doSelectFileIndo(fileID);

		if (fileInfoMap == null || fileInfoMap.size() < 1) {
			throw new DownloadFileNotFoundException("在数据表中查不到文件记录");
		}

		File file = new File((String) fileInfoMap.get("file_path"));

		String fileName = (String) fileInfoMap.get("file_name");
		String fileExt  = (String) fileInfoMap.get("file_extension");

		fileName = StringUtils.substring(fileName, 15) + "." + fileExt;

		try {
			fileName = new String(fileName.getBytes("UTF-8"), "iso-8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		HttpHeaders headers = new HttpHeaders();

		headers.setContentDispositionFormData("attachment", fileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

		if (file.exists()) {
			throw new DownloadFileNotFoundException("《" + fileName + "》文件不存在！");
		}

		ResponseEntity<byte[]> entity = null;

		try {
			entity = new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file)
											   ,headers
											   ,HttpStatus.CREATED);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return entity;
	}
}
