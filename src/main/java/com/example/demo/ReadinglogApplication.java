package com.example.demo;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;


@SpringBootApplication

@ComponentScan(basePackages = "readinglog")
public class ReadinglogApplication {

	public static void main(String[] args) {
		SpringApplication.run(ReadinglogApplication.class, args);
	}

}
