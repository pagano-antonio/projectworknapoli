/*
 * package com.config;
 * 
 * import java.io.IOException;
 * 
 * import org.springframework.context.annotation.Configuration; import
 * org.springframework.web.filter.OncePerRequestFilter;
 * 
 * import jakarta.servlet.FilterChain; import jakarta.servlet.ServletException;
 * import jakarta.servlet.http.HttpServletRequest; import
 * jakarta.servlet.http.HttpServletResponse;
 * 
 * @Configuration public class AuthenticationFilter extends OncePerRequestFilter
 * {
 * 
 * @Override protected void doFilterInternal(HttpServletRequest request,
 * HttpServletResponse response, FilterChain filterChain) throws
 * ServletException, IOException { if (request.getRequestURI().contains("login")
 * || request.getRequestURI().contains("logout") ||
 * request.getRequestURI().contains("reset")) { filterChain.doFilter(request,
 * response); return; }
 * 
 * if (request.getSession().getAttribute("username") == null) {
 * response.sendRedirect(request.getContextPath() + "/login"); return; }
 * filterChain.doFilter(request, response); }
 * 
 * }
 */