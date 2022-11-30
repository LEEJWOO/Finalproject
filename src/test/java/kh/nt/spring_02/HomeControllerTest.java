package kh.nt.spring_02;

import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@ExtendWith(SpringExtension.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@WebAppConfiguration
class HomeControllerTest {
	
	@Autowired
	private WebApplicationContext wac;
	private MockMvc MockMvc;

	@BeforeEach
	void setUp() throws Exception {
		this.MockMvc=MockMvcBuilders.webAppContextSetup(wac).build();
	}

	@Test
	void testHome() {
		try {
			MockMvc.perform(MockMvcRequestBuilders.post("/"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		fail("Not yet implemented");
	}

	@Test
	void testError() {
		fail("Not yet implemented");
	}

}
