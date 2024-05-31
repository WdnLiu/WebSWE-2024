package controllers;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.websocket.server.ServerContainer;
import javax.websocket.server.ServerEndpointConfig;

@WebListener
public class WebSocketConfig implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent event) {
        ServerContainer serverContainer = (ServerContainer) event.getServletContext().getAttribute("javax.websocket.server.ServerContainer");
        try {
            serverContainer.addEndpoint(ServerEndpointConfig.Builder.create(ChatServer.class, "/chat/{username}/{dest}").build());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        // Cleanup code if needed
    }
}
