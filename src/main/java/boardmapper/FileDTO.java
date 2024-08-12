package boardmapper;

import java.util.Base64;

public class FileDTO {
    private int id;
    private String fileName;
    private byte[] fileData;
    private String uploadTime;
    private String imageBase64;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public byte[] getFileData() {
        return fileData;
    }

    public void setFileData(byte[] fileData) {
        this.fileData = fileData;
    }

    public String getUploadTime() {
        return uploadTime;
    }

    public void setUploadTime(String uploadTime) {
        this.uploadTime = uploadTime;
    }
    
    // 이미지를 Base64로 변환하는 메서드
    public void setImageBase64(byte[] fileData) {
        String base64 = Base64.getEncoder().encodeToString(fileData);
        this.imageBase64 = base64;
    }

    public String getImageBase64() {
        return imageBase64;
    }

	@Override
	public String toString() {
		return "FileDTO [id=" + id + ", fileName=" + fileName + ", fileData=" + fileData + ", uploadTime=" + uploadTime +"]";
	}
	
}
