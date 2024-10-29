<%@page import="java.util.ArrayList"%>
<!--Call Service Agent Page-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <link rel="stylesheet" href="./CSS/styling.css"/>
        <link rel="stylesheet" href="./CSS/clientHomePage.css"/>
    </head>
    <body>
        <header>
            
            <%
                // The following will check if the user that is directed to this page
                // is logged in, it will also check if they are a valid user.
                String[] userDetails = (String[]) session.getAttribute("userDetails");
                String userType = (String) session.getAttribute("userType");
                String fullName = "";
                if(userDetails != null)
                {
                    if(userType.equals("CSA"))
                    {
                        // If the user exists, they will receive access
                        fullName= userDetails[1] + " " + userDetails[2];
                    }
                    else
                    {
                        // If they do not exist they will receive an error.
                        response.sendRedirect("./?Error=Incorrect user type");
                    }
                    
                }
                else
                {
                    // If they do not exist they will receive an error.
                    response.sendRedirect("./?Error=Please log in first");
                }
                
            %>
            
            
            <!--Title Bar-->
            <div>
                <!-- Div that contains the title-->
                <div id="top-ribbon">
                    <img src="./Images/Logo.png" alt="Logo" id="logo"/>
                    <h1 id="title">Home Page</h1>
                    
                    <div id="info-container">
                        
                        <h2 id="username">User: <%= fullName %></h2>
                        <!--The following form is used to sign the user out, by requesting a POST method-->
                        <form name="sign_out" action="signOut" method="POST" id="sign_out">
                            <input type="submit" value="Sign Out" name="btn_signOut" id="btn_SignOut"/>
                        </form>
                    </div>
                </div>

                <!--Navigation Bar-->
                <nav id="nav-container">
                    <ul id="list-container">
                        <li class="link-container"><a href="#" class="links" id="current-page">Home</a></li>
                        <li class="link-container"><a href="#" class="links">Clients</a></li>
                        <li class="link-container"><a href="#" class="links">Technicians</a></li>
                    </ul>
                </nav>
                
            </div>
            
        </header>
        <section>
            <!--Section that will contain information-->
            
            <div id="main-container">
                <ul class="info-container">
                    <li class="serviceItem"><h1 class="titleOfBlock" id="ready-title">Ready</h1></li>
                    <li class="serviceItem" id="itemTitle-list">
                        <div id="title-list" class="list-container">
                            
                            <p class="info-text">Service ID</p>
                            <p class="info-text">Service Title</p>
                            <p class="info-text">Technician Name</p>
                            <p class="info-text">Service Status</p>
                            <p class="info-text"></p>
                            
                        </div>
                        
                        
                    </li>
                    <%
                    
                        ArrayList<String[]> services = (ArrayList<String[]>) request.getAttribute("serviceInfo");
                        
                        System.out.println("Service: " + request.getAttribute("serviceInfo"));
                        
                        Integer i = 1;
                        
                        if(services != null)
                        {
                            for(var service : services)
                            {
                                if(service[4].equals("Closed by Technician"))
                                {
                                    out.println("<li class=\"serviceItem\"><form name=\"viewMore-" + (i) + "\" action=\"viewMoreDetails\" method=\"Get\"><div class=\"list-container\">" + 
                                    "<p class=\"info-text\">" + service[0] + "</p>" +
                                    "<p class=\"info-text\">" + service[1] + "</p>" +
                                    "<p class=\"info-text\">" + service[2] + " " + service[3] + "</p>" +
                                    "<p class=\"info-text\">" + service[4] + "</p>" +

                                    "<input type=\"submit\" value=\"View Details\" name=\"btn-ViewDetails\" />" +
                                    "<div></form>" +
                                    "<form name=\"viewSurvey-" + (i++) + "\" action=\"viewSurvey\" method=\"Get\"><div class=\"list-container\">" +
                                    
                                    "<input type=\"hidden\" name=\"hidden-ServiceID\" value=\""+ service[0] +"\" size=\"15\" readonly=\"readonly\" />" +
                                    "<input type=\"submit\" value=\"Complete Survey\" name=\"btn-ViewDetails\" />" +
                                    
                                    "<div></form>" +
                                    "</li>");
                                }
                            }
                        }
                    %>
                </ul>
                <ul class="info-container">
                    <li class="serviceItem"><h1 class="titleOfBlock" id="ongoing-title">Ongoing</h1></li>
                    <li class="serviceItem" id="itemTitle-list">
                        <div id="title-list" class="list-container">
                            
                            <p class="info-text">Service ID</p>
                            <p class="info-text">Service Title</p>
                            <p class="info-text">Technician Name</p>
                            <p class="info-text">Service Status</p>
                            <p class="info-text"></p>
                            
                        </div>
                    </li>
                    <%
                        
                        System.out.println("Service: " + request.getAttribute("serviceInfo"));
                        
                        if(services != null)
                        {
                            for(var service : services)
                            {
                                if(service[4].equals("Ongoing"))
                                {
                                    out.println("<li class=\"serviceItem\"><form name=\"viewMore-" + (i) + "\" action=\"viewMoreDetails\" method=\"Get\"><div class=\"list-container\">" + 
                                    "<p class=\"info-text\">" + service[0] + "</p>" +
                                    "<p class=\"info-text\">" + service[1] + "</p>" +
                                    "<p class=\"info-text\">" + service[2] + " " + service[3] + "</p>" +
                                    "<p class=\"info-text\">" + service[4] + "</p>" +

                                    "<input type=\"submit\" value=\"View Details\" name=\"btn-ViewDetails\" />" +
                                    "<div></form>" +
                                    "<form name=\"viewSurvey-" + (i++) + "\" action=\"viewSurvey\" method=\"Get\"><div class=\"list-container\">" +
                                    
                                    "<input type=\"hidden\" name=\"hidden-ServiceID\" value=\""+ service[0] +"\" size=\"15\" readonly=\"readonly\" />" +
                                    "<input type=\"submit\" value=\"Complete Survey\" name=\"btn-ViewDetails\" />" +
                                    
                                    "<div></form>" +
                                    "</li>");
                                }
                            }
                        }
                    %>
                </ul>
                <ul class="info-container">
                    <li class="serviceItem"><h1 class="titleOfBlock" id="pending-title">Pending</h1></li>
                    <li class="serviceItem" id="itemTitle-list">
                        <div id="title-list" class="list-container">
                            
                            <p class="info-text">Service ID</p>
                            <p class="info-text">Service Title</p>
                            <p class="info-text">Technician Name</p>
                            <p class="info-text">Service Status</p>
                            <p class="info-text"></p>
                            
                        </div>
                    </li>
                    <%
                        
                        System.out.println("Service: " + request.getAttribute("serviceInfo"));
                        
                        if(services != null)
                        {
                            for(var service : services)
                            {
                                if(service[4].equals("Pending"))
                                {
                                    out.println("<li class=\"serviceItem\"><form name=\"viewMore-" + (i) + "\" action=\"viewMoreDetails\" method=\"Get\"><div class=\"list-container\">" + 
                                    "<p class=\"info-text\">" + service[0] + "</p>" +
                                    "<p class=\"info-text\">" + service[1] + "</p>" +
                                    "<p class=\"info-text\">" + service[2] + " " + service[3] + "</p>" +
                                    "<p class=\"info-text\">" + service[4] + "</p>" +

                                    "<input type=\"submit\" value=\"View Details\" name=\"btn-ViewDetails\" />" +
                                    "<div></form>" +
                                    "<form name=\"viewSurvey-" + (i++) + "\" action=\"viewSurvey\" method=\"Get\"><div class=\"list-container\">" +
                                    
                                    "<input type=\"hidden\" name=\"hidden-ServiceID\" value=\""+ service[0] +"\" size=\"15\" readonly=\"readonly\" />" +
                                    "<input type=\"submit\" value=\"Complete Survey\" name=\"btn-ViewDetails\" />" +
                                    
                                    "<div></form>" +
                                    "</li>");
                                }
                            }
                        }
                    %>
                </ul>
            </div>
            
        </section>
        <footer>
            <!--Section that will contain icons used to direct users to contacts or chat websites-->
            
        </footer>       
    </body>
</html>
