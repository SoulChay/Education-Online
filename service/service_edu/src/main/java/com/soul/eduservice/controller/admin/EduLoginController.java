package com.soul.eduservice.controller.admin;

import com.soul.commonutils.response.R;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/eduservice/user")
public class EduLoginController {

    //login
    @PostMapping("login")
    public R login(){
        return R.ok().data("token","admin");
    }

    //info
    @GetMapping("info")
    public R info(){
        return R.ok()
                .data("roles","[admin]")
                .data("name","admin")
                .data("avatar","https://avatars0.githubusercontent.com/u/17878390?s=400&v=4");
    }

}
