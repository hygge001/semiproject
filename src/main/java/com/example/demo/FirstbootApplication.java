package com.example.demo;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "boardmapper")
@MapperScan(basePackages = "boardmapper")
public class FirstbootApplication {

	public static void main(String[] args) {
		SpringApplication.run(FirstbootApplication.class, args);
	}

}
