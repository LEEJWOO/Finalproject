package kh.nt.spring_02;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@WebAppConfiguration
public class FreeboardControllerTest {

	@Autowired
	private WebApplicationContext wac;
	
	private MockMvc mockMvc;

	@Before
	public void setUp() throws Exception {
		this.mockMvc=MockMvcBuilders.webAppContextSetup(wac).build();
	}

	@Test
	public void testhome() {
		try {
			mockMvc.perform(get("/freeboard/home").param("page","1")).andDo(print());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@Test
	public void testview() {
		try {
			mockMvc.perform(get("/freeboard/view").param("no","31")).andDo(print());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
