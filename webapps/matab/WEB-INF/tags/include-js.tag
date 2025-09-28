<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@tag import="java.io.BufferedReader"%>
<%@tag import="java.io.FileReader"%>
<%@tag import="java.io.IOException"%>

<%@ attribute name="className" required="true" rtexprvalue="true"%>

<%
	String jsFileName = className.substring(className.lastIndexOf(".") + 1).replace("_jsp", ".js");	
	
	className = className.replace(".", "\\");

	BufferedReader br = null;
	try {
		String sCurrentLine;
		br = new BufferedReader(new FileReader(jsFileName));
		while ((sCurrentLine = br.readLine()) != null) {
			System.out.println(sCurrentLine);
		}

	} catch (IOException e) {
		e.printStackTrace();
	} finally {
		try {
			if (br != null)br.close();
		} catch (IOException ex) {
			//ex.printStackTrace();
		}
	}

 %>
 
 <h2><%=System.getProperty("user.dir") %></h2>
 <h2><%=request.getServletPath() %></h2>