package cn.com.nl.evaluation.info.detail;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Map;

import org.apache.commons.io.FileUtils;
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
	 */
	@RequestMapping(value = "/detail/download")
	public ResponseEntity<byte[]> doShowDetailInfo(ModelMap model
												  ,@RequestParam(value = "fileID", required = false) String fileID) {

		Map<String, Object> fileInfoMap   = detailInfoDao.doSelectFileIndo(fileID);

		File file = new File((String) fileInfoMap.get("file_path"));

		String fileName = (String) fileInfoMap.get("file_name");
		String fileExt  = (String) fileInfoMap.get("file_extension");

		fileName = fileName + "." + fileExt;

		try {
			fileName = new String(fileName.getBytes("UTF-8"), "iso-8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		HttpHeaders headers = new HttpHeaders();

		headers.setContentDispositionFormData("attachment", fileName);
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

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
