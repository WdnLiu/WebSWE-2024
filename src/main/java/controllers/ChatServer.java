package controllers;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.server.PathParam;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import utils.DBManager;

@ServerEndpoint(value = "/chat/{username}/{dest}")
public class ChatServer {
    private static Map<String, Session> clients = new ConcurrentHashMap<>();
    private DBManager dbManager = new DBManager();

    @OnOpen
    public void onOpen(Session session, @PathParam("username") String username, @PathParam("dest") String dest) throws IOException {
        clients.put(username, session);
        session.getBasicRemote().sendText("Welcome " + username + ", Sending to " + dest);

        int sender_id = getUserId(username);
        int reciev_id = getUserId(dest);
        
        System.out.println("Welcome " + username + " with id: " + sender_id + ", Sending to " + dest + " with id: " + reciev_id);
        try {
        	System.out.println("Trying Query");
            String query = "SELECT sender_id, message FROM Chat WHERE (sender_id = ? AND reciev_id = ?) OR (sender_id = ? AND reciev_id = ?);";
            PreparedStatement preparedStatement = dbManager.prepareStatement(query);
            preparedStatement.setInt(1, sender_id);
            preparedStatement.setInt(2, reciev_id);
            preparedStatement.setInt(3, reciev_id);
            preparedStatement.setInt(4, sender_id);
            
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
            	String sender;
            	if (resultSet.getInt("sender_id") == sender_id) sender = username;
            	else sender = dest;
                session.getBasicRemote().sendText(sender + " : " + resultSet.getString("message"));
                System.out.println(sender + " : " + resultSet.getString("message"));
            }
        	System.out.println("Ending Query");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @OnMessage
    public void onMessage(String message, Session session, @PathParam("username") String username, @PathParam("dest") String dest) throws IOException {
        String[] parts = message.split(":");
        String sender = username;
        String receiver = dest;
        String messageContent = parts[1];

        storeMessageInDB(sender, receiver, messageContent);

        if (clients.containsKey(receiver)) {
            clients.get(receiver).getBasicRemote().sendText(sender + ": " + messageContent);
        }
    }

    @OnClose
    public void onClose(Session session, @PathParam("username") String username, @PathParam("dest") String dest) throws IOException {
        clients.remove(username);
    }

    private void storeMessageInDB(String sender, String receiver, String messageContent) {
        try {
            String query = "INSERT INTO Chat (sender_id, reciev_id, message) VALUES (?, ?, ?);";
            PreparedStatement preparedStatement = dbManager.prepareStatement(query);
            preparedStatement.setInt(1, getUserId(sender));
            preparedStatement.setInt(2, getUserId(receiver));
            preparedStatement.setString(3, messageContent);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private int getUserId(String username) {
        int userId = 1;
        System.out.println(username);
        try {
            String query = "SELECT id FROM Users WHERE usr = ?;";
            PreparedStatement preparedStatement = dbManager.prepareStatement(query);
            preparedStatement.setString(1, username);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                userId = resultSet.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userId;
    }
}
