/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author Venkata Bhargav
 */
public class Transaction {
   private String type,date,amount,name,time,mode;
   public String gettype() {
        return type;
    }
  public String gettime() {
        return time;
    }
   public String getdate() {
        return date;
    }
   public String getname() {
        return name;
    }
   public String getmode() {
        return mode;
    }
   public String getamount() {
        return amount;
    }
    public void settype(String type) {
        this.type = type;
    }
  
     public void setdate(String date) {
        this.date = date;
    }
     public void setamount(String amount) {
        this.amount = amount;
    }
     public void setname(String mob) {
        this.name = mob;
    }
     public void setmode(String rent) {
        this.mode = rent;
    }
     public void settime(String time) {
        this.time = time;
    }
}
