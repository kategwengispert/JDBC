package bpi.util;

public interface SQLCommand {
	String INSERT_REC = "Insert into forex(pesoAmount, currencyType, result, message) values (?,?,?,?)";
	
	String GET_ALL_RECORDS = "Select * from forex";
}
