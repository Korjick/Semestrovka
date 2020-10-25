package ru.itlab.servlets;

import ru.itlab.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 05.10.2020
 * 4. Simple Web Application
 *
 * @author Sidikov Marsel (First Software Engineering Platform)
 * @version v1.0
 */

// TODO: пределать на использование findAll у репозитория
@WebServlet("/users")
public class UsersServlet extends HttpServlet {

    private List<User> users;

    @Override
    public void init() throws ServletException {
        users = new ArrayList<>();
        User user1 = User.builder()
                .id(1L)
                .firstName("Marsel")
                .lastName("Sidikov")
                .age(26)
                .build();

        User user2 = User.builder()
                .id(2L)
                .firstName("Danil")
                .lastName("Barkov")
                .age(18)
                .build();

        User user3 = User.builder()
                .id(3L)
                .firstName("Danis")
                .lastName("Zinnatullin")
                .age(19)
                .build();

        users.add(user1);
        users.add(user2);
        users.add(user3);

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        PrintWriter writer = resp.getWriter();
//
//        StringBuilder resultHtml = new StringBuilder();
//
//        resultHtml.append("<!DOCTYPE html>\n" +
//                "<html lang=\"en\">\n" +
//                "<head>\n" +
//                "    <meta charset=\"UTF-8\">\n" +
//                "    <title>Users</title>\n" +
//                "</head>\n" +
//                "<body>\n" +
//                "<h1>Users</h1>\n" +
//                "<div>\n" +
//                "    <table>\n" +
//                "        <tr>\n" +
//                "            <th>ID</th>\n" +
//                "            <th>FIRST NAME</th>\n" +
//                "            <th>LAST NAME</th>\n" +
//                "            <th>AGE</th>\n" +
//                "        </tr>\n");
//
//        for (User user : users) {
//            resultHtml.append("<tr>\n");
//            resultHtml.append("<td>").append(user.getId()).append("</td>\n");
//            resultHtml.append("<td>").append(user.getFirstName()).append("</td>\n");
//            resultHtml.append("<td>").append(user.getLastName()).append("</td>\n");
//            resultHtml.append("<td>").append(user.getAge()).append("</td>\n");
//            resultHtml.append("</tr>");
//        }
//        resultHtml.append("    </table>\n" +
//                "</div>\n" +
//                "</body>\n" +
//                "</html>");
//
//        writer.write(resultHtml.toString());
        req.setAttribute("usersForJsp", users);
        req.getRequestDispatcher(req.getContextPath() + "/jsp/users.jsp").forward(req, resp);
    }
}
