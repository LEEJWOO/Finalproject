package kh.nt.spring_02.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Chat {
	private String type;
	private String send;
	private String id;
	private Object data;
	public void newConnect() {
		this.type="new";
	}
	public void closeConnect() {
		this.type="close";
	}
}
