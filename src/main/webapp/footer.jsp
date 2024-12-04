<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Footer Section Begin -->
 <!-- Footer Section Begin -->

 <footer class="footer spad" style="background-color: orange;">
  <div class="container">
      <div class="row">
          <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="footer__about">
                  <div class="footer__about__logo">
                      <a href="index.jsp"><img src="img/logo.png" alt=""></a>
                  </div>
                  <p style="color: #FFF8F2;">
                      <fmt:message bundle="${bundle}"  key="footer.about.title" />
                      <br>
                      <fmt:message bundle="${bundle}"  key="footer.about.company" />
                      <br>
                      <fmt:message bundle="${bundle}"  key="footer.about.mst" />
                      <br>
                      <fmt:message bundle="${bundle}"  key="footer.about.date" />
                      <br>
                      <fmt:message bundle="${bundle}"  key="footer.about.place" />
                  </p>

              </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
              <div class="footer__widget">
                  <h6><fmt:message bundle="${bundle}"  key="footer.info.title" /></h6>
                  <ul style="color: #FFF8F2;">
                      <li><a href="#"><fmt:message bundle="${bundle}"  key="footer.info.address" /></a></li>
                      <li><a href="#"><fmt:message bundle="${bundle}"  key="footer.info.email" /></a></li>
                      <li><a href="#"><fmt:message bundle="${bundle}"  key="footer.info.phone" /></a></li>
                  </ul>

                  <br>

              </div>
          </div>
          <div class="col-lg-4 col-md-12">
              <div class="footer__widget">
                  <h6><fmt:message bundle="${bundle}"  key="footer.subscribe.title" /></h6>
                  <p><fmt:message bundle="${bundle}"  key="footer.subscribe.description" /></p>
                  <form action="#">
                      <input type="text" placeholder="<fmt:message bundle="${bundle}"  key='footer.subscribe.placeholder' />">
                      <button type="submit" class="site-btn"><fmt:message bundle="${bundle}"  key="footer.subscribe.button" /></button>
                  </form>

                  <div class="footer__widget__social">
                      <a href="#"><i class="fa fa-facebook"></i></a>
                      <a href="#"><i class="fa fa-comment"></i></a>
                      <a href="#"><i class="fa fa-instagram"></i></a>
                  </div>
              </div>
          </div>
      </div>
      <div class="row">
          <div class="col-lg-12">
              <div class="footer__copyright">
                  <div class="footer__copyright__text">
                      <p><fmt:message bundle="${bundle}"  key="footer.copyright.text" /> <script>document.write(new Date().getFullYear());</script></p>
                  </div>

                  <div class="footer__copyright__payment"></div>
              </div>
          </div>
      </div>
  </div>
</footer>
<!-- Footer Section End -->
<!-- back to top btn -->
<a href="#" class="btn-to-top back-to-top"><i class="fa fa-angle-double-up"></i></a>
