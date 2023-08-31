package com.example.fileupload.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

@Controller
public class fileupload {
    @GetMapping("/")
    public ModelAndView index(HttpServletRequest request,
                              HttpServletResponse response) throws Exception {
        System.out.println("시작");
        ModelAndView mav = new ModelAndView("/index");
        return mav;
    }

    //전달받은 파일을 읽어와서 처리
    @PostMapping("/upload")
    public ModelAndView upload(@RequestParam("file") MultipartFile uploadFile,
                               HttpServletRequest request,
                               HttpServletResponse response) throws Exception {
        //@RequestParam("file")=><input name="file"...
        //uploadFile은 input으로 전달된 이름을 저장하는 변수
        String fileName = uploadFile.getOriginalFilename();
        //파일의 위치 및 이름 정보를 읽어온다.(클라이언트에서 지정한)
        //a.jpg                                   images뒤에 /를 입력해줘야 images 폴더 안에 들어감
        String filePath = request.getSession().getServletContext().getRealPath("/images/");
        //서버에서 webapp의 위치 + images 폴더를 읽어온다.
        //fileupload/src/main/webapp/images/

        try {
            uploadFile.transferTo(new File(filePath + fileName));
            System.out.println("이미지 업로드 성공");
        } catch (IllegalStateException | IOException e) { //파일 상태 및 저장 오류
            e.printStackTrace();
        }

        ModelAndView mav = new ModelAndView("/imageview");
        mav.addObject("file", fileName);
        return mav;
    }
}
