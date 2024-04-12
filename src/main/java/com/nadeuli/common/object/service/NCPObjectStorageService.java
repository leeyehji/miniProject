package com.nadeuli.common.object.service;

import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.client.builder.AwsClientBuilder;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.*;
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
		

	
		// delete object
		try {
		    s3.deleteObject(bucketName , objectName);
		    System.out.format("Object %s has been deleted.\n", objectName);
		} catch (AmazonS3Exception e) {
		    e.printStackTrace();
		} catch(SdkClientException e) {
		    e.printStackTrace();
		}
	}

	@Override
	public String moveFile(List<String> imgArray) {
		String bucket = "miniproject";
		String B_THUMBNAIL = "";
		String oldSource;
		String newSource;
		for(int i=0 ; i< imgArray.size(); i++){
			String imgURL=imgArray.get(i);
			if(i==0){
				imgURL=imgURL.replace("[","");
			}else if(i == imgArray.size()-1){
				imgURL=imgURL.replace("]","");
			}

			imgURL=imgURL.replace("\"","");
			oldSource=imgURL.replace("https://kr.object.ncloudstorage.com/miniproject/","");
			newSource=oldSource.replace("temp","success");

			CopyObjectRequest copyObjRequest = new CopyObjectRequest(bucket, oldSource, bucket, newSource);
			s3.copyObject(copyObjRequest);

			B_THUMBNAIL=imgURL;
			System.out.println(B_THUMBNAIL);
		}
		return B_THUMBNAIL;
	}

	@Override
	public void clearTemp(String mem_id) {
		String bucketName = "miniproject";
		String path = "storage/review/"+mem_id+"/temp/";

		try {

			ObjectListing objectListing = s3.listObjects(bucketName,path);

			System.out.println("File List:");
			for (S3ObjectSummary objectSummary : objectListing.getObjectSummaries()) {
				deleteFile(bucketName,objectSummary.getKey());
			}
		} catch (AmazonS3Exception e) {
			e.printStackTrace();
		} catch(SdkClientException e) {
			e.printStackTrace();
		}

	}


}
