package boardmapper;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FileService {
    @Autowired
    private FileMapper fileMapper;

    public void saveFile(FileDTO fileDTO) {
        fileMapper.insertFile(fileDTO);
    }

    public FileDTO getFile(int id) {
        return fileMapper.getFile(id);
    }

    public List<FileDTO> getAllFiles() {
        return fileMapper.getAllFiles();
    }
}