<%@page import="java.util.List"%>
<%@page import="dto.User"%>
<%@page import="dto.TrainTicket"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Booked Tickets</title>
</head>
<body>
<% User user=(User)session.getAttribute("user"); %>
<%if(user==null){
response.getWriter().print("<h1 style='color:red'>Session Expired login again</h1>");	
request.getRequestDispatcher("Login.html").include(request, response);
}
else{
%>
<%List<TrainTicket> list = user.getTickets();
if((list == null || list.isEmpty())){
	response.getWriter().print("<h1 style='color:red'>Session Expired login again</h1>");	
	request.getRequestDispatcher("UserHome.html").include(request, response);
}
else{
	%>

<table border="1">

<tr>

<th>PNR NO.</th>
<th>Train Number</th>
<th>UserName</th>
<th>From</th>
<th>To</th>
<th>Price</th>
<th>Date of Booking</th>
<th>Date of Journey</th>
<th>Status</th>
<th>Action</th>
<th></th>

</tr>
<%for(TrainTicket ticket : list){ %>
<tr>

<th><%ticket.getPnr(); %></th>
<th><% ticket.getTrainNumber();%></th>
<th><%user.getFirstName();%></th>
<th><%ticket.getSource(); %></th>
<th><%ticket.getDestination(); %></th>
<th><%ticket.getAmount() ;%></th>
<th><%ticket.getDateOfBooking(); %></th>
<th><%ticket.getDateOfJourney(); %></th>
<th><%ticket.getStatus();%></th>
<%if(ticket.getStatus().equals("Booked")){ %>
<th><a href="cancelticket?pnr=<%ticket.getPnr(); %>"><button>Cancel</button></a></th>
<%} else{
%>
<button disabled="disabled">cancel</button>
<%} %>
</tr>



</table>
<% }}} %>
</body>
</html>