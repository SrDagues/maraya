package loginServlet;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */                  



import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import maraya.ejb.UsuariosMedicosFacade;
import maraya.entity.UsuariosMedicos;
import maraya.entity.UsuariosPacientes;

/**
 *
 * @author Portatil
 */
@WebServlet(urlPatterns = {"/LoginMedico"})
public class LoginMedicoServlet extends HttpServlet {

    @EJB
    private UsuariosMedicosFacade usuariosMedicosFacade;
            
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginUsuarioServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginUsuarioServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        PrintWriter out;
        
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        
        List<UsuariosMedicos> users = null;
        UsuariosMedicos user = null;
        //out = response.getWriter();
        
        users = usuariosMedicosFacade.login(usuario, password);
        
        out = response.getWriter();
        
        if(users != null && users.size() > 0) user = users.get(0);
        
        if(user == null) out.println("El usuario o contraseña introducidos son incorrectos");
        else{
            HttpSession miSesion = request.getSession(true);            
            Object currentUser = miSesion.getAttribute("usuario");
            
            if (currentUser != null) {
                miSesion.invalidate();
            }
                
            miSesion.setAttribute("usuario", user);
            miSesion.setAttribute("tipoUsuario", "medico");
                
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
            dispatcher.forward(request, response);
            
        }
        
        out.close();
        
    }

    // @todo Cerrar sesion - Logout
    
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
