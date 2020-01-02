package cn.huazai123.maven.web.filter;

import java.io.IOException;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.filter.OncePerRequestFilter;

public class IndexFilter extends OncePerRequestFilter {

	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		String contextPath = request.getServletContext().getContextPath() + "/";
		if (request.getRequestURI().equals(contextPath) || request.getRequestURI().equals(contextPath+"index.jsp")) {
			response.sendRedirect(contextPath + "index");
		}
		filterChain.doFilter(request, response);
	}

}
