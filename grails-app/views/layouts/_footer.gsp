<!--
  To change this license header, choose License Headers in Project Properties.
  To change this template file, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
    <footer th:fragment="footer" class="container">
        <hr />
        <div class="row">
            <div class="col-sm-4">
                <img th:src="@{/images/spring.png}" alt="Spring logo" />
            </div>
            <div class="col-sm-8">
                <p>
                    Powered by <a href="https://projects.spring.io/spring-boot/">Spring
                        Boot</a> y <a href="http://www.thymeleaf.org">Thymeleaf</a>.
                </p>
                <p>
                    Este proyecto fue desarrollado en IDE Eclipse + Spring Plugins (STS
                    Spring Tool), profesor Andrés Guzmán.<br /> &copy; Company 2017,
                    Inc. Todos los derechos reservados. Términos de uso y privacidad.<br />
                </p>
            </div>
        </div>
        <!-- Optional JavaScript -->
        <!-- jQuery first, then Bootstrap JS -->
        <script th:src="@{/js/jquery-3.2.1.min.js}"></script>
        <script th:src="@{/js/bootstrap.min.js}"></script>
    </footer>
</html>
