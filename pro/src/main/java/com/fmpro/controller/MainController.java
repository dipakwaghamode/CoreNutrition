package com.fmpro.controller;
 
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 
import com.fmpro.dao.OrderDAO;
import com.fmpro.dao.ProductDAO;
import com.fmpro.dao.RegisterDAO;
import com.fmpro.entity.Account;
import com.fmpro.entity.Area;
import com.fmpro.entity.Order;
import com.fmpro.entity.Product;
import com.fmpro.form.CustomerForm;
import com.fmpro.model.CartInfo;
import com.fmpro.model.CustomerInfo;
import com.fmpro.model.OrderInfo;
import com.fmpro.model.ProductInfo;
import com.fmpro.pagination.PaginationResult;

import com.fmpro.utils.Utils;
import com.fmpro.validator.CustomerFormValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
 
@Controller
@Transactional
public class MainController {
 
   @Autowired
   private OrderDAO orderDAO;
 
   @Autowired
   private ProductDAO productDAO;
 
   @Autowired
   private CustomerFormValidator customerFormValidator;
   
   
   @Autowired
   RegisterDAO registerDAO;
   
  
 
   @InitBinder
   public void myInitBinder(WebDataBinder dataBinder) {
      Object target = dataBinder.getTarget();
      if (target == null) {
         return;
      }
      System.out.println("Target=" + target);
 
      // Case update quantity in cart
      // (@ModelAttribute("cartForm") @Validated CartInfo cartForm)
      if (target.getClass() == CartInfo.class) {
 
      }
 
      // Case save customer information.
      // (@ModelAttribute @Validated CustomerInfo customerForm)
      else if (target.getClass() == CustomerForm.class) {
         dataBinder.setValidator(customerFormValidator);
      }
 
   }
 
   @RequestMapping("/403")
   public String accessDenied() {
      return "/403";
   }
 
   
   // home page read
   
   @RequestMapping("/foodmantra")
   public String home() {
      return "index";
   }
 
   // aboutus page read
   @RequestMapping("/foodmantra-aboutus")
   public String aboutus() {
      return "aboutus";
   }
 

   
   // Menu List
   @RequestMapping({ "/foodmantra-menuList" })
   public String listProductHandler(Model model, //
         @RequestParam(value = "name", defaultValue = "") String likeName,
         @RequestParam(value = "page", defaultValue = "1") int page) {
      final int maxResult = 20;
      final int maxNavigationPage = 10;
 
      PaginationResult<ProductInfo> result = productDAO.queryProducts(page, //
            maxResult, maxNavigationPage, likeName);
 
      model.addAttribute("paginationProducts", result);
      return "foodmantra-menuList";
   }
 
   @RequestMapping({ "/foodmantra-buyProduct" })
   public String listProductHandler(HttpServletRequest request, Model model, //
         @RequestParam(value = "code", defaultValue = "") String code) {
 
      Product product = null;
      if (code != null && code.length() > 0) {
         product = productDAO.findProduct(code);
      }
      if (product != null) {
 
         //
         CartInfo cartInfo = Utils.getCartInSession(request);
 
         ProductInfo productInfo = new ProductInfo(product);
 
         cartInfo.addProduct(productInfo, 1);
      }
 
      return "redirect:/foodmantra-menuCart";
   }
 
   @RequestMapping({ "/foodmantra-menuCartRemoveProduct" })
   public String removeProductHandler(HttpServletRequest request, Model model, //
         @RequestParam(value = "code", defaultValue = "") String code) {
      Product product = null;
      if (code != null && code.length() > 0) {
         product = productDAO.findProduct(code);
      }
      if (product != null) {
 
         CartInfo cartInfo = Utils.getCartInSession(request);
 
         ProductInfo productInfo = new ProductInfo(product);
 
         cartInfo.removeProduct(productInfo);
 
      }
 
      return "redirect:/foodmantra-menuCart";
   }
 
   // POST: Update quantity for MENU in cart
   @RequestMapping(value = { "/foodmantra-menuCart" }, method = RequestMethod.POST)
   public String menuCartUpdateQty(HttpServletRequest request, //
         Model model, //
         @ModelAttribute("cartForm") CartInfo cartForm) {
 
      CartInfo cartInfo = Utils.getCartInSession(request);
      cartInfo.updateQuantity(cartForm);
 
      return "redirect:/foodmantra-menuCart";
   }
   
   
 
   // GET: Show cart.
   @RequestMapping(value = { "/foodmantra-menuCart" }, method = RequestMethod.GET)
   public String menuCartHandler(HttpServletRequest request, Model model) {
      CartInfo myCart = Utils.getCartInSession(request);
 
      model.addAttribute("cartForm", myCart);
      return "foodmantra-menuCart";
   }
 
   // GET: Enter customer information.
   @RequestMapping(value = { "/foodmantra-adduser" }, method = RequestMethod.GET)
   public String adduserForm(HttpServletRequest request, Model model) {
 
      CartInfo cartInfo = Utils.getCartInSession(request);
 
      if (cartInfo.isEmpty()) {
 
         return "redirect:/foodmantra-menuCart";
      }
      CustomerInfo customerInfo = cartInfo.getCustomerInfo();
 
      CustomerForm customerForm = new CustomerForm(customerInfo);
 
      model.addAttribute("customerForm", customerForm);
 
      return "foodmantra-adduser";
   }
 
