package kh.nt.spring_02.model;

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
public class Freefile {
	@NonNull
	private String uuid;
	private int no;
	@NonNull
	private String id;
	@NonNull
	private String name;
}
