package com.ds;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
//mapper接口位置
@MapperScan("com.ds.*.mapper")
@SpringBootApplication
public class ManagementApplication  extends SpringBootServletInitializer {

    public static void main(String[] args) {
        SpringApplication.run(ManagementApplication.class, args);
    }

    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(ManagementApplication.class);
    }

}
