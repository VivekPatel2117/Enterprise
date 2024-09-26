/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package p1;

import javax.ejb.Remote;

/**
 *
 * @author pursh
 */
@Remote
public interface NewSessionBeanRemote {

    int usd_inr(int a);

    int inr_usd(int b);
    
}
