package controller;


import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

/**
 *
 * @author Charles
 */
public class myChecker
{
    public static boolean hasColumn(ResultSet rs, String columnName) throws SQLException {
    ResultSetMetaData rsmd = rs.getMetaData();
    int columns = rsmd.getColumnCount();
    for (int x = 1; x <= columns; x++) {
        if (columnName.equals(rsmd.getColumnName(x))) {
            return true;
        }
    }
    return false;
}
}
