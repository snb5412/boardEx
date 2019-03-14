package edu.autocar.start.config;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = { "edu.autocar" })
public class MvcConfig implements WebMvcConfigurer{
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**")
			.addResourceLocations("/resources/");
	}
	
	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		registry.jsp("/WEB-INF/views/",".jsp");
	}
}
