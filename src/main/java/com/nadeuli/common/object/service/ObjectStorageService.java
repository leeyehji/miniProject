package com.nadeuli.common.object.service;

import org.springframework.web.multipart.MultipartFile;

import java.security.NoSuchAlgorithmException;
import java.util.List;

public interface ObjectStorageService {

	public String uploadFile(String bucketName, String folder, MultipartFile img);

	
	public void deleteFile(String bucketName, String objectName);


    String moveFile(List<String> imgArray,String MEM_ID);

	void clearTemp(String mem_id);


}
