package com.nadeuli.map;

import org.springframework.web.context.ContextLoaderListener;
import javax.servlet.ServletContextEvent;

public class CustomContextLoaderListener extends ContextLoaderListener {

    @Override
    public void contextInitialized(ServletContextEvent event) {
        try {
            super.contextInitialized(event);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}