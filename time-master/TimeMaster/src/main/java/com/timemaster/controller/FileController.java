package com.timemaster.controller;

import com.timemaster.vo.Result;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@RestController
@CrossOrigin
public class FileController {
    private String uploadPath = "D:/data";

    @RequestMapping(value = "/fileupload")
    public Result fileupload(MultipartFile file, HttpServletRequest request) throws Exception, IOException {
        File folder = new File(uploadPath);
        if (!folder.isDirectory()) {
            folder.mkdirs();
        }
        // 对上传的文件重命名，避免文件重名
        String oldName = file.getOriginalFilename();
        String newName = UUID.randomUUID().toString()
                + oldName.substring(oldName.lastIndexOf("."), oldName.length());
        try {
            // 文件保存
            file.transferTo(new File(folder, newName));
            // 返回上传文件的访问路径
            String filePath = request.getScheme() + "://" + request.getServerName()
                    + ":" + request.getServerPort() + "" + request.getContextPath() + "/" + newName;
            return Result.ok().put("data", filePath);
        } catch (IOException e) {
            Result.error(e.getMessage());
        }
        return Result.error();
    }
}