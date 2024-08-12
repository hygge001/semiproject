package boardmapper;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class FileController {
    @Autowired
    private FileService fileService;

    @GetMapping("/upload")
    public String showUploadForm(Model model) {
        return "communityboard/writeform";
    }

    @PostMapping("/upload")
    public String uploadFile(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {
        try {
            FileDTO fileDTO = new FileDTO();
            fileDTO.setFileName(file.getOriginalFilename());
            fileDTO.setFileData(file.getBytes());
            fileService.saveFile(fileDTO);
            redirectAttributes.addFlashAttribute("message", "파일 업로드 성공");
        } catch (IOException e) {
            redirectAttributes.addFlashAttribute("message", "파일 업로드 실패");
        }
        return "redirect:/upload";
    }

    @GetMapping("/files")
    public String listFiles(Model model) {
        List<FileDTO> files = fileService.getAllFiles();
        model.addAttribute("files", files);
        return "upload/fileList";
    }

    @GetMapping("/download/{id}")
    public void downloadFile(@PathVariable int id, HttpServletResponse response) {
        FileDTO fileDTO = fileService.getFile(id);
        if (fileDTO != null) {
            response.setContentType("application/octet-stream");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + fileDTO.getFileName() + "\"");
            try (OutputStream os = response.getOutputStream()) {
                os.write(fileDTO.getFileData());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}