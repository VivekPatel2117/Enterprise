/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p1;

import javax.ejb.Stateless;

/**
 *
 * @author pursh
 */
@Stateless
public class NewSessionBean implements NewSessionBeanRemote {

    @Override
    public int usd_inr(int a) {
        return a*84;
    }

    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")

    @Override
    public int inr_usd(int b) {
        return b/84;
    }
}