   // POST: Save customer information.
   @RequestMapping(value = { "/foodmantra-adduser" }, method = RequestMethod.POST)
   public String adduserSave(HttpServletRequest request, //
         Model model, //
         @ModelAttribute("customerForm") @Validated CustomerForm customerForm, //
         BindingResult result, //
         final RedirectAttributes redirectAttributes) {
 
      if (result.hasErrors()) {
         customerForm.setValid(false);
         // Forward to reenter customer info.
         return "foodmantra-adduser";
      }
 
      customerForm.setValid(true);
      CartInfo cartInfo = Utils.getCartInSession(request);
      CustomerInfo customerInfo = new CustomerInfo(customerForm);
      cartInfo.setCustomerInfo(customerInfo);
 
      return "redirect:/foodmantra-userConfirmation";
   }
 
   // GET: Show information to confirm.
   @RequestMapping(value = { "/foodmantra-userConfirmation" }, method = RequestMethod.GET)
   public String userConfirmationReview(HttpServletRequest request, Model model) {
      CartInfo cartInfo = Utils.getCartInSession(request);
 
      if (cartInfo == null || cartInfo.isEmpty()) {
 
         return "redirect:/foodmantra-menuCart";
      } else if (!cartInfo.isValidCustomer()) {
 
         return "redirect:/foodmantra-adduser";
      }
      model.addAttribute("myCart", cartInfo);
 
      return "foodmantra-userConfirmation";
   }
   
   
   
   
   
   
   
   
   
 
   // POST: Submit Cart (Save)
   @RequestMapping(value = { "/foodmantra-userConfirmation" }, method = RequestMethod.POST)
   public String userConfirmationSave(HttpServletRequest request, Model model) {
      CartInfo cartInfo = Utils.getCartInSession(request);
 
      if (cartInfo.isEmpty()) {
 
         return "redirect:/foodmantra-menuCart";
      } else if (!cartInfo.isValidCustomer()) {
 
         return "redirect:/foodmantra-adduser";
      }
      try {
         orderDAO.saveOrder(cartInfo);
      } catch (Exception e) {
 
         return "foodmantra-userConfirmation";
      }
 
      // Remove Cart from Session.
      Utils.removeCartInSession(request);
 
      // Store last cart.
      Utils.storeLastOrderedCartInSession(request, cartInfo);
 
      return "redirect:/foodmantra-userCartFinalize";
     // return "redirect:/foodmantra-payment";
      
   }
   
   
   
   
   
   
   
 
   @RequestMapping(value = { "/foodmantra-userCartFinalize" }, method = RequestMethod.GET)
   public String shoppingCartFinalize(HttpServletRequest request, Model model) {
 
      CartInfo lastOrderedCart = Utils.getLastOrderedCartInSession(request);
 
      if (lastOrderedCart == null) {
         return "redirect:/menuCart";
      }
      model.addAttribute("lastOrderedCart", lastOrderedCart);
      model.addAttribute("payment",1);
      return "foodmantra-userCartFinalize";
   }
 
  
   
   
   
   
   
   
   
   @RequestMapping(value = { "/productImage" }, method = RequestMethod.GET)
   public void productImage(HttpServletRequest request, HttpServletResponse response, Model model,
         @RequestParam("code") String code) throws IOException {
      Product product = null;
      if (code != null) {
         product = this.productDAO.findProduct(code);
      }
      if (product != null && product.getImage() != null) {
         response.setContentType("image/jpeg, image/jpg, image/png, image/gif");
         response.getOutputStream().write(product.getImage());
      }
      response.getOutputStream().close();
   }
   
   
   
   
   
 
   
   
   
 
    //POST: Save manager information.
   @RequestMapping(value = { "/register-manager" }, method = RequestMethod.POST)
   public String managerDataSave(HttpServletRequest request, //
         Model model,		 //
         @ModelAttribute("manager")
         @RequestBody Account account) {
	   	
	   	registerDAO.saveManager(account);
     
	   	
      
      return "redirect:/foodmantra/login";
   }
   
   
   
   @GetMapping("/admin")
   public ModelAndView getManagerData() {
	   ModelAndView mv = new ModelAndView("register-manager");
	   return mv;
   }
   

   
   // payment ---
   
   
   
   @GetMapping("/foodmantra-payment")
   public ModelAndView patientPayOPt() {      //12
     OrderInfo order=orderDAO.getOrder("16155347-79e1-4189-998d-a7c183be2a7f");
    		 System.out.println(order);
    		           
     ModelAndView mv=new ModelAndView("paymentOption");

     return mv;       
    }
   
   
   
   
   
   
   

   @PostMapping("/patientpay")
       public String patientpay( String cardnum , String  exp, String cvv ) {
	   String checkcardnum="987654321098";
  	 String checkexp="07/25";
  	 String checkcvv="777";
  	
  	 if(checkcardnum.equals(cardnum) && checkexp.equals(exp) && checkcvv.equals(cvv))
  	 {
  	  // ModelAndView mv=new ModelAndView("paymentOption");
  	   return  "redirect:/foodmantra-userCartFinalize";
  	 }
	
	   return null;
	   
       }
   
   
   
   
   
   
   
   
   
   
   
   
   
 
}
