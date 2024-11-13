package ru.lisitsin.firstCi;


import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@RequestMapping("/main")
public class MainController {

    @GetMapping
    public String get(){
        String s = "Hello world!";
        log.info(s);
        return s;
    }
}
