package beans;
import java.util.List;
import java.util.Map;
import util.DBUtil;

public class Book {
    private String id;
    private String bookname;
    private String author;
    private String press;
    private String price;
    private DBUtil db;

    public Book() {
        db = new DBUtil();
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    // 读取所有图书信息
    public List<Map<String, String>> getAllBooks() {
        List<Map<String, String>> books = null;
        String sql = "select * from bookinfo";
        books = db.getList(sql, null);
        return books;
    }

    // 添加图书信息
    public int addBook() {
        int result = 0;
        String sql = "insert into bookinfo values(null,?,?,?,?)";
        String[] params = { bookname, author, press, price };
        result = db.update(sql, params);
        return result;
    }

    // 通过图书 id 读取图书信息
    public Map<String, String> getBook() {
        Map<String, String> book = null;
        String sql = "select * from bookinfo where id=?";
        String[] params = { id };
        book = db.getMap(sql, params);
        return book;
    }

    // 修改图书信息
    public int updateBook() {
        int result = 0;
        String sql = "update bookinfo set bookname=?,author=?,press=?,price=? where id=?";
        String[] params = { bookname, author, press, price, id };
        result = db.update(sql, params);
        return result;
    }

    // 删除图书信息
    public int delBook() {
        int result = 0;
        String sql = "delete from bookinfo where id=?";
        String[] params = { id };
        result = db.update(sql, params);
        return result;
    }
}