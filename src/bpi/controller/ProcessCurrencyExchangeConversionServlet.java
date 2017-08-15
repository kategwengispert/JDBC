package bpi.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bpi.model.ForexBean;

@WebServlet("/processcurrencyexchange.html")
public class ProcessCurrencyExchangeConversionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String exceptionMessage = "";
		int exceptionFlagTrigger = 0; //0 means no error, 1 means there is an error
		try {			
			int pesoAmount = (request.getParameter("pesoAmount") != null)
				? Integer.parseInt(request.getParameter("pesoAmount"))
				: 0;
			
			String currencyType =(request.getParameter("currencyType") != null)
				? request.getParameter("currencyType")
				: null;		
				
			/*
			  aside from the servlet getting the data from the form, the servlet,
			  it also checks for missing parameters and malformed data
			*/
			if (pesoAmount < 1000) {
				exceptionMessage +="Invalid amount - must be a number and "
					+ "must be at least Php1,000.00 pesos.";
				exceptionFlagTrigger = 1;
			}
			
			if (currencyType != null) {
				switch (currencyType) {
					case "USD": case "EUR": case "JPY": case "AUD": break;
					default:
						exceptionMessage += "<br/>Invalid currency type";
						exceptionFlagTrigger = 1;
						break;
				}
			} else {
				exceptionMessage += "<br/>Missing currency type.";
				exceptionFlagTrigger = 1;
			}
			
			if (exceptionFlagTrigger != 1) { //all are valid input data
				//step 3 - instantiate the bean, populate the bean
				//and call the business logic methods
				ForexBean forex = new ForexBean();
				forex.setPesoAmount(pesoAmount);
				forex.setCurrencyType(currencyType);
				forex.compute();
				forex.insertRecord();
				
				//step 4 - perform binding name is forex on forex as object
				 request.setAttribute("forex", forex);
				 
				 //save this transaction to our database table
			}
		} catch (NumberFormatException nfe) {
			exceptionMessage += "<br/>Invalid input for Philippine peso amount - "
				+ "must integer positive number.";
			
			//step 4 - perform binding
			request.setAttribute("errmsg", exceptionMessage);
			
			
			
			
		} catch (RuntimeException re) {
			//step 4 - perform binding
			request.setAttribute("errmsg", exceptionMessage);
		}
		
		//step 5 - forward the request to the JSP
		request.getRequestDispatcher((exceptionFlagTrigger == 0)
			? "display.jsp":"error.jsp").forward(request, response);
	}
}
