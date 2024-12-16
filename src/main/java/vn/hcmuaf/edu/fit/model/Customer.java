package vn.hcmuaf.edu.fit.model;

public class Customer {
    private String MAKH;
    private String TENKH;
    private String EMAIL;
    private String MATAIKHOAN;
    private String DIACHI;
    private String SDT;
    private int role;

    public Customer(String MAKH, String TENKH, String MATAIKHOAN, String DIACHI, String SDT, int role) {
        System.out.println("Calling constructor with 6 parameters");
        this.MAKH = MAKH;
        this.TENKH = TENKH;
        this.MATAIKHOAN = MATAIKHOAN;
        this.DIACHI = DIACHI;
        this.SDT = SDT;
        this.role = role;
    }

    public Customer(String MAKH, String TENKH, String EMAIL, String MATAIKHOAN, String DIACHI, String SDT, int role) {
        System.out.println("Calling constructor with 7 parameters");
        this.MAKH = MAKH;
        this.TENKH = TENKH;
        this.EMAIL = EMAIL;
        this.MATAIKHOAN = MATAIKHOAN;
        this.DIACHI = DIACHI;
        this.SDT = SDT;
        this.role = role;
    }

    public static Customer createWithEmail(String MAKH, String TENKH, String EMAIL, String MATAIKHOAN, String DIACHI, String SDT, int role) {
        return new Customer(MAKH, TENKH, EMAIL, MATAIKHOAN, DIACHI, SDT, role);
    }

    public Customer() {

    }

    public String getMAKH() {
        return MAKH;
    }

    public void setMAKH(String MAKH) {
        this.MAKH = MAKH;
    }

    public String getTENKH() {
        return TENKH;
    }

    public void setTENKH(String TENKH) {
        this.TENKH = TENKH;
    }

    public String getMATAIKHOAN() {
        return MATAIKHOAN;
    }

    public void setMATAIKHOAN(String MATAIKHOAN) {
        this.MATAIKHOAN = MATAIKHOAN;
    }

    public String getDIACHI() {
        return DIACHI;
    }

    public void setDIACHI(String DIACHI) {
        this.DIACHI = DIACHI;
    }

    public String getSDT() {
        return SDT;
    }

    public void setSDT(String SDT) {
        this.SDT = SDT;
    }

    public String getRole() {
        if (this.role == 0) {
            return "Thường";
        } else if (this.role == 1) {
            return "Admin";
        }
        return "Khóa";
    }

    public int getRoleNo() {
        return this.role;
    }


    public void setRole(int role) {
        this.role = role;
    }

    public String getEMAIL() {
        return EMAIL;
    }

    public void setEMAIL(String EMAIL) {
        this.EMAIL = EMAIL;
    }

    @Override
    public String toString() {
        return "Customer{" +
                "MAKH='" + MAKH + '\'' +
                ", TENKH='" + TENKH + '\'' +
                ", MATAIKHOAN='" + MATAIKHOAN + '\'' +
                ", DIACHI='" + DIACHI + '\'' +
                ", SDT='" + SDT + '\'' +
                '}';
    }
}
