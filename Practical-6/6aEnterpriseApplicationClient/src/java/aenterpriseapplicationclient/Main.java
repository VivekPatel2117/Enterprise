/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package aenterpriseapplicationclient;

import java.util.Scanner;
import javax.ejb.EJB;
import p1.NewSessionBeanRemote;

/**
 *
 * @author pursh
 */
public class Main {
    @EJB
    private static NewSessionBeanRemote newSessionBean;

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner s = new Scanner(System.in);
        int a = s.nextInt();
        int b = newSessionBean.inr_usd(a);
        System.out.println("Conversion from Inr to USD=" + b);
    }
    
}
