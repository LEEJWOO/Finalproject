package kh.nt.spring_02.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
@RequiredArgsConstructor
@AllArgsConstructor
public class Freeboard {
	private int no;
	@NonNull
	private String title;
	private String id;
	@NonNull
	private String content;
	private Timestamp createdate;
	private int viewcount;
}
