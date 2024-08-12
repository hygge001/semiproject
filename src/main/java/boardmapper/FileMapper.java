package boardmapper;

import java.util.List;

public interface FileMapper {
    void insertFile(FileDTO fileDTO);
    FileDTO getFile(int id);
    List<FileDTO> getAllFiles();
}