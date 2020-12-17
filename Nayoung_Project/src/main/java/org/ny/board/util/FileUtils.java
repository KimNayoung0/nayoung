package org.ny.board.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.ny.board.model.vo.Board;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component("fileUtils")
public class FileUtils { // 첨부파일의 정보를 이용하여 여러가지 조작을 할 클래스

	private static final String filePath = "C:\\mp\\file\\"; // 파일이 저장될 위치

	public List<Map<String, Object>> parseInsertFileInfo(Board b, MultipartHttpServletRequest upFile) throws Exception {

		/*
		 * Iterator은 데이터들의 집합체? 에서 컬렉션으로부터 정보를 얻어올 수 있는 인터페이스입니다. List나 배열은 순차적으로 데이터의
		 * 접근이 가능하지만, Map등의 클래스들은 순차적으로 접근할 수가 없습니다. Iterator을 이용하여 Map에 있는 데이터들을
		 * while문을 이용하여 순차적으로 접근합니다.
		 */

		Iterator<String> iterator = upFile.getFileNames(); // getFileNames()는 input태그에서 name이 file 속성

		MultipartFile multipartFile = null;
		String orgFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		int bCode = b.getbCode();

		File file = new File(filePath);
		if (file.exists() == false) { // multipartFile이 비어있지 않으면 if문을 타게 되는데 새로운 첨부파일이 등록되었을 때 타게됩니다.
			file.mkdirs();
		}

		while (iterator.hasNext()) {
			multipartFile = upFile.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				orgFileName = multipartFile.getOriginalFilename();
				originalFileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;

				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("bCode", bCode + 1); // 게시글의 bCode가 1씩 많게 나오길래 +1을 해줌
				listMap.put("orgFileName", orgFileName);
				listMap.put("storedFileName", storedFileName);
				listMap.put("fileSize", multipartFile.getSize());

				list.add(listMap);

			}

		}

		return list;
	}

	public static String getRandomString() { // 32글자의 랜덤한 문자열을 만들어서 반환해주는 기능
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

	public List<Map<String, Object>> parseUpdateFileInfo(Board b, String[] files, String[] fileNames,
			MultipartHttpServletRequest upFile) throws Exception {
		
		Iterator<String> iterator = upFile.getFileNames();
		MultipartFile multipartFile = null;
		
		String orgFileName = null;
		String orgFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String,Object> listMap = null;
		
		int bCode = b.getbCode();
		
		while(iterator.hasNext()) {
			multipartFile = upFile.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				orgFileName = multipartFile.getOriginalFilename();
				orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
				storedFileName = getRandomString() + orgFileExtension;
				multipartFile.transferTo(new File(filePath + storedFileName));
				
				listMap = new HashMap<String,Object>();
				listMap.put("IS_NEW", "Y");
				listMap.put("bCode", bCode);
				listMap.put("orgFileName", orgFileName);
				listMap.put("storedFileName", storedFileName);
				listMap.put("fileSize", multipartFile.getSize());
				list.add(listMap);
			}
		}
		if(files != null && fileNames != null) {
			for(int i=0; i<fileNames.length;i++) {
				listMap = new HashMap<String,Object>();
				listMap.put("IS_NEW", "N");
				listMap.put("fCode", files[i]);
				list.add(listMap);
				
			}
		}
		
		
		
		return list;
	}

}
