
package PracticeCalendar.Config;

import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@Configuration
@ComponentScan("PracticeCalendar.*")
public class ApplicationContextConfig {

    @Bean(name = "viewResolver")
    public InternalResourceViewResolver getViewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
        viewResolver.setPrefix("/WEB-INF/jsp/");
        viewResolver.setSuffix(".jsp");
        return viewResolver;
    }

    @Bean(name = "messageSource")
    public MessageSource getMessageResource()  {
        ReloadableResourceBundleMessageSource messageResource= new ReloadableResourceBundleMessageSource();
        // Read language/messages_xxx.properties file.
        messageResource.setBasenames(new String[]{"classpath:language/messages","classpath:messages/validation"});
        messageResource.setDefaultEncoding("UTF-8");
        return messageResource;
    }

    @Bean(name = "localeResolver")
    public LocaleResolver getLocaleResolver()  {
        SessionLocaleResolver resolver= new SessionLocaleResolver();
        resolver.setDefaultLocale(new Locale("en"));
        return resolver;
    }
}
