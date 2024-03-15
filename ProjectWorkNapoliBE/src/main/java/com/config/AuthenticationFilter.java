package com.config;

import java.io.IOException;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.filter.OncePerRequestFilter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Configuration
public class AuthenticationFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		if (request.getRequestURI().contains("login") || request.getRequestURI().contains("logout")
				|| request.getRequestURI().contains("reset")) {
			filterChain.doFilter(request, response);
			return;
		}

		// Verifica se l'utente è autenticato
		if (request.getSession().getAttribute("username") == null) {
			// L'utente non è autenticato, reindirizzalo alla pagina di login
			response.sendRedirect(request.getContextPath() + "/login");
			return;
		}

		// L'utente è autenticato, continua con la richiesta
		filterChain.doFilter(request, response);
	}

}
