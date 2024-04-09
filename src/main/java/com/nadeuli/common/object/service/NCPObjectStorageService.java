package com.nadeuli.common.object.service;

import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.AmazonS3Exception;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import spring.conf.NaverConfiguration;

import java.io.InputStream;
import java.util.List;
import java.util.UUID;

@Service
public class NCPObjectStorageService implements ObjectStorageService {
	final AmazonS3 s3;

	public NCPObjectStorageService(NaverConfiguration naverConfiguration) {
		s3 = AmazonS3ClientBuilder.standard()
				.withEndpointConfiguration(new AwsClientBuilder.EndpointConfiguration(naverConfiguration.getEndPoint(),
						naverConfiguration.getRegionName()))
				.withCredentials(new AWSStaticCredentialsProvider(
						new BasicAWSCredentials(naverConfiguration.getAccessKey(), naverConfiguration.getSecretKey())))
				.build();
	}

	@Override
	public String uploadFile(String bucketName, String folder, MultipartFile img) {
		if(img.isEmpty()) return null;
			
		try (InputStream fileIn = img.getInputStream()){
			String originalFileName = img.getOriginalFilename();
			String imageFileName = UUID.randomUUID().toString();
			imageFileName += originalFileName.substring(originalFileName.lastIndexOf("."));
			
			ObjectMetadata objectMetadata = new ObjectMetadata();
			objectMetadata.setContentType(img.getContentType());
			
			PutObjectRequest putObjectRequest = 
			new PutObjectRequest(bucketName, folder+imageFileName,fileIn,objectMetadata).withCannedAcl(CannedAccessControlList.PublicRead);;
			
			s3.putObject(putObjectRequest);
			
			
			return imageFileName;
			
			
		}catch(Exception e){
			throw new RuntimeException("파일 업로드 에러 " + e );
			//e.printStackTrace(); //return 타입이 String이기 때문에 에러발생
			
		}
		
		
		
		
	}

	@Override
	public void deleteFile(String bucketName, String objectName) {
		
		String realName = "storage/"+objectName;
	
		// delete object
		try {
		    s3.deleteObject(bucketName , realName);
		    System.out.format("Object %s has been deleted.\n", realName);
		} catch (AmazonS3Exception e) {
		    e.printStackTrace();
		} catch(SdkClientException e) {
		    e.printStackTrace();
		}
	}

	
	
	@Override
	public void deleteFileSUB(String bucketName, String folder, String imageFileName) {
		
		s3.deleteObject(bucketName,folder+imageFileName);
		
	}

	@Override
	public void deleteFile(String bucketName, List<String> list) {
		
		for(String imageFile : list) {
			String realName = "storage/"+imageFile;
			
			// delete object
			try {
			    s3.deleteObject(bucketName , realName);
			    System.out.format("Object %s has been deleted.\n", realName);
			} catch (AmazonS3Exception e) {
			    e.printStackTrace();
			} catch(SdkClientException e) {
			    e.printStackTrace();
			}
			
		}
		
	}

}
