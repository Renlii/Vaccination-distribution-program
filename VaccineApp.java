import java.sql.* ;
import java.util.Date;
import java.util.Scanner;
import java.text.*;

public class VaccineApp {

    private static Scanner scan = new Scanner(System.in);
    private static Connection connection = null;
    private static Statement statement = null;
    private static ResultSet output;
    private static int status = 0;

    /*
    main menu prompt
    @throws SQLException
     */
    private static void mainMenu() throws SQLException{
        System.out.println("VaccineApp Main Menu");
        System.out.println("\t\t\t 1. Add a Person");
        System.out.println("\t\t\t 2. Assign a slot to a Person");
        System.out.println("\t\t\t 3. Enter Vaccination information");
        System.out.println("\t\t\t 4. Exit Application");
        System.out.println("Please Enter Your Option:");

        switch (scan.nextLine()){
            case "1":
                addPerson();
                break;
            case "2":
                assignSlot();
                break;
            case "3":
                vaccineInfo();
                break;
            case "4":
                shutDown();
                break;
            default:
                System.out.println("Your answer is not valid, please choose from the options only.");
                mainMenu();
        }

    }

    /*
    asks the user tp enter information for new person
     */
    private static void addPerson() throws SQLException{
        System.out.println("Please enter your health insurance number:");
        String hinsurNum = scan.nextLine();

        System.out.println("Please enter your full name:");
        String pName = scan.nextLine();

        System.out.println("Please enter your gender:");
        String gender = scan.nextLine();

        System.out.println("Please enter your city:");
        String pCity = scan.nextLine();

        System.out.println("Please enter your street address:");
        String pStreetAddr = scan.nextLine();

        System.out.println("Please enter your postal code:");
        String pPostalCode = scan.nextLine();

        System.out.println("Please enter your birthday:");
        String bday = scan.nextLine();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date birthday = null;
        try {
            birthday = format.parse(bday);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        System.out.println("Please enter your phone number:");
        String phone = scan.nextLine();

        System.out.println("Please enter your category:");
        String cname = scan.nextLine();

        String selSQL = "SELECT 1 FROM Person WHERE hinsurNum = \'" + hinsurNum + "\'";
        System.out.println(selSQL);
        ResultSet rs = statement.executeQuery(selSQL);

        if(rs.next()){
            //health insurance number already exists
            System.out.println("The health insurance number is already associated with someone else.");
            System.out.println("Enter 1 to update the information or 2 to go back to main menu.");
            int option = scan.nextInt();
            scan.nextLine();
            if(option == 1) {
                // update person's info
                String updateSQL0 = "UPDATE Person SET pName = '" + pName + "' WHERE hinsurNum = '" + hinsurNum +"'";
                System.out.println(updateSQL0);
                statement.executeUpdate(updateSQL0);

                String updateSQL1 = "UPDATE Person SET gender = '" + gender + "' WHERE hinsurNum = '" + hinsurNum +"'";
                System.out.println(updateSQL1);
                statement.executeUpdate(updateSQL1);

                String updateSQL2 = "UPDATE Person SET pPostalCode = '" + pPostalCode + "' WHERE hinsurNum = '" + hinsurNum +"'";
                System.out.println(updateSQL2);
                statement.executeUpdate(updateSQL2);

                String updateSQL3 = "UPDATE Person SET pStreetAddr = '" + pStreetAddr + "' WHERE hinsurNum = '" + hinsurNum +"'";
                System.out.println(updateSQL3);
                statement.executeUpdate(updateSQL3);

                String updateSQL4 = "UPDATE Person SET pCity = '" + pCity + "' WHERE hinsurNum = '" + hinsurNum +"'";
                System.out.println(updateSQL4);
                statement.executeUpdate(updateSQL4);

                String updateSQL5 = "UPDATE Person SET birthday = DATE '" + bday + "' WHERE hinsurNum = '" + hinsurNum +"'";
                System.out.println(updateSQL5);
                statement.executeUpdate(updateSQL5);

                String updateSQL6 = "UPDATE Person SET phone = '" + phone + "' WHERE hinsurNum = '" + hinsurNum +"'";
                System.out.println(updateSQL6);
                statement.executeUpdate(updateSQL6);

                String updateSQL7 = "UPDATE Person SET cname = '" + cname + "' WHERE hinsurNum = '" + hinsurNum +"'";
                System.out.println(updateSQL7);
                statement.executeUpdate(updateSQL7);

                System.out.println("Person's information is updated successfully.");
                mainMenu();
            }
            else if(option == 2) mainMenu();
            else {
                System.out.println("Invalid option.");
                mainMenu();
            }
        }

        // health insurance number not exist
        // create new person
        String insertSQL = "INSERT INTO Person VALUES ('"+hinsurNum+"', '"+pName+"', '"+gender+"', '"+pPostalCode+"', '"+pStreetAddr+"', '"+pCity
                +"', DATE '" +bday+"', '"+phone+"', '"+cname+"')";
        System.out.println(insertSQL);
        statement.executeUpdate(insertSQL, Statement.RETURN_GENERATED_KEYS);
        output = statement.getGeneratedKeys();

        if(output.next()){
            System.out.println("Add person successful");
            mainMenu();
        }
        else{
            System.err.println("Failed to add person");
        }

    }

    /*
    assign a slot to a person
     */
    private static void assignSlot() throws SQLException {
        System.out.println("Slot info:");
        String vSlot = scan.nextLine();

        System.out.println("Vaccination location:");
        String vlName = scan.nextLine();

        System.out.println("Date of the slot:");
        String vaccDate = scan.nextLine();
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        Date vDate = null;
        try {
            vDate = format.parse(vaccDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        System.out.println("Time of the slot:");
        String vTime = scan.nextLine();

        // assignment date is current date
        Date asgndate = null;
        try {
            asgndate = format.parse(format.format(new Date()));
        } catch (ParseException e) {
            e.printStackTrace();
        }

        System.out.println("Vaccine brand name:");
        String vName = scan.nextLine();


        System.out.println("The person's health insurance number:");
        String hinsurnum = scan.nextLine();


        if(vDate.compareTo(asgndate) < 0){
            System.out.println("The slot date is in the past, slot assignment failed.");
            mainMenu();
        }

        // check whether the slot is already taken
        String selSQL = "SELECT COUNT(*) FROM Slots WHERE vSlot = '"+vSlot+"' AND vlName = '"+vlName+"' AND vDate = '"+vaccDate+"' AND vTime = '"+vTime+"'";
        System.out.println(selSQL);
        ResultSet r = statement.executeQuery(selSQL);
        if(Integer.parseInt(r.getString(1)) > 0){
            System.out.println("The slot is already assigned to others, slot assignment failed.");
            mainMenu();
        }

        // if the person is assigned more than 1 vials already
        String selectSQL = "SELECT COUNT(DISTINCT vialID) FROM Person WHERE hinsurnum = \'" + hinsurnum + "\'";
        System.out.println(selectSQL);
        ResultSet rs = statement.executeQuery(selectSQL);
        if (Integer.parseInt(rs.getString(1)) > 1){
            System.out.println("The person already received enough vaccination, slot assignment failed.");
            mainMenu();
        }
        // if the person is assigned 1 vaccine already
        else if (Integer.parseInt(rs.getString(2)) == 1){
            String seleSQL = "SELECT vName FROM Person WHERE hinsurnum = \'" + hinsurnum +"\'";
            ResultSet rs1 = statement.executeQuery(seleSQL);
            if(rs1.getString(1) != vName){
                System.out.println("The person was vaccinated with a different brand, slot assignment failed.");
                mainMenu();
            }
        }

        //assign slot
        String insertSQL = "INSERT INTO Slots VALUES ('"+vSlot+"', '"+vlName+", DATE '"+vaccDate+"', '"+vTime+"', DATE '"+asgndate
                +"', '"+hinsurnum+"', NULL, '"+vName+"', NULL, NULL)";
        System.out.println(insertSQL);
        try{
            statement.executeUpdate(insertSQL, Statement.RETURN_GENERATED_KEYS);
            System.out.println("Assign slots to person successfully.");
            mainMenu();
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    /*
    enter vaccination information
     */
    private static void vaccineInfo() throws SQLException {
        System.out.println("Person's health insurance number:");
        String hinsurnum = scan.nextLine();

        System.out.println("Name of the nurse:");
        String nurse = scan.nextLine();

        System.out.println("Vial number:");
        String vialID = scan.nextLine();

        System.out.println("slot info:");
        String vSlot = scan.nextLine();

        System.out.println("Batch number:");
        String batchNum = scan.nextLine();

        String upSQL = "UPDATE Slots SET vName = '"+batchNum+"' WHERE hinsurnum = '"+hinsurnum+"'";
        System.out.println(upSQL);
        statement.executeUpdate(upSQL);

        String upSQL1 = "UPDATE Slots SET vialID = '"+vialID+"' WHERE hinsurnum = '"+hinsurnum+"'";
        System.out.println(upSQL1);
        statement.executeUpdate(upSQL1);

        String upSQL2 = "UPDATE Slots SET nurse = '"+nurse+"' WHERE hinsurnum = '"+hinsurnum+"'";
        System.out.println(upSQL2);
        statement.executeUpdate(upSQL2);

        String upSQL3 = "UPDATE Slots SET vSlot = '"+vSlot+"' WHERE hinsurnum = '"+hinsurnum+"'";
        System.out.println(upSQL3);
        statement.executeUpdate(upSQL3);

        System.out.println("Vaccine information is updated successfully.");
        mainMenu();

    }

    /*
    the application terminates
     */
    private static void shutDown(){

        try{
            if(connection != null){
                connection.close();
            }
            if(statement != null){
                statement.close();
            }
            if(output != null){
                output.close();
            }
            System.out.println("Database closed");
            System.exit(status);
        } catch (SQLException e) {
            System.out.println("Fail to close database.");
            e.printStackTrace();
        }
    }

    public static void main(String[] args){
        try {
            DriverManager.registerDriver (new com.ibm.db2.jcc.DB2Driver()) ;
        } catch (Exception cnfe){
            System.out.println("Class not found");
        }

        final String dburl = "jdbc:db2://localhost:6666/cs421";
        final String user =  "";
        final String pwd = "";
        try{
            connection = DriverManager.getConnection(dburl, user, pwd);
            statement = connection.createStatement();
            System.out.println("connection successful");
            mainMenu();
        }
        catch(Exception e) {
            System.err.println("Could not connect to database");
            shutDown();
            // 1 for error
            System.exit(1);
        }
    }


}